local os = require('os')
local io = require('io')
local json = require('json')
local timer = require('timer')

--
-- Read and parse the plugin file.
--
plugin_file = io.open('plugin.json', 'r')
plugin_json = plugin_file:read("*all")
plugin_info = json.parse(plugin_json)
plugin_file:close()

--
--  Read the parameter file.  It will contain an array of items which define
--  the counter metrics to collect.
--
param_file = io.open('param.json', 'r')
params_json = param_file:read("*all")
params = json.parse(params_json)
param_file:close()

--
-- Loop through each metric and store the parameters.  Currently supported are
-- counter= The counter path
-- factor=  The multiplication factor for the counter value.
--

local metrics = {}
for _,item in pairs(params.items) do
	metrics[item.metric] = {counter = item.counter, factor = item.factor, interval=item.interval}
end

--
-- Create the .ini file that the meter will parse.
-- The filename needs to be [plugin_name]_pdh.ini
-- Creating the .ini file is the purpose of the plugin.
-- What ever after this is to make sure that the plugin does not exit.
--
file = io.open("plugin_pdh.ini", "w")

for k, v in pairs(metrics) do
	file:write("[".. k .. "]\n")
	file:write("  counter=".. v.counter.."\n")
	if (v.factor ~= nil) then
	    file:write("  factor=".. v.factor.."\n")
	end
	if (v.interval ~= nil) then
	    file:write("  interval_sec=".. v.interval.."\n")
	end
end
file:close()

--Plugin start event.
print ("_bevent:"..plugin_info.name.." version " .. plugin_info.version .. " Started|t:info")

--Dummy function to be called after every polling interval.
--
function dummy()
	--Do Nothing.
end

--Setting the polling interval. This will make sure that the dummy function is called after the specified
--interval is expired. This is to make sure that the plugin does not exit. If the plugin exits
--the meter will restart the plugin.
timer.setInterval(300000, dummy)
