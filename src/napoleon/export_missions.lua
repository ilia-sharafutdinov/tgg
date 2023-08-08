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
	if false then
		effect.trigger_mission("tut_blockade_port", context)
		result = true
	end
	return result
end

events.MissionEvaluateBlockadePort[#events.MissionEvaluateBlockadePort+1] =
function (context)
	if conditions.MissionName("tut_blockade_port", context) then
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
		effect.trigger_mission("ep2_build_shipyard", context)
		result = true
	end
	if false then
		effect.trigger_mission("ep2_recruit_naval_unit", context)
		result = true
	end
	if false then
		effect.trigger_mission("tut_build_school", context)
		result = true
	end
	if false then
		effect.trigger_mission("tut_build_foundry", context)
		result = true
	end
	if false then
		effect.trigger_mission("tut_build_factory", context)
		result = true
	end
	if false then
		effect.trigger_mission("tut_build_shipyard", context)
		result = true
	end
	if false then
		effect.trigger_mission("ita_establish_supply", context)
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
	if conditions.MissionName("ep2_recruit_naval_unit", context) then
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
	if conditions.MissionName("tut_build_school", context) then
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
	if conditions.MissionName("tut_build_foundry", context) then
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
	if conditions.MissionName("tut_build_factory", context) then
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
	if conditions.MissionName("tut_build_shipyard", context) then
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
	if conditions.MissionName("ita_establish_supply", context) then
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
	if false then
		effect.trigger_mission("ita_subjugate_piedmont", context)
		result = true
	end
	if false then
		effect.trigger_mission("ita_liberate_modena", context)
		result = true
	end
	if false then
		effect.trigger_mission("ita_liberate_milan", context)
		result = true
	end
	if false then
		effect.trigger_mission("ita_invade_venice", context)
		result = true
	end
	if false then
		effect.trigger_mission("ita_defy_pope", context)
		result = true
	end
	if false then
		effect.trigger_mission("tut_capture_toulon", context)
		result = true
	end
	if false then
		effect.trigger_mission("ita_victory_capture_klagenfurt", context)
		result = true
	end
	if false then
		effect.trigger_mission("ita_take_mantua", context)
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
	if conditions.MissionName("ita_subjugate_piedmont", context) then
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
	if conditions.MissionName("ita_liberate_modena", context) then
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
	if conditions.MissionName("ita_liberate_milan", context) then
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
	if conditions.MissionName("ita_invade_venice", context) then
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
	if conditions.MissionName("ita_defy_pope", context) then
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
	if conditions.MissionName("tut_capture_toulon", context) then
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
	if conditions.MissionName("ita_victory_capture_klagenfurt", context) then
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
	if conditions.MissionName("ita_take_mantua", context) then
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

--[[ capture_fort ]]--

events.n[#events.n+1] =
function (context)
	local result = false
	return result
end

events.n[#events.n+1] =
function (context)
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
	if false then
		effect.trigger_mission("tut_peace_treaty", context)
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
	if conditions.MissionName("tut_peace_treaty", context) then
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

--[[ protectorate_region_capture ]]--

events.MissionCheckRecruit[#events.MissionCheckRecruit+1] =
function (context)
	local result = false
	if false then
		effect.trigger_mission("main_protectorate_thirteen_colonies", context)
		result = true
	end
	return result
end

events.MissionEvaluateRecruit[#events.MissionEvaluateRecruit+1] =
function (context)
	if conditions.MissionName("main_protectorate_thirteen_colonies", context) then
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

--[[ recruit ]]--

events.MissionCheckRecruit[#events.MissionCheckRecruit+1] =
function (context)
	local result = false
	if false then
		effect.trigger_mission("ep1_recruit_unit", context)
		result = true
	end
	if false then
		effect.trigger_mission("tut_recruit_cannon", context)
		result = true
	end
	if false then
		effect.trigger_mission("tut_recruit_3rd_rate", context)
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
	if conditions.MissionName("tut_recruit_cannon", context) then
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
	if conditions.MissionName("tut_recruit_3rd_rate", context) then
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
	if false then
		effect.trigger_mission("tut_research_technology", context)
		result = true
	end
	return result
end

events.MissionEvaluateResearch[#events.MissionEvaluateResearch+1] =
function (context)
	if conditions.MissionName("tut_research_technology", context) then
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

--[[ spy_on_city ]]--

events.MissionCheckSpyOnCity[#events.MissionCheckSpyOnCity+1] =
function (context)
	local result = false
	if false then
		effect.trigger_mission("tut_infiltrate_city", context)
		result = true
	end
	return result
end

events.MissionEvaluateSpyOnCity[#events.MissionEvaluateSpyOnCity+1] =
function (context)
	if conditions.MissionName("tut_infiltrate_city", context) then
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

