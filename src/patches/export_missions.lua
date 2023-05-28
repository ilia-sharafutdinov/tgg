--[[
Automatically generated via export from Empire.mdb
Edit manually at your own risk
--]]

module(..., package.seeall)

events = require "data.events"
events.evaluate_mission = {}

-- Trigger declarations

--[[ assassination ]]--

events.MissionCheckAssassination[#events.MissionCheckAssassination+1] =
function (context)
	local result = false
	return result
end

events.MissionEvaluateAssassination[#events.MissionEvaluateAssassination+1] =
function (context)
	return false
end

--[[ blockade_port ]]--

events.MissionCheckBlockadePort[#events.MissionCheckBlockadePort+1] =
function (context)
	local result = false
	return result
end

events.MissionEvaluateBlockadePort[#events.MissionEvaluateBlockadePort+1] =
function (context)
	return false
end

--[[ build ]]--

events.MissionCheckBuild[#events.MissionCheckBuild+1] =
function (context)
	local result = false
	if false then
		effect.trigger_mission("ep1_build_farm", context)
		result = true
	end
	if false then
		effect.trigger_mission("ep1_build_fishery", context)
		result = true
	end
	if false then
		effect.trigger_mission("ep1_build_tobacco_plantation", context)
		result = true
	end
	if false then
		effect.trigger_mission("ep2_build_gov", context)
		result = true
	end
	if false then
		effect.trigger_mission("ep2_build_gov_2", context)
		result = true
	end
	if false then
		effect.trigger_mission("ep2_build_shipyard", context)
		result = true
	end
	return result
end

events.MissionEvaluateBuild[#events.MissionEvaluateBuild+1] =
function (context)
	if conditions.MissionName("ep1_build_farm", context) then
		if true then
			effect.mission_success(context)
			return true
		elseif false then
			effect.mission_failure(context)
			return true
		elseif false then
			effect.mission_cancel(context)
			return true
		end
		return false
	end
	if conditions.MissionName("ep1_build_fishery", context) then
		if true then
			effect.mission_success(context)
			return true
		elseif false then
			effect.mission_failure(context)
			return true
		elseif false then
			effect.mission_cancel(context)
			return true
		end
		return false
	end
	if conditions.MissionName("ep1_build_tobacco_plantation", context) then
		if true then
			effect.mission_success(context)
			return true
		elseif false then
			effect.mission_failure(context)
			return true
		elseif false then
			effect.mission_cancel(context)
			return true
		end
		return false
	end
	if conditions.MissionName("ep2_build_gov", context) then
		if true then
			effect.mission_success(context)
			return true
		elseif false then
			effect.mission_failure(context)
			return true
		elseif false then
			effect.mission_cancel(context)
			return true
		end
		return false
	end
	if conditions.MissionName("ep2_build_gov_2", context) then
		if true then
			effect.mission_success(context)
			return true
		elseif false then
			effect.mission_failure(context)
			return true
		elseif false then
			effect.mission_cancel(context)
			return true
		end
		return false
	end
	if conditions.MissionName("ep2_build_shipyard", context) then
		if true then
			effect.mission_success(context)
			return true
		elseif false then
			effect.mission_failure(context)
			return true
		elseif false then
			effect.mission_cancel(context)
			return true
		end
		return false
	end
	return false
end

--[[ capture_city ]]--

events.MissionCheckCaptureCity[#events.MissionCheckCaptureCity+1] =
function (context)
	local result = false
	if false then
		effect.trigger_mission("ep1_capture_settlement_maryland", context)
		result = true
	end
	if false then
		effect.trigger_mission("ep1_capture_settlement_pennsylvania", context)
		result = true
	end
	if false then
		effect.trigger_mission("ep2_capture_fort_beausejour", context)
		result = true
	end
	if false then
		effect.trigger_mission("ep2_capture_fort_duquesne_1", context)
		result = true
	end
	if false then
		effect.trigger_mission("ep2_capture_fort_frontenac", context)
		result = true
	end
	if false then
		effect.trigger_mission("ep2_capture_fort_oswego", context)
		result = true
	end
	if false then
		effect.trigger_mission("ep2_capture_fortniagara", context)
		result = true
	end
	if false then
		effect.trigger_mission("ep2_capture_louisbourg", context)
		result = true
	end
	if false then
		effect.trigger_mission("ep2_capture_montreal", context)
		result = true
	end
	if false then
		effect.trigger_mission("ep2_capture_quebec", context)
		result = true
	end
	if conditions.CampaignName("episodic_5", context) and conditions.TurnNumber(context) == 2 and conditions.SettlementName("settlement:new_york:albany", context) and not conditions.SettlementIsLocal("settlement:new_york:albany", context) then
		effect.trigger_mission("ep3_capture_albany", context)
		result = true
	end
	return result
end

events.MissionEvaluateCaptureCity[#events.MissionEvaluateCaptureCity+1] =
function (context)
	if conditions.MissionName("ep1_capture_settlement_maryland", context) then
		if conditions.SettlementIsLocal("settlement:maryland:annapolis", context) then
			effect.mission_success(context)
			return true
		elseif false then
			effect.mission_failure(context)
			return true
		elseif false then
			effect.mission_cancel(context)
			return true
		end
		return false
	end
	if conditions.MissionName("ep1_capture_settlement_pennsylvania", context) then
		if conditions.SettlementIsLocal("settlement:pennsylvania:ep_1_philadelphia", context) then
			effect.mission_success(context)
			return true
		elseif false then
			effect.mission_failure(context)
			return true
		elseif false then
			effect.mission_cancel(context)
			return true
		end
		return false
	end
	if conditions.MissionName("ep2_capture_fort_beausejour", context) then
		if false then
			effect.mission_success(context)
			return true
		elseif false then
			effect.mission_failure(context)
			return true
		elseif false then
			effect.mission_cancel(context)
			return true
		end
		return false
	end
	if conditions.MissionName("ep2_capture_fort_duquesne_1", context) then
		if false then
			effect.mission_success(context)
			return true
		elseif false then
			effect.mission_failure(context)
			return true
		elseif false then
			effect.mission_cancel(context)
			return true
		end
		return false
	end
	if conditions.MissionName("ep2_capture_fort_frontenac", context) then
		if false then
			effect.mission_success(context)
			return true
		elseif false then
			effect.mission_failure(context)
			return true
		elseif false then
			effect.mission_cancel(context)
			return true
		end
		return false
	end
	if conditions.MissionName("ep2_capture_fort_oswego", context) then
		if false then
			effect.mission_success(context)
			return true
		elseif false then
			effect.mission_failure(context)
			return true
		elseif false then
			effect.mission_cancel(context)
			return true
		end
		return false
	end
	if conditions.MissionName("ep2_capture_fortniagara", context) then
		if conditions.SettlementIsLocal("settlement:algonquin_territory:niagara", context) then
			effect.mission_success(context)
			return true
		elseif false then
			effect.mission_failure(context)
			return true
		elseif false then
			effect.mission_cancel(context)
			return true
		end
		return false
	end
	if conditions.MissionName("ep2_capture_louisbourg", context) then
		if conditions.SettlementIsLocal("settlement:acadia:louisbourg_ep3", context) then
			effect.mission_success(context)
			return true
		elseif flase then
			effect.mission_failure(context)
			return true
		elseif false then
			effect.mission_cancel(context)
			return true
		end
		return false
	end
	if conditions.MissionName("ep2_capture_montreal", context) then
		if conditions.SettlementIsLocal("settlement:ontario:montreal", context) then
			effect.mission_success(context)
			return true
		elseif false then
			effect.mission_failure(context)
			return true
		elseif false then
			effect.mission_cancel(context)
			return true
		end
		return false
	end
	if conditions.MissionName("ep2_capture_quebec", context) then
		if conditions.SettlementIsLocal("settlement:new_france:quebec", context) then
			effect.mission_success(context)
			return true
		elseif false then
			effect.mission_failure(context)
			return true
		elseif false then
			effect.mission_cancel(context)
			return true
		end
		return false
	end
	if conditions.MissionName("ep3_capture_albany", context) then
		if conditions.SettlementIsLocal("settlement:new_york:albany", context) then
			effect.mission_success(context)
			return true
		elseif false then
			effect.mission_failure(context)
			return true
		elseif false then
			effect.mission_cancel(context)
			return true
		end
		return false
	end
	return false
end

--[[ duel ]]--

events.MissionCheckDuel[#events.MissionCheckDuel+1] =
function (context)
	local result = false
	return result
end

events.MissionEvaluateDuel[#events.MissionEvaluateDuel+1] =
function (context)
	return false
end

--[[ engage_character ]]--

events.MissionCheckEngageCharacter[#events.MissionCheckEngageCharacter+1] =
function (context)
	local result = false
	return result
end

events.MissionEvaluateEngageCharacter[#events.MissionEvaluateEngageCharacter+1] =
function (context)
	return false
end

--[[ engage_faction ]]--

events.MissionCheckEngageFaction[#events.MissionCheckEngageFaction+1] =
function (context)
	local result = false
	return result
end

events.MissionEvaluateEngageFaction[#events.MissionEvaluateEngageFaction+1] =
function (context)
	return false
end

--[[ gain_military_access ]]--

events.MissionCheckGainMilitaryAccess[#events.MissionCheckGainMilitaryAccess+1] =
function (context)
	local result = false
	return result
end

events.MissionEvaluateGainMilitaryAccess[#events.MissionEvaluateGainMilitaryAccess+1] =
function (context)
	return false
end

--[[ make_alliance ]]--

events.MissionCheckMakeAlliance[#events.MissionCheckMakeAlliance+1] =
function (context)
	local result = false
	if false then
		effect.trigger_mission("ep2_make_alliance_iroquois", context)
		result = true
	end
	return result
end

events.MissionEvaluateMakeAlliance[#events.MissionEvaluateMakeAlliance+1] =
function (context)
	if conditions.MissionName("ep2_make_alliance_iroquois", context) then
		if conditions.FactionIsAlliedCampaign("iroquois", context) then
			effect.mission_success(context)
			return true
		elseif false then
			effect.mission_failure(context)
			return true
		elseif false then
			effect.mission_cancel(context)
			return true
		end
		return false
	end
	return false
end

--[[ make_trade_agreement ]]--

events.MissionCheckMakeTradeAgreement[#events.MissionCheckMakeTradeAgreement+1] =
function (context)
	local result = false
	return result
end

events.MissionEvaluateMakeTradeAgreement[#events.MissionEvaluateMakeTradeAgreement+1] =
function (context)
	return false
end

--[[ recruit ]]--

events.MissionCheckRecruit[#events.MissionCheckRecruit+1] =
function (context)
	local result = false
	if false then
		effect.trigger_mission("ep1_recruit_unit", context)
		result = true
	end
	return result
end

events.MissionEvaluateRecruit[#events.MissionEvaluateRecruit+1] =
function (context)
	if conditions.MissionName("ep1_recruit_unit", context) then
		if true then
			effect.mission_success(context)
			return true
		elseif false then
			effect.mission_failure(context)
			return true
		elseif false then
			effect.mission_cancel(context)
			return true
		end
		return false
	end
	return false
end

--[[ research ]]--

events.MissionCheckResearch[#events.MissionCheckResearch+1] =
function (context)
	local result = false
	return result
end

events.MissionEvaluateResearch[#events.MissionEvaluateResearch+1] =
function (context)
	return false
end

--[[ spy_on_city ]]--

events.MissionCheckSpyOnCity[#events.MissionCheckSpyOnCity+1] =
function (context)
	local result = false
	return result
end

events.MissionEvaluateSpyOnCity[#events.MissionEvaluateSpyOnCity+1] =
function (context)
	return false
end

