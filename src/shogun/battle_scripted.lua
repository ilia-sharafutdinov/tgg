--[[
Import all the lua scripts
--]]
package.path = ";?.lua;data/ui/templates/?.lua;data/ui/?.lua"

local core = require "CoreUtils"
require "data.all_scripted"
local advice = require "data.export_advice"

local triggers = core.Require "data.export_triggers"
events = triggers.events

local m_user_defined_event_callbacks = {}

function AddEventCallBack(event, func, add_to_user_defined_list)
	print(event, func, add_to_user_defined_list)
	
	assert(events[event] ~= nil, "Attempting to add event callback to non existant event ("..event..")")
	assert(func ~= nil, "Attempting to add a non existant function to event "..event)

	-- Push the function to the back of the list of function for the specified address	
	events[event][#events[event]+1] = func
	
	if add_to_user_defined_list ~= false then
		m_user_defined_event_callbacks[#m_user_defined_event_callbacks+1] = {}
		m_user_defined_event_callbacks[#m_user_defined_event_callbacks].event = event
		m_user_defined_event_callbacks[#m_user_defined_event_callbacks].func = func
	
	end
	
end

function ClearEventCallbacks()
	for i,v in ipairs(m_user_defined_event_callbacks) do
		print(v.event, v.func)
		local new_event_table = {}
		for ei, ev in ipairs(events[v.event]) do
			if ev ~= v.func then
				new_event_table[#new_event_table+1] = ev
			end
		end
		events[v.event] = new_event_table
	end
	
	m_user_defined_event_callbacks = {}
end

