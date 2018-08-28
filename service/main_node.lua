local skynet=require "skynet"

local runconfig=require(skynet.getenv("runconfig"))
local serverconf=runconfig.service
local nodename=skynet.getenv("nodename")

local function start_debug_console()
	for i,v in pairs(serverconf.debug_console) do
		if nodename==v.node then
			skynet.uniqueservice("debug_console",v.port)
			skynet.error("start debug_console port"..v.port)
		end
	end
end

local function start_dbporxy()
	for i,v in pairs(serverconf.dbproxy) do
		if nodename==v.node then
			skynet.newservice("dbproxy","dbproxy",i)
			skynet.error("start dbproxy")
		end
	end
end

skynet.start(function()
	skynet.error("server start")
	start_debug_console()
	start_dbporxy()
	skynet.exit()
end)