local kill_say = gui.add_checkbox("killsay", "LUA>TAB A");
local faggot_counter_only = gui.add_checkbox("faggot counter only", "LUA>TAB A")
local remember_last_server_session = gui.add_checkbox("remember server last killcount after leaving", "LUA>TAB A")



local faggotKilled = 0

--[[function on_create_move(cmd, send_packet)
    if remember_last_server_session:get_bool() then

        local currentServerSave = info.server.address

        database.save(currentServerSave, database_template)

    end
end]]--

function on_shot_registered(shot_info)
        if kill_say:get_bool() then
            local enemy_player_info = engine.get_player_info(shot_info.target)
            local enemy_name =  engine.get_player_info(shot_info.target).name
            local enemy_health = entities.get_entity(shot_info.target):get_prop('m_iHealth')

            local killsayShit = {
              enemy_name .. " HAHAHA GET THREESOME'D BY FBI, CIA AND ALL OTHER FEDS ",
             "OWNED BY AZ1O HIMSELF (what a nn fr)",
              "Morgensthern.lua ontop!",
               "Sponsored by gamesense.lt",
                enemy_name .. " FAGGOT OWNED 1",
               "HAHAHA " .. enemy_name .. " IS A FAGGOT AND GOT RAPED BY MORGENSHERN.LUA (currenty pasted)",
               "Faggots killed in this session: " .. faggotKilled .. " Lastest faggot owned is: " .. enemy_name
            }

            

            faggotKilled = faggotKilled + 1

            local faggotCounter = "Faggots killed in this session: " .. faggotKilled .. ". Lastest faggot owned is: " .. enemy_name .. "."

            local nextKillsay = utils.random_int(0, 7)



            if shot_info.result == 'hit' and enemy_health <= 0 and faggot_counter_only:get_bool() then 
                engine.exec("say " .. faggotCounter)
            elseif shot_info.result == 'hit' and enemy_health <= 0 and not faggot_counter_only:get_bool() then 
                engine.exec("say " .. killsayShit[nextKillsay])
            end

        end
end
