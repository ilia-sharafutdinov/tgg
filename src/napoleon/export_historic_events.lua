--[[
Automatically generated via export from Empire.mdb
Edit manually at your own risk
--]]

module(..., package.seeall)

events = require "data.events"
-- Historical Events

--[[ 1812_war ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent(12,"1812_war", 1812, "season_summer", context) then
		effect.historical_event("1812_war", context)
		return true
	end
	return false
end

--[[ davy_lamp ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent(16,"davy_lamp", 1815, "season_summer", context) then
		effect.historical_event("davy_lamp", context)
		return true
	end
	return false
end

--[[ embargo_act_repealed ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent(6,"embargo_act_repealed", 1809, "season_spring", context) then
		effect.historical_event("embargo_act_repealed", context)
		return true
	end
	return false
end

--[[ lewis_clark ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent(24,"lewis_clark", 1805, "season_winter", context) then
		effect.historical_event("lewis_clark", context)
		return true
	end
	return false
end

--[[ luddite_movement ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent(12,"luddite_movement", 1811, "season_summer", context) then
		effect.historical_event("luddite_movement", context)
		return true
	end
	return false
end

--[[ mutiny_vellore ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent(14,"mutiny_vellore", 1806, "season_summer", context) then
		effect.historical_event("mutiny_vellore", context)
		return true
	end
	return false
end

--[[ rum_rebellion ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent(12,"rum_rebellion", 1808, "season_summer", context) then
		effect.historical_event("rum_rebellion", context)
		return true
	end
	return false
end

--[[ stock_exchange_hoax ]]--

events.HistoricalEvents[#events.HistoricalEvents+1] =
function (context)
	if conditions.IsTriggerableHistoricalEvent(4,"stock_exchange_hoax", 1814, "season_spring", context) then
		effect.historical_event("stock_exchange_hoax", context)
		return true
	end
	return false
end

