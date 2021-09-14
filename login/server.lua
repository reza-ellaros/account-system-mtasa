local db = exports.mysql:getmysql()
 


function reg(player,user,pass,repass)

    if not pass then 
      
        return false
    end

    if pass == repass then 
    isac = dbQuery(db,"SELECT * FROM accounts WHERE username=?",user)
    res = dbPoll(isac,-1)

        if #res > 0 then 
            outputChatBox("user tekrarie",player,255,0,0,true)
        else
            isac2 = dbQuery(db,"SELECT * FROM accounts WHERE serial=?",getPlayerSerial(player))
            res2 = dbPoll(isac2,-1)

            if #res2 > 0 then 
                outputChatBox("shoma account darid ",player,255,0,0,true)
            else

                regshod = dbExec(db,"INSERT INTO accounts SET username=?,password=?,serial=?,ip=?,x=?,y=?,z=?,rz=?",user,pass,getPlayerSerial(player),getPlayerIP(player),0,0,3,90)
                if regshod then 
                    outputChatBox("register shod",player,0,255,0,true)

                else
                    outputChatBox("register nashod",player,0,255,0,true)
                end
            end
        end
    else 
        outputChatBox("pass = repass nist !!",player,255,0,0,true)
    end
end
addEvent("regj",true)
addEventHandler("regj",root,reg)

function log(player,user,pass)
    if not pass then 

        return false
    end
    log = dbQuery(db,"SELECT * FROM accounts WHERE username=?",user)
    res = dbPoll(log,-1)

    if #res >0 then

        for i,row in ipairs(res) do
            if tostring(row.password) == pass then
                if tostring(row.serial) == getPlayerSerial(player) then
                    outputChatBox("login shodid",player,0,255,0,true)                     
                    setPlayerName(player,user)
                    spawnPlayer(player, row.x,row.y,row.z,row.rz)
                    fadeCamera(player, true)
                    setCameraTarget(player, player)
                   triggerClientEvent(player,"onlogin",player)
                else
                    outputChatBox("in account shoma nist",player,255,0,0,true)
                end
            else
                outputChatBox("pass eshtebahe",player,255,0,0,true)
            end 
        end

    else
        outputChatBox("in user vojod nadarad",player,255,0,0,true)
    end
end
 addEvent("logj",true)
 addEventHandler("logj",root,log)


function onquit()

    money = getPlayerMoney(source) 
    heal = getElementHealth(source) 
    skin = getElementModel(source)
    x,y,z = getElementPosition(source)
    rx1,ry1,rz1 = getElementRotation(source)

    log = dbQuery(db,"SELECT * FROM accounts WHERE username=?",getPlayerName(source))
    res = dbPoll(log,-1)

    if #res > 0 then 

 dbQuery(db,"UPDATE accounts SET x=?, y=?, z=?, rz=?  WHERE username=?",x,y,z,rz1,getPlayerName(source))

    end
end
addEventHandler("onPlayerQuit",root,onquit)






function cam ()
if getElementData( source, "login",true ) then 
return false
end
fadeCamera( source,true,5 )
setCameraMatrix( source, 1457.1845703125,-878.5009765625,54.795349121094,0,0,90 )

end
addEventHandler("onPlayerJoin",root,cam)


