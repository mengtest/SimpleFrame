---
--- 客户端请求例子
--- Created by admin.
--- DateTime: 2018/9/7 16:00
---

local client=require "tcpclient"

local Hander={}

function login_login(msg)
    print(msg.error)
    if msg.error=="login success" then
        print("account:"..msg.account.." success")
    else
        print("account:"..msg.account..",login err:",msg.error)
    end

end

function create_room(msg)
    print("create_room ret:"..msg.result)
end


function enter_room(msg)
    print("enter_room ret:"..msg.result)
    --ws.leave_room()
end

function leave_room(msg)
    print("leave_room ret:"..msg.result)
end

function game_start(msg)
    print("ddz game start")
end

function Hander.CallBack(cmd,check,msg)
    funcname=string.gsub(cmd,"%.","_")
    if _G[funcname] then
        _G[funcname](msg)
    end
end

client.init("127.0.0.1",11200,Hander)
client.login("king","111111")
client.start()


