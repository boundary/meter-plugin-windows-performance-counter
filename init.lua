local os = require('os')
local io = require('io')
local json = require('json')

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
	metrics[item.metric] = {counter = item.counter, factor = item.factor}
end

--
-- Create the .ini file that the meter will parse.
-- The filename needs to be [plugin_name]_pdh.ini
--
--
file = io.open("win_pdh_test_pdh.ini", "w")

if (params.pollInterval ~= nil) then
    file:write("interval_sec=" .. params.pollInterval .. "\n")
end

for k, v in pairs(metrics) do
	file:write("[".. k .. "]\n")
	file:write("  counter=".. v.counter.."\n")
	if (v.factor ~= nil) then
	    file:write("  factor=".. v.factor.."\n")
	end
end
file:close()

--
-- Send our startup event
--

print ("_bevent:"..plugin_info.name.." version " .. plugin_info.version .. " Started|t:info")

while true do
	local wait = assert(io.popen('powershell sleep 60', 'r'))
	local output = wait:read('*all')
	wait:close()
end
