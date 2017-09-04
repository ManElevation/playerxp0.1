-- Noob on join
minetest.register_on_joinplayer(function(player)
      local player_name = player:get_player_name()
      local privs = minetest.get_player_privs(player_name)
      if privs['mnoob'] == true then
            minetest.chat_send_all("Give a warm welcome to "..player:get_player_name()..", Noob!")
      end
end)
-- Regular on join
minetest.register_on_joinplayer(function(player)
      local player_name = player:get_player_name()
      local privs = minetest.get_player_privs(player_name)
       if privs['mregular'] == true then
            minetest.chat_send_all("Give a warm welcome to "..player:get_player_name()..", Regular!")
      end
end)
-- Experience on join
minetest.register_on_joinplayer(function(player)
      local player_name = player:get_player_name()
      local privs = minetest.get_player_privs(player_name)
       if privs['mexperience'] == true then
            minetest.chat_send_all("Give a warm welcome to "..player:get_player_name()..", Experience!")
      end
end)
-- Specialist on join
minetest.register_on_joinplayer(function(player)
      local player_name = player:get_player_name()
      local privs = minetest.get_player_privs(player_name)
       if privs['mspecialist'] == true then
            minetest.chat_send_all("Give a warm welcome to "..player:get_player_name()..", Specialist!")
      end
end)
-- Expert on join
minetest.register_on_joinplayer(function(player)
      local player_name = player:get_player_name()
      local privs = minetest.get_player_privs(player_name)
       if privs['mexpert'] == true then
            minetest.chat_send_all("Give a warm welcome to "..player:get_player_name()..", Expert!")
      end
end)
-- Boss on join
minetest.register_on_joinplayer(function(player)
      local player_name = player:get_player_name()
      local privs = minetest.get_player_privs(player_name)
       if privs['mboss'] == true then
            minetest.chat_send_all("Give a warm welcome to "..player:get_player_name()..", Boss!")
      end
end)
-- Moderator on join
minetest.register_on_joinplayer(function(player)
      local player_name = player:get_player_name()
      local privs = minetest.get_player_privs(player_name)
       if privs['mmoderator'] == true then
            minetest.chat_send_all("Give a warm welcome to "..player:get_player_name()..", Moderator!")
      end
end)
-- Helper on join
minetest.register_on_joinplayer(function(player)
      local player_name = player:get_player_name()
      local privs = minetest.get_player_privs(player_name)
       if privs['mhelper'] == true then
            minetest.chat_send_all("Give a warm welcome to "..player:get_player_name()..", Helper!")
      end
end)
-- ADMIN on join
minetest.register_on_joinplayer(function(player)
      local player_name = player:get_player_name()
      local privs = minetest.get_player_privs(player_name)
       if privs['madmin'] == true then
            minetest.chat_send_all("Give a warm welcome to "..player:get_player_name()..", Admin!")
      end
end)