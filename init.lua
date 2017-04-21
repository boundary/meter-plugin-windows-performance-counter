local framework = require('framework.lua')
local Plugin = framework.Plugin
local MeterDataSource = framework.MeterDataSource
local each = framework.functional.each
local pack = framework.util.pack

local params = framework.params

-- Create a new MeterDataSource which communicates
-- to the meter via its RPC channel using a non-closing connection.
local data_source = MeterDataSource:new()

-- Callback to fetch the CPU percent usage for each
-- CPU on the target system
function data_source:onFetch(socket)
  socket:write(self:queryMetricCommand({match = 'system.cpu.usage'}))
end

-- Allocate a meter plugin instance that handles polling
-- for measurements
local plugin = Plugin:new(params, data_source)

-- Called once each time the framework requests 
-- measurements be collected. This callback is required to return
-- a table of measurement strings which consist of the following:
-- CPU_CORE <cpu usage in percent> <measurement timestamp> <cpu name>
function plugin:onParseValues(data)
  local result = {}
 
  -- Iterate over CPU usage data returned from the meter and
  -- add to the result table
  each(function (v, i) 
    local metric, cpu_id = v.metric:match('^(system%.cpu%.usage)|cpu=(%d+)$')
    if metric then
      table.insert(result, pack('CPU_CORE', v.value, v.timestamp, plugin.source .. '-C' .. cpu_id))
    end
  end, data)

  return result
end

plugin:run()
