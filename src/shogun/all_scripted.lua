--[[
Import all the lua scripts
--]]

local triggers = require "data.export_triggers"
local ancillaries  = require "data.export_ancillaries"
local historic_characters = require "data.export_historic_characters"
local missions = require "data.export_missions"
local encyclopedia = require "data.export_encyclopedia"
local encyclopedia = require "data.export_experience"

events = triggers.events
--[[
print(events, #events)
 
for n,v in ipairs(events.historical_events) do print(n, v) end
--]]