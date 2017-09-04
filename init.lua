-- playerxp Mod by ManElevation
-- contributers azekill_DIABLO, rubenwardy
-- should add this codes to mod.config for server
-- default_privs = mnoob
-- initial_stuff = playerxp:guide


-- dofile
dofile(minetest.get_modpath("playerxp").."/infoblock.lua")
dofile(minetest.get_modpath("playerxp").."/ranks.lua")
dofile(minetest.get_modpath("playerxp").."/onjoin.lua")


-- privs
minetest.register_privilege("mnoob", {description = "Noob Priv.", give_to_singleplayer = true})
minetest.register_privilege("mregular", {description = "Regular Priv.", give_to_singleplayer = true})
minetest.register_privilege("mexperience", {description = "Experience Priv.", give_to_singleplayer = true})
minetest.register_privilege("mspecialist", {description = "Specialist Priv.", give_to_singleplayer = true})
minetest.register_privilege("mexpert", {description = "Expert Priv.", give_to_singleplayer = true})
minetest.register_privilege("mboss", {description = "Boss Priv.", give_to_singleplayer = true})
minetest.register_privilege("mmoderator", {description = "Moderator Priv.", give_to_singleplayer = true})
minetest.register_privilege("mhelper", {description = "Helper Priv.", give_to_singleplayer = true})
minetest.register_privilege("madmin", {description = "Admin Priv.", give_to_singleplayer = true})


-- playerxp
playerxp = {}


--- load
minetest.log("playerxpmodloaded")






























