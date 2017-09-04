local playerxp_Book_title="Help Guide -- Ranks"

local playerxp_Tab_Text_1="\nLevel 1 = Noob -- Place 1 Cobble stone\nLevel 2 = Regular -- Place Diamond Block\nLevel 3 = Experienced -- Place Compressed Mese Block\nLevel 4 = Specialist --  Place (1) 2nd Expensive Block\nLevel 5 = Expert -- Place (1) 1st Expensive Block\n---------------------------------------------------------------------------------------------------------------------------------------------------------------------\nWhen you complete Level 5 you become a (Boss) and get Fly Priv"                                                                                                              

local playerxp_Tab_1="Server"

local function playerxp_guide(user,text_to_show)
local text=""
if text_to_show==1 then text=playerxp_Tab_Text_1 end

local form="size[8.5,9]" ..default.gui_bg..default.gui_bg_img..
	"button[0,0;1.5,1;tab1;" .. playerxp_Tab_1 .. "]" ..
	"button_exit[7.5,0; 1,1;tab6;X]" ..
	"label[0,1;"..text .."]"
minetest.show_formspec(user:get_player_name(), "playerxp",form)
end

minetest.register_on_player_receive_fields(function(player, form, pressed)
	if form=="playerxp" then
	if pressed.tab1 then playerxp_guide(player,1) end
	end
end)


minetest.register_tool("playerxp:book", {
	description = serverguide_Book_title,
	inventory_image = "default_book.png",
	on_use = function(itemstack, user, pointed_thing)
	playerxp_guide(user,1)
	return itemstack
	end,
on_place = function(itemstack, placer, pointed_thing)
	local pos = pointed_thing.under
	local node = minetest.get_node_or_nil(pos)
	local def = node and minetest.registered_nodes[node.name]
	if not def or not def.buildable_to then
		pos = pointed_thing.above
		node = minetest.get_node_or_nil(pos)
		def = node and minetest.registered_nodes[node.name]
		if not def or not def.buildable_to then return itemstack end
	end
	if minetest.is_protected(pos, placer:get_player_name()) then return itemstack end
	local fdir = minetest.dir_to_facedir(placer:get_look_dir())
	minetest.set_node(pos, {name = "playerxp:guide",param2 = fdir,})
	itemstack:take_item()
	return itemstack
end
})
minetest.register_alias("guide", "playerxp:book")
minetest.register_craft({output = "playerxp:book",recipe = {{"default:stick","default:stick"},}})


minetest.register_node("playerxp:guide", {
	description = "Info Block -- Ranks",
	tiles = {"info_block.png"},
	groups = {cracky=1,oddly_breakable_by_hand=3},
	sounds=default.node_sound_wood_defaults(),
on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("infotext", playerxp_Book_title)
end,
on_rightclick = function(pos, node, clicker)
	playerxp_guide(clicker,1)
end

})
minetest.register_craft({
	output = "playerxp:guide",
	recipe = {
		{"wool:blue"},
		{"default:steel_ingot"}
	}
})

minetest.register_on_newplayer(function(player)
player:get_inventory():add_item("main", "playerxp:book")
end)

minetest.register_chatcommand("guide", {
	params = "",
	description = playerxp_Book_title,
	func = function(name, param)
		playerxp_guide(minetest.get_player_by_name(name),1)
		return true
	end
})
