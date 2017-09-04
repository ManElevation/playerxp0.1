---------------------------------------------DISABLE THIS IF YOU HAVE MDECTOR MOD---------------------------------------------
-- Compresed Mese
minetest.register_node("playerxp:compresedmese", {
	description = "Compresed Mese",
	tiles = {"mdector_compresedmese.png"},
	inventory_image = minetest.inventorycube("mdector_compresedmese.png"),
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = true,
	groups = {cracky = 1, level = 2},
	sounds = default.node_sound_stone_defaults(),
	light_source = 3,
})

minetest.register_craft({
	output = 'playerxp:compresedmese 1',
	recipe = {
		{'default:mese_crystal', 'default:mese_crystal', 'default:mese_crystal'},
		{'default:mese_crystal', 'default:mese', 'default:mese_crystal'},
		{'default:mese_crystal', 'default:mese_crystal', 'default:mese_crystal'},
	}
})
---------------------------------------------------------------------------------------------------------------------------------------------------
-- 2nd Most Expensive Block
minetest.register_node("playerxp:2ndexpensive_block", {
	description = "2nd Most Expensive Block",
	tiles = {"2ndexpensive_block.jpg"}, 
	groups = {cracky = 3},
	sounds = default.node_sound_wood_defaults(),	
})
-- 2nd Most Expensive Block Craft
minetest.register_craft({
	output = "playerxp:2ndexpensive_block",
	recipe = {
		{"default:diamondblock", "default:diamondblock","default:diamondblock"},
		{"default:diamondblock", "default:diamondblock","default:diamondblock"},
		{"default:diamondblock", "default:diamondblock", "default:diamondblock"}
	}
})


-- 1st Most Expensive Block
minetest.register_node("playerxp:1stexpensive_block", {
	description = "1st Most Expensive Block -- When digged, it dissapears (Can only be placed once)",
	tiles = {"1stexpensive_block.jpg"}, 
	--drop = "playerxp:2ndexpensive_block",
	groups = {cracky = 3},
	sounds = default.node_sound_wood_defaults(),	
})
-- 1st Most Expensive Block Craft
minetest.register_craft({
	output = "playerxp:1stexpensive_block",
	recipe = {
		{"playerxp:2ndexpensive_block", "playerxp:2ndexpensive_block","playerxp:2ndexpensive_block"},
		{"playerxp:2ndexpensive_block", "playerxp:2ndexpensive_block","playerxp:2ndexpensive_block"},
		{"playerxp:2ndexpensive_block", "playerxp:2ndexpensive_block", "playerxp:2ndexpensive_block"}
	}
})

---------------------------------------------------------------------------------------------------------------------------------------------------


--Level 1
-- When you place cobble you become a regular player
minetest.override_item("default:cobble", {
   after_place_node = function(pos, placer, itemstack, pointed_thing)
      local player_name = placer:get_player_name()
      local privs = minetest.get_player_privs(player_name)
      if not privs['mregular'] == true then
         privs['mregular'] = true
		 privs['mnoob'] = false
         minetest.set_player_privs(player_name, privs)
         core.chat_send_player(player_name, '**Now your not a Noob! Your a Regular Player!**')
      end
   end,
})


--Level 2
-- When you place Diamond Block you become a Experienced player
minetest.override_item("default:diamondblock", {
   after_place_node = function(pos, placer, itemstack, pointed_thing)
      local player_name = placer:get_player_name()
      local privs = minetest.get_player_privs(player_name)
      if not privs['mexperience'] == true then
         privs['mexperience'] = true
		 privs['mregular'] = false
         minetest.set_player_privs(player_name, privs)
         core.chat_send_player(player_name, '**Now your not a Regular Player! Your a Experienced Player!**')
      end
   end,
})

--Level 3
-- When you place Compresed Mese Block you become a Experienced player
minetest.override_item("playerxp:compresedmese", {
   after_place_node = function(pos, placer, itemstack, pointed_thing)
      local player_name = placer:get_player_name()
      local privs = minetest.get_player_privs(player_name)
      if not privs['mspecialist'] == true then
         privs['mspecialist'] = true
		 privs['mexperience'] = false
         minetest.set_player_privs(player_name, privs)
         core.chat_send_player(player_name, '**Now your not a Experienced player! Your a Specialist Player!**')
      end
   end,
})

-- Level 4	
-- When you place Diamond Block you become a regular player
minetest.override_item("playerxp:2ndexpensive_block", {
   after_place_node = function(pos, placer, itemstack, pointed_thing)
      local player_name = placer:get_player_name()
      local privs = minetest.get_player_privs(player_name)
      if not privs['mexpert'] == true then
         privs['mexpert'] = true
		 privs['mspecialist'] = false
         minetest.set_player_privs(player_name, privs)
         core.chat_send_player(player_name, '**Now your not a Specialist player! Your a Expert Player!**')
      end
   end,
})

-- Level 5	
-- When you place Diamond Block you become a regular player
minetest.override_item("playerxp:1stexpensive_block", {
   after_place_node = function(pos, placer, itemstack, pointed_thing)
      local player_name = placer:get_player_name()
      local privs = minetest.get_player_privs(player_name)
      if not privs['mboss'] == true then
         privs['mboss'] = true
		 privs['fly'] = true
		 privs['mexpert'] = false
         minetest.set_player_privs(player_name, privs)
         core.chat_send_player(player_name, '**Now your not a Expert Player! Your a Boss!**')
		 core.chat_send_player(player_name, '**You can now fly!**')
      end
   end,
})
