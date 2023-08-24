--[[
Automatically generated via export from C:/Users/chris_g\branches/shogun2/otomo/shogun2/raw_data/db
Edit manually at your own risk
--]]

module(..., package.seeall)

events = require "data.events"
-- Advice Triggers

--[[ 0100_Battle_Advice_UI_Buttons_Trigger ]]--

events.BattleConflictPhaseCommenced[#events.BattleConflictPhaseCommenced+1] =
function (context)
	if not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("0100_Battle_Advice_UI_Buttons_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0101_Battle_Advice_Guard_Mode_Button_Trigger ]]--

events.BattleConflictPhaseCommenced[#events.BattleConflictPhaseCommenced+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and (conditions.BattlePlayerAlliancePercentageOfUnitClass("infantry_spearman", context) >= 1 or conditions.BattlePlayerAlliancePercentageOfUnitClass("infantry_heavy", context) >= 1) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("0101_Battle_Advice_Guard_Mode_Button_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0102_Battle_Advice_Fire_At_Will_Button_Trigger ]]--

events.AdviceDismissed[#events.AdviceDismissed+1] =
function (context)
	if conditions.AdviceJustDisplayed("1424352004", context) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("0102_Battle_Advice_Fire_At_Will_Button_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0103_Battle_Advice_Withdraw_Button_Trigger ]]--

events.ComponentLClickUp[#events.ComponentLClickUp+1] =
function (context)
	if conditions.IsComponentType("button_withdraw", context) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("0103_Battle_Advice_Withdraw_Button_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0104_Battle_Advice_Group_Formations_Button_Trigger ]]--

events.AdviceDismissed[#events.AdviceDismissed+1] =
function (context)
	if conditions.AdviceJustDisplayed("-722605174", context) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("0104_Battle_Advice_Group_Formations_Button_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0105_Battle_Advice_Group_Button_Trigger ]]--

events.ComponentLClickUp[#events.ComponentLClickUp+1] =
function (context)
	if conditions.IsComponentType("button_group", context) and not conditions.CampaignName("tut_shogun", context) then
		return true
	end
	return false
end

--[[ 0106_Battle_Advice_Radar_Map_Trigger ]]--

events.ComponentLClickUp[#events.ComponentLClickUp+1] =
function (context)
	if conditions.IsComponentType("radar", context) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("0106_Battle_Advice_Radar_Map_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0107_Battle_Advice_Melee_Button_Trigger ]]--

events.ComponentLClickUp[#events.ComponentLClickUp+1] =
function (context)
	if conditions.IsComponentType("button_melee", context) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("0107_Battle_Advice_Melee_Button_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0108_Battle_Advice_Killometer_Trigger ]]--

events.AdviceDismissed[#events.AdviceDismissed+1] =
function (context)
	if conditions.AdviceJustDisplayed("-1755835367", context) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("0108_Battle_Advice_Killometer_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0109_Battle_Advice_Hour_Glass_Trigger ]]--

events.BattleConflictPhaseCommenced[#events.BattleConflictPhaseCommenced+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("0109_Battle_Advice_Hour_Glass_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0110_Battle_Advice_Run_Button_Trigger ]]--

events.ComponentLClickUp[#events.ComponentLClickUp+1] =
function (context)
	if conditions.IsComponentType("button_movespeed", context) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("0110_Battle_Advice_Run_Button_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0112_Battle_Advice_Manoeuvre_Compass_Trigger ]]--

events.ComponentLClickUp[#events.ComponentLClickUp+1] =
function (context)
	if conditions.IsComponentType("compass_toggle", context) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("0112_Battle_Advice_Manoeuvre_Compass_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0116_Battle_Advice_Speed_Slider_Trigger ]]--

events.ComponentLClickUp[#events.ComponentLClickUp+1] =
function (context)
	if (conditions.IsComponentType("pause", context) or conditions.IsComponentType("slo_mo", context) or conditions.IsComponentType("play", context) or conditions.IsComponentType("fwd", context) or conditions.IsComponentType("ffwd", context)) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("0116_Battle_Advice_Speed_Slider_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0120_Battle_Advice_Naval_Boarding_Button_Trigger ]]--

events.ComponentLClickUp[#events.ComponentLClickUp+1] =
function (context)
	if conditions.IsComponentType("nav_button_board", context) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("0120_Battle_Advice_Naval_Boarding_Button_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0122_Battle_Advice_Naval_Boarding_Meter_Trigger ]]--

events.BattleBoardingActionCommenced[#events.BattleBoardingActionCommenced+1] =
function (context)
	if conditions.BattleIsNavalConflict(context) and conditions.BattleAllianceIsPlayers(context) and conditions.BattleAllianceIsAttacker(context) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("0122_Battle_Advice_Naval_Boarding_Meter_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0123_Battle_Advice_Review_Panel_Trigger ]]--

events.ComponentLClickUp[#events.ComponentLClickUp+1] =
function (context)
	if (conditions.IsComponentType("general_portrait", context) or conditions.IsComponentType("cards_panel", context)) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("0123_Battle_Advice_Review_Panel_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0124_Battle_Advice_Skirmish_Mode_Button_Trigger ]]--

events.BattleConflictPhaseCommenced[#events.BattleConflictPhaseCommenced+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and (conditions.BattlePlayerAlliancePercentageOfUnitClass("infantry_bow", context) >= 1 or conditions.BattlePlayerAlliancePercentageOfUnitClass("cavalry_missile", context) >= 1) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("0124_Battle_Advice_Skirmish_Mode_Button_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0125_Battle_Advice_Cancel_Order_Button_Trigger ]]--

events.ComponentLClickUp[#events.ComponentLClickUp+1] =
function (context)
	if conditions.IsComponentType("button_halt", context) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("0125_Battle_Advice_Cancel_Order_Button_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0126_Battle_Advice_Naval_Repair_Button_Trigger ]]--

events.ComponentLClickUp[#events.ComponentLClickUp+1] =
function (context)
	if conditions.IsComponentType("button_repair", context) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("0126_Battle_Advice_Naval_Repair_Button_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0127_Battle_Advice_Siege_Assault_Trigger ]]--

events.BattleDeploymentPhaseCommenced[#events.BattleDeploymentPhaseCommenced+1] =
function (context)
	if conditions.BattleIsSiegeConflict(context) and conditions.BattleAllianceIsAttacker(context) and conditions.BattleAllianceIsPlayers(context) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("0127_Battle_Advice_Siege_Assault_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0128_Battle_Advice_Siege_Defence_Trigger ]]--

events.BattleDeploymentPhaseCommenced[#events.BattleDeploymentPhaseCommenced+1] =
function (context)
	if conditions.BattleIsSiegeConflict(context) and not conditions.BattleAllianceIsAttacker(context) and conditions.BattleAllianceIsPlayers(context) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("0128_Battle_Advice_Siege_Defence_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0130_Battle_Advice_Unit_Abilities_Trigger ]]--

events.BattleConflictPhaseCommenced[#events.BattleConflictPhaseCommenced+1] =
function (context)
	if conditions.BattleIsLandConflict(context) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("0130_Battle_Advice_Unit_Abilities_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0131_Battle_Advice_Ambush_Attack_Trigger ]]--

events.BattleDeploymentPhaseCommenced[#events.BattleDeploymentPhaseCommenced+1] =
function (context)
	if conditions.BattleIsAmbushConflict(context) and conditions.BattleAllianceIsAttacker(context) and conditions.BattleAllianceIsPlayers(context) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("0131_Battle_Advice_Ambush_Attack_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0132_Battle_Advice_Ambush_Defence_Trigger ]]--

events.BattleDeploymentPhaseCommenced[#events.BattleDeploymentPhaseCommenced+1] =
function (context)
	if conditions.BattleIsAmbushConflict(context) and not conditions.BattleAllianceIsAttacker(context) and conditions.BattleAllianceIsPlayers(context) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("0132_Battle_Advice_Ambush_Defence_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0133_Battle_Advice_Naval_Siege_Attack_Trigger ]]--

events.BattleDeploymentPhaseCommenced[#events.BattleDeploymentPhaseCommenced+1] =
function (context)
	if conditions.BattleIsSiegeConflict(context) and conditions.BattleAllianceIsAttacker(context) and conditions.BattleAllianceIsPlayers(context) and conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("0133_Battle_Advice_Naval_Siege_Attack_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0134_Battle_Advice_Naval_Siege_Defence_Trigger ]]--

events.BattleDeploymentPhaseCommenced[#events.BattleDeploymentPhaseCommenced+1] =
function (context)
	if conditions.BattleIsSiegeConflict(context) and not conditions.BattleAllianceIsAttacker(context) and conditions.BattleAllianceIsPlayers(context) and conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("0134_Battle_Advice_Naval_Siege_Defence_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0135_Battle_Advice_Naval_Fire_Support_Trigger ]]--

events.BattleDeploymentPhaseCommenced[#events.BattleDeploymentPhaseCommenced+1] =
function (context)
	if conditions.BattleArmyIsPlayers(context) and conditions.BattlePlayerNavalFireSupportPossible(context) then
		effect.advance_contextual_advice_thread("0135_Battle_Advice_Naval_Fire_Support_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0135_Campaign_Advice_Multiple_Armies_Trigger ]]--

events.PanelOpenedCampaign[#events.PanelOpenedCampaign+1] =
function (context)
	if conditions.IsComponentType("popup_pre_battle", context) and conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("0136_Campaign_Advice_Multiple_Armies_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0137_Battle_Advice_Selection_Groups_Trigger ]]--

events.BattleConflictPhaseCommenced[#events.BattleConflictPhaseCommenced+1] =
function (context)
	if not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("0137_Battle_Advice_Selection_Groups_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0138_Campaign_Advice_Tower_Defences_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.TurnNumber(context) == 8 and conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("0138_Campaign_Advice_Tower_Defences_Thread", 1, context)
		return true
	end
	return false
end

--[[ 0139_Battle_Advice_Gatling_Guns_Trigger ]]--

events.BattleConflictPhaseCommenced[#events.BattleConflictPhaseCommenced+1] =
function (context)
	if conditions.BattleArmyIsPlayers(context) and conditions.BattleArmyHasGatlings(context) and conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("0139_Battle_Advice_Gatling_Guns_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1013_Campaign_Advice_UI_Diplomacy_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.TurnNumber(context) == 5 and not conditions.CampaignName("tut_shogun", context) and not conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("1013_Campaign_Advice_UI_Diplomacy_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1014_Campaign_Advice_UI_Diplomacy_Panel_Trigger ]]--

events.PanelOpenedCampaign[#events.PanelOpenedCampaign+1] =
function (context)
	if conditions.IsComponentType("diplomacy_panel", context) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("1014_Campaign_Advice_UI_Diplomacy_Panel_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1014a_Campaign_Advice_UI_Diplomacy_Panel_Trigger ]]--

events.ComponentLClickUp[#events.ComponentLClickUp+1] =
function (context)
	if conditions.IsComponentType("diplomacy_button_trade", context) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("1014a_Campaign_Advice_UI_Diplomacy_Panel_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1014b_Campaign_Advice_UI_Diplomacy_Panel_Trigger ]]--

events.ComponentLClickUp[#events.ComponentLClickUp+1] =
function (context)
	if conditions.IsComponentType("diplomacy_button_alliance", context) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("1014b_Campaign_Advice_UI_Diplomacy_Panel_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1014c1_Campaign_Advice_UI_Diplomacy_Panel_Trigger ]]--

events.ComponentLClickUp[#events.ComponentLClickUp+1] =
function (context)
	if conditions.IsComponentType("diplomacy_button_hostage", context) and conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("1014c1_Campaign_Advice_UI_Diplomacy_Panel_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1014c_Campaign_Advice_UI_Diplomacy_Panel_Trigger ]]--

events.ComponentLClickUp[#events.ComponentLClickUp+1] =
function (context)
	if conditions.IsComponentType("diplomacy_button_hostage", context) and not conditions.CampaignName("tut_shogun", context) and not conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("1014c_Campaign_Advice_UI_Diplomacy_Panel_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1014d_Campaign_Advice_UI_Diplomacy_Panel_Trigger ]]--

events.ComponentLClickUp[#events.ComponentLClickUp+1] =
function (context)
	if conditions.IsComponentType("diplomacy_button_protector", context) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("1014d_Campaign_Advice_UI_Diplomacy_Panel_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1014e_Campaign_Advice_UI_Diplomacy_Panel_Trigger ]]--

events.ComponentLClickUp[#events.ComponentLClickUp+1] =
function (context)
	if conditions.IsComponentType("diplomacy_button_war", context) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("1014e_Campaign_Advice_UI_Diplomacy_Panel_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1014f_Campaign_Advice_UI_Diplomacy_Panel_Trigger ]]--

events.ComponentLClickUp[#events.ComponentLClickUp+1] =
function (context)
	if conditions.IsComponentType("diplomacy_button_access", context) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("1014f_Campaign_Advice_UI_Diplomacy_Panel_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1014g_Campaign_Advice_UI_Diplomacy_Panel_Trigger ]]--

events.ComponentLClickUp[#events.ComponentLClickUp+1] =
function (context)
	if conditions.IsComponentType("diplomacy_button_marriage", context) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("1014g_Campaign_Advice_UI_Diplomacy_Panel_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1014j_Campaign_Advice_UI_Diplomacy_Panel_Trigger ]]--

events.ComponentLClickUp[#events.ComponentLClickUp+1] =
function (context)
	if conditions.IsComponentType("diplomacy_button_payments", context) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("1014j_Campaign_Advice_UI_Diplomacy_Panel_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1014m_Campaign_Advice_UI_Diplomacy_Panel_Trigger ]]--

events.ComponentLClickUp[#events.ComponentLClickUp+1] =
function (context)
	if conditions.IsComponentType("diplomacy_button_break_trade", context) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("1014m_Campaign_Advice_UI_Diplomacy_Panel_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1014n_Campaign_Advice_UI_Diplomacy_Panel_Trigger ]]--

events.ComponentLClickUp[#events.ComponentLClickUp+1] =
function (context)
	if conditions.IsComponentType("diplomacy_button_request_join_war", context) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("1014n_Campaign_Advice_UI_Diplomacy_Panel_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1014p_Campaign_Advice_UI_Diplomacy_Panel_Trigger ]]--

events.ComponentLClickUp[#events.ComponentLClickUp+1] =
function (context)
	if conditions.IsComponentType("diplomacy_button_break_alliance", context) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("1014p_Campaign_Advice_UI_Diplomacy_Panel_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1014q_Campaign_Advice_UI_Diplomacy_Panel_Trigger ]]--

events.ComponentLClickUp[#events.ComponentLClickUp+1] =
function (context)
	if conditions.IsComponentType("button_threat_of_force", context) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("1014q_Campaign_Advice_UI_Diplomacy_Panel_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1021_Campaign_Advice_UI_Review_Panel_Trigger ]]--

events.ComponentLClickUp[#events.ComponentLClickUp+1] =
function (context)
	if conditions.IsComponentType("s2_review_controls", context) and not conditions.CampaignName("tut_shogun", context) and not conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("1021_Campaign_Advice_UI_Review_Panel_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1021a_Campaign_Advice_UI_Review_Panel_Trigger ]]--

events.ComponentLClickUp[#events.ComponentLClickUp+1] =
function (context)
	if conditions.IsComponentType("s2_review_controls", context) and conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("1021a_Campaign_Advice_UI_Review_Panel_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1022_Campaign_Advice_UI_Treasury_Trigger ]]--

events.ComponentLClickUp[#events.ComponentLClickUp+1] =
function (context)
	if (conditions.IsComponentType("dy_treasury", context) or conditions.IsComponentType("dy_income", context) or conditions.IsComponentType("dy_food", context) or conditions.IsComponentType("tx_treasury", context) or conditions.IsComponentType("tx_income", context)) and not conditions.CampaignName("tut_shogun", context) and not conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("1022_Campaign_Advice_UI_Treasury_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1022a_Campaign_Advice_UI_Treasury_Trigger ]]--

events.ComponentLClickUp[#events.ComponentLClickUp+1] =
function (context)
	if (conditions.IsComponentType("dy_treasury", context) or conditions.IsComponentType("dy_income", context) or conditions.IsComponentType("dy_food", context) or conditions.IsComponentType("tx_treasury", context) or conditions.IsComponentType("tx_income", context)) and conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("1022a_Campaign_Advice_UI_Treasury_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1023_Campaign_Advice_UI_Radar_Map_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.TurnNumber(context) >= 12 and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("1023_Campaign_Advice_UI_Radar_Map_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1024_Campaign_Advice_UI_Lists_Panel_Trigger ]]--

events.ComponentLClickUp[#events.ComponentLClickUp+1] =
function (context)
	if conditions.IsComponentType("fleets", context) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("1024_Campaign_Advice_UI_Lists_Panel_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1025_Campaign_Advice_UI_Lists_Panel_Trigger ]]--

events.ComponentLClickUp[#events.ComponentLClickUp+1] =
function (context)
	if conditions.IsComponentType("regions", context) and not conditions.CampaignName("tut_shogun", context) and not conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("1025_Campaign_Advice_UI_Lists_Panel_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1025a_Campaign_Advice_UI_Lists_Panel_Trigger ]]--

events.ComponentLClickUp[#events.ComponentLClickUp+1] =
function (context)
	if conditions.IsComponentType("regions", context) and conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("1025a_Campaign_Advice_UI_Lists_Panel_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1026_Campaign_Advice_UI_Lists_Panel_Trigger ]]--

events.ComponentLClickUp[#events.ComponentLClickUp+1] =
function (context)
	if conditions.IsComponentType("agents", context) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("1026_Campaign_Advice_UI_Lists_Panel_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1027_Campaign_Advice_UI_Lists_Panel_Trigger ]]--

events.ComponentLClickUp[#events.ComponentLClickUp+1] =
function (context)
	if conditions.IsComponentType("armies", context) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("1027_Campaign_Advice_UI_Lists_Panel_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1027b_Campaign_Advice_UI_Lists_Panel_Trigger ]]--

events.ComponentLClickUp[#events.ComponentLClickUp+1] =
function (context)
	if conditions.IsComponentType("factions", context) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("1027b_Campaign_Advice_UI_Lists_Panel_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1028_Campaign_Advice_UI_Clan_Panel_Trigger ]]--

events.PanelOpenedCampaign[#events.PanelOpenedCampaign+1] =
function (context)
	if conditions.IsComponentType("clan", context) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("1028_Campaign_Advice_UI_Clan_Panel_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1028a_Campaign_Advice_UI_Clan_Panel_Trigger ]]--

events.ComponentLClickUp[#events.ComponentLClickUp+1] =
function (context)
	if conditions.IsComponentType("Family", context) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("1028a_Campaign_Advice_UI_Clan_Panel_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1028b_Campaign_Advice_UI_Clan_Panel_Trigger ]]--

events.ComponentLClickUp[#events.ComponentLClickUp+1] =
function (context)
	if conditions.IsComponentType("Summary", context) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("1028b_Campaign_Advice_UI_Clan_Panel_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1028c_Campaign_Advice_UI_Clan_Panel_Trigger ]]--

events.ComponentLClickUp[#events.ComponentLClickUp+1] =
function (context)
	if (conditions.IsComponentType("offices_panel", context) or conditions.IsComponentType("offices_holder", context) or conditions.IsComponentType("txt_warfare", context) or conditions.IsComponentType("txt_logistics", context) or conditions.IsComponentType("txt_development", context) or conditions.IsComponentType("txt_prosperity", context)) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("1028c_Campaign_Advice_UI_Clan_Panel_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1028d_Campaign_Advice_UI_Clan_Panel_Trigger ]]--

events.ComponentLClickUp[#events.ComponentLClickUp+1] =
function (context)
	if conditions.IsComponentType("Records", context) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("1028d_Campaign_Advice_UI_Clan_Panel_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1029_Campaign_Advice_UI_Finance_Panel_Trigger ]]--

events.PanelOpenedCampaign[#events.PanelOpenedCampaign+1] =
function (context)
	if conditions.IsComponentType("finance_screen", context) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("1029_Campaign_Advice_UI_Finance_Panel_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1029a_Campaign_Advice_UI_Finance_Panel_Trigger ]]--

events.ComponentLClickUp[#events.ComponentLClickUp+1] =
function (context)
	if conditions.IsComponentType("tab_taxes", context) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("1029a_Campaign_Advice_UI_Finance_Panel_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1029b_Campaign_Advice_UI_Finance_Panel_Thread ]]--

events.ComponentLClickUp[#events.ComponentLClickUp+1] =
function (context)
	if conditions.IsComponentType("tab_trade", context) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("1029b_Campaign_Advice_UI_Finance_Panel_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1029c_Campaign_Advice_UI_Finance_Panel_Trigger ]]--

events.ComponentLClickUp[#events.ComponentLClickUp+1] =
function (context)
	if conditions.IsComponentType("tab_taxes", context) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("1029c_Campaign_Advice_UI_Finance_Panel_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1029d_Campaign_Advice_UI_Finance_Panel_Trigger ]]--

events.ComponentLClickUp[#events.ComponentLClickUp+1] =
function (context)
	if conditions.IsComponentType("tab_taxes", context) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("1029d_Campaign_Advice_UI_Finance_Panel_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1029e_Campaign_Advice_UI_Finance_Panel_Trigger ]]--

events.ComponentLClickUp[#events.ComponentLClickUp+1] =
function (context)
	if conditions.IsComponentType("tab_trade", context) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("1029e_Campaign_Advice_UI_Finance_Panel_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1030_Campaign_Advice_UI_Events_Panel_Trigger ]]--

events.ComponentLClickUp[#events.ComponentLClickUp+1] =
function (context)
	if conditions.IsComponentType("missions", context) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("1030_Campaign_Advice_UI_Events_Panel_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1030a_Campaign_Advice_UI_Events_Panel_Trigger ]]--

events.ComponentLClickUp[#events.ComponentLClickUp+1] =
function (context)
	if conditions.IsComponentType("victory_conditions", context) and conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("1030a_Campaign_Advice_UI_Events_Panel_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1030b_Campaign_Advice_UI_Events_Panel_Trigger ]]--

events.ComponentLClickUp[#events.ComponentLClickUp+1] =
function (context)
	if conditions.IsComponentType("victory_conditions", context) and not conditions.CampaignName("tut_shogun", context) and not conditions.CampaignName("jap_gempei", context) and not conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("1030b_Campaign_Advice_UI_Events_Panel_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1031_Campaign_Advice_UI_Technology_Panel_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.TurnNumber(context) == 3 and not conditions.CampaignName("tut_shogun", context) and not conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("1031_Campaign_Advice_UI_Technology_Panel_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1031a_Campaign_Advice_UI_Technology_Panel_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.TurnNumber(context) == 4 and conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("1031a_Campaign_Advice_UI_Technology_Panel_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1032_Campaign_Advice_UI_Technology_Panel_Trigger ]]--

events.PanelOpenedCampaign[#events.PanelOpenedCampaign+1] =
function (context)
	if conditions.IsComponentType("technology", context) and not conditions.CampaignName("tut_shogun", context) and not conditions.CampaignName("jap_gempei", context) and not conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("1032_Campaign_Advice_UI_Technology_Panel_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1032a_Campaign_Advice_UI_Technology_Panel_Trigger ]]--

events.PanelOpenedCampaign[#events.PanelOpenedCampaign+1] =
function (context)
	if conditions.IsComponentType("technology", context) and conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("1032a_Campaign_Advice_UI_Technology_Panel_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1033_Campaign_Advice_UI_Agent_Options_Panel_Trigger ]]--

events.ComponentLClickUp[#events.ComponentLClickUp+1] =
function (context)
	if conditions.IsComponentType("sabotage", context) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("1033_Campaign_Advice_UI_Agent_Options_Panel_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1034_Campaign_Advice_UI_Agent_Options_Panel_Trigger ]]--

events.ComponentLClickUp[#events.ComponentLClickUp+1] =
function (context)
	if conditions.IsComponentType("assassinate", context) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("1034_Campaign_Advice_UI_Agent_Options_Panel_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1039_Campaign_Advice_UI_Prebattle_Panel_Trigger ]]--

events.PanelOpenedCampaign[#events.PanelOpenedCampaign+1] =
function (context)
	if conditions.IsComponentType("popup_pre_battle", context) and not conditions.CampaignName("tut_shogun", context) and not conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("1039_Campaign_Advice_UI_Prebattle_Panel_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1040_Campaign_Advice_UI_Postbattle_Panel_Trigger ]]--

events.PanelOpenedCampaign[#events.PanelOpenedCampaign+1] =
function (context)
	if conditions.IsComponentType("popup_battle_results", context) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("1040_Campaign_Advice_UI_Postbattle_Panel_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1047_Campaign_Advice_UI_Infrastructure_Tab_Trigger ]]--

events.ComponentLClickUp[#events.ComponentLClickUp+1] =
function (context)
	if conditions.IsComponentType("Region_Construction_Tab", context) and not conditions.CampaignName("tut_shogun", context) and not conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("1047_Campaign_Advice_UI_Infrastructure_Tab_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1048_Campaign_Advice_UI_Construction_Tab_Trigger ]]--

events.ComponentLClickUp[#events.ComponentLClickUp+1] =
function (context)
	if conditions.IsComponentType("Region_Construction_Tab", context) and not conditions.CampaignName("tut_shogun", context) and not conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("1048_Campaign_Advice_UI_Construction_Tab_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1048a_Campaign_Advice_UI_Construction_Tab_Trigger ]]--

events.ComponentLClickUp[#events.ComponentLClickUp+1] =
function (context)
	if conditions.IsComponentType("Region_Construction_Tab", context) and conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("1048a_Campaign_Advice_UI_Construction_Tab_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1049_Campaign_Advice_UI_Recruitment_Tab_Trigger ]]--

events.ComponentLClickUp[#events.ComponentLClickUp+1] =
function (context)
	if conditions.IsComponentType("Land_Recruitment_Tab", context) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("1049_Campaign_Advice_UI_Recruitment_Tab_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1050_Campaign_Advice_UI_Exchange_Panel_Trigger ]]--

events.PanelOpenedCampaign[#events.PanelOpenedCampaign+1] =
function (context)
	if conditions.IsComponentType("unit_exchange", context) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("1050_Campaign_Advice_UI_Exchange_Panel_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1051_Campaign_Advice_Merging_Armies_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterIsLocalCampaign(context) and conditions.CharacterType("General", context) and not conditions.CharacterType("colonel", context) and not conditions.IsAdmiral(context) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("1051_Campaign_Advice_Merging_Armies_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1052_Campaign_Advice_Merging_Fleets_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterIsLocalCampaign(context) and conditions.CharacterType("General", context) and not conditions.CharacterType("colonel", context) and conditions.IsAdmiral(context) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("1052_Campaign_Advice_Merging_Fleets_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1057_Campaign_Advice_Port_Selected_Trigger ]]--

events.SlotSelected[#events.SlotSelected+1] =
function (context)
	if conditions.SlotIsLocal(context) and conditions.SlotType("port", context) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("1057_Campaign_Advice_Port_Selected_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1058_Campaign_Advice_Farm_Selected_Trigger ]]--

events.SlotSelected[#events.SlotSelected+1] =
function (context)
	if conditions.SlotIsLocal(context) and (conditions.SlotType("sheep", context) or conditions.SlotType("wheat", context) or conditions.SlotType("rice", context) or conditions.SlotType("horses", context)) and not conditions.CampaignName("tut_shogun", context) and not conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("1058_Campaign_Advice_Farm_Selected_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1058a_Campaign_Advice_Farm_Selected_Trigger ]]--

events.SlotSelected[#events.SlotSelected+1] =
function (context)
	if conditions.SlotIsLocal(context) and (conditions.SlotType("sheep", context) or conditions.SlotType("wheat", context) or conditions.SlotType("rice", context) or conditions.SlotType("horses", context)) and conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("1058a_Campaign_Advice_Farm_Selected_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1059_Campaign_Advice_Mine_Selected_Trigger ]]--

events.SlotSelected[#events.SlotSelected+1] =
function (context)
	if conditions.SlotIsLocal(context) and (conditions.SlotType("iron", context) or conditions.SlotType("gold", context) or conditions.SlotType("gems", context)) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("1059_Campaign_Advice_Mine_Selected_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1064_Campaign_Advice_Daimyo_Selected_Trigger ]]--

events.CharacterSelected[#events.CharacterSelected+1] =
function (context)
	if conditions.CharacterIsLocalCampaign(context) and conditions.CharacterType("General", context) and conditions.IsDaimyo(context) and not conditions.CampaignName("tut_shogun", context) and not conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("1064_Campaign_Advice_Daimyo_Selected_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1064a_Campaign_Advice_Daimyo_Selected_Trigger ]]--

events.CharacterSelected[#events.CharacterSelected+1] =
function (context)
	if conditions.CharacterIsLocalCampaign(context) and conditions.CharacterType("General", context) and conditions.IsDaimyo(context) and conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("1064a_Campaign_Advice_Daimyo_Selected_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1065_Campaign_Advice_General_Selected_Trigger ]]--

events.CharacterSelected[#events.CharacterSelected+1] =
function (context)
	if conditions.CharacterIsLocalCampaign(context) and (conditions.CharacterType("General", context) or conditions.CharacterType("colonel", context)) and not conditions.IsAdmiral(context) and not conditions.CampaignName("tut_shogun", context) and not conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("1065_Campaign_Advice_General_Selected_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1065a_Campaign_Advice_General_Selected_Trigger ]]--

events.CharacterSelected[#events.CharacterSelected+1] =
function (context)
	if conditions.CharacterIsLocalCampaign(context) and (conditions.CharacterType("General", context) or conditions.CharacterType("colonel", context)) and not conditions.IsAdmiral(context) and conditions.CampaignName("jap_boshin", context) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("1065a_Campaign_Advice_General_Selected_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1066_Campaign_Advice_Fleet_Selected_Trigger ]]--

events.CharacterSelected[#events.CharacterSelected+1] =
function (context)
	if conditions.CharacterIsLocalCampaign(context) and (conditions.CharacterType("General", context) or conditions.CharacterType("colonel", context)) and conditions.IsAdmiral(context) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("1066_Campaign_Advice_Fleet_Selected_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1067_Campaign_Advice_Geisha_Selected_Trigger ]]--

events.CharacterSelected[#events.CharacterSelected+1] =
function (context)
	if conditions.CharacterIsLocalCampaign(context) and conditions.CharacterType("geisha", context) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("1067_Campaign_Advice_Geisha_Selected_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1068_Campaign_Advice_Ninja_Selected_Trigger ]]--

events.CharacterSelected[#events.CharacterSelected+1] =
function (context)
	if conditions.CharacterIsLocalCampaign(context) and conditions.CharacterType("ninja", context) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("1068_Campaign_Advice_Ninja_Selected_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1069_Campaign_Advice_Metsuke_Selected_Trigger ]]--

events.CharacterSelected[#events.CharacterSelected+1] =
function (context)
	if conditions.CharacterIsLocalCampaign(context) and conditions.CharacterType("metsuke", context) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("1069_Campaign_Advice_Metsuke_Selected_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1070_Campaign_Advice_Monk_Selected_Trigger ]]--

events.CharacterSelected[#events.CharacterSelected+1] =
function (context)
	if conditions.CharacterIsLocalCampaign(context) and conditions.CharacterType("monk", context) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("1070_Campaign_Advice_Monk_Selected_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1071_Campaign_Advice_Missionary_Selected_Trigger ]]--

events.CharacterSelected[#events.CharacterSelected+1] =
function (context)
	if conditions.CharacterIsLocalCampaign(context) and conditions.CharacterType("missionary", context) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("1071_Campaign_Advice_Missionary_Selected_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1072_Campaign_Advice_Shinobi_Selected_Trigger ]]--

events.CharacterSelected[#events.CharacterSelected+1] =
function (context)
	if conditions.CharacterIsLocalCampaign(context) and conditions.CharacterType("boshin_shinobi", context) and conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("1072_Campaign_Advice_Shinobi_Selected_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1073_Campaign_Advice_Shinsengumi_Selected_Trigger ]]--

events.CharacterSelected[#events.CharacterSelected+1] =
function (context)
	if conditions.CharacterIsLocalCampaign(context) and conditions.CharacterType("boshin_shinsengumi", context) and conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("1073_Campaign_Advice_Shinsengumi_Selected_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1074_Campaign_Advice_Ishinshishi_Selected_Trigger ]]--

events.CharacterSelected[#events.CharacterSelected+1] =
function (context)
	if conditions.CharacterIsLocalCampaign(context) and conditions.CharacterType("boshin_ishinshishi", context) and conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("1074_Campaign_Advice_Ishinshishi_Selected_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1075_Campaign_Advice_Wako_Selected_Trigger ]]--

events.CharacterSelected[#events.CharacterSelected+1] =
function (context)
	if conditions.CharacterType("pirate", context) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("1075_Campaign_Advice_Wako_Selected_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1076_Campaign_Advice_Geisha_Selected_Trigger ]]--

events.CharacterSelected[#events.CharacterSelected+1] =
function (context)
	if conditions.CharacterIsLocalCampaign(context) and conditions.CharacterType("boshin_geisha", context) and conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("1076_Campaign_Advice_Geisha_Selected_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1077_Campaign_Advice_NPC_Selected_Trigger ]]--

events.CharacterSelected[#events.CharacterSelected+1] =
function (context)
	if not conditions.CharacterIsLocalCampaign(context) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("1077_Campaign_Advice_NPC_Selected_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1078_Campaign_Advice_Agent_Right_Click_Trigger ]]--

events.CharacterInfoPanelOpened[#events.CharacterInfoPanelOpened+1] =
function (context)
	if conditions.CharacterIsLocalCampaign(context) and (conditions.CharacterType("ninja", context) or conditions.CharacterType("geisha", context) or conditions.CharacterType("metsuke", context) or conditions.CharacterType("monk", context) or conditions.CharacterType("missionary", context)) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("1078_Campaign_Advice_Agent_Right_Click_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1079_Campaign_Advice_General_Right_Click_Trigger ]]--

events.CharacterInfoPanelOpened[#events.CharacterInfoPanelOpened+1] =
function (context)
	if conditions.CharacterIsLocalCampaign(context) and conditions.CharacterType("General", context) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("1079_Campaign_Advice_General_Right_Click_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1080_Campaign_Advice_NPC_Right_Click_Trigger ]]--

events.CharacterInfoPanelOpened[#events.CharacterInfoPanelOpened+1] =
function (context)
	if not conditions.CharacterIsLocalCampaign(context) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("1080_Campaign_Advice_NPC_Right_Click_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1081_Campaign_Advice_Region_Right_Click_Trigger ]]--

events.PanelOpenedCampaign[#events.PanelOpenedCampaign+1] =
function (context)
	if conditions.IsComponentType("region_info", context) and not conditions.CampaignName("tut_shogun", context) and not conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("1081_Campaign_Advice_Region_Right_Click_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1081a_Campaign_Advice_Region_Right_Click_Trigger ]]--

events.PanelOpenedCampaign[#events.PanelOpenedCampaign+1] =
function (context)
	if conditions.IsComponentType("region_info", context) and conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("1081a_Campaign_Advice_Region_Right_Click_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1082_Campaign_Advice_Unit_Right_Click_Trigger ]]--

events.PanelOpenedCampaign[#events.PanelOpenedCampaign+1] =
function (context)
	if conditions.IsComponentType("UnitInfoPopup", context) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("1082_Campaign_Advice_Unit_Right_Click_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1082b_Campaign_Advice_Unit_Right_Click_Trigger ]]--

events.PanelOpenedCampaign[#events.PanelOpenedCampaign+1] =
function (context)
	if conditions.IsComponentType("CharacterInfoUnitInfoPopup", context) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("1082_Campaign_Advice_Unit_Right_Click_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1083_Campaign_Advice_Building_Right_Click_Trigger ]]--

events.BuildingInfoPanelOpenedCampaign[#events.BuildingInfoPanelOpenedCampaign+1] =
function (context)
	if conditions.IsComponentType("BuildingInfoPopup", context) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("1083_Campaign_Advice_Building_Right_Click_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1084_Campaign_Advice_Tech_Right_Click_Trigger ]]--

events.TechnologyInfoPanelOpenedCampaign[#events.TechnologyInfoPanelOpenedCampaign+1] =
function (context)
	if conditions.IsComponentType("BuildingInfoPopup", context) and not conditions.CampaignName("tut_shogun", context) and not conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("1084_Campaign_Advice_Tech_Right_Click_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1084a_Campaign_Advice_Tech_Right_Click_Trigger ]]--

events.TechnologyInfoPanelOpenedCampaign[#events.TechnologyInfoPanelOpenedCampaign+1] =
function (context)
	if conditions.IsComponentType("BuildingInfoPopup", context) and conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("1084a_Campaign_Advice_Tech_Right_Click_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1085_Campaign_Advice_Settlement_Occupied_Trigger ]]--

events.SettlementOccupied[#events.SettlementOccupied+1] =
function (context)
	if conditions.SettlementIsLocal(context) and not conditions.CampaignName("tut_shogun", context) and not conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("1085_Campaign_Advice_Settlement_Occupied_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1085a_Campaign_Advice_Settlement_Occupied_Trigger ]]--

events.SettlementOccupied[#events.SettlementOccupied+1] =
function (context)
	if conditions.SettlementIsLocal(context) and conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("1085a_Campaign_Advice_Settlement_Occupied_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1086_Campaign_Advice_Coastal_Assault_Trigger ]]--

events.CharacterEmbarksNavy[#events.CharacterEmbarksNavy+1] =
function (context)
	if conditions.CharacterIsLocalCampaign(context) and conditions.CharacterType("General", context) and conditions.IsCarryingTroops(context) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("1086_Campaign_Advice_Coastal_Assault_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1087_Campaign_Advice_Coastal_Assault_Trigger ]]--

events.CampaignCoastalAssaultOnCharacter[#events.CampaignCoastalAssaultOnCharacter+1] =
function (context)
	if conditions.CharacterIsLocalCampaign(context) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("1087_Campaign_Advice_Coastal_Assault_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1088_Campaign_Advice_Coastal_Assault_Trigger ]]--

events.CampaignCoastalAssaultOnGarrison[#events.CampaignCoastalAssaultOnGarrison+1] =
function (context)
	if conditions.CharacterIsLocalCampaign(context) and not conditions.CampaignName("tut_shogun", context) and not conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("1088_Campaign_Advice_Coastal_Assault_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1088a_Campaign_Advice_Coastal_Assault_Trigger ]]--

events.CampaignCoastalAssaultOnGarrison[#events.CampaignCoastalAssaultOnGarrison+1] =
function (context)
	if conditions.CharacterIsLocalCampaign(context) and conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("1088a_Campaign_Advice_Coastal_Assault_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1089_Campaign_Advice_Ambush_Trigger ]]--

events.CharacterTurnStart[#events.CharacterTurnStart+1] =
function (context)
	if conditions.CharacterIsLocalCampaign(context) and conditions.CharacterType("General", context) and conditions.CharacterEndedInAmbushPosition(context) and conditions.IsPlayerTurn(context) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("1089_Campaign_Advice_Ambush_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1090_Campaign_Advice_Multi_Turn_Moves_Trigger ]]--

events.MultiTurnMove[#events.MultiTurnMove+1] =
function (context)
	if conditions.CharacterIsLocalCampaign(context) and conditions.IsPlayerTurn(context) and not conditions.CampaignName("tut_shogun", context) and not conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("1090_Campaign_Advice_Multi_Turn_Moves_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1090a_Campaign_Advice_Multi_Turn_Moves_Trigger ]]--

events.MultiTurnMove[#events.MultiTurnMove+1] =
function (context)
	if conditions.CharacterIsLocalCampaign(context) and conditions.IsPlayerTurn(context) and conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("1090a_Campaign_Advice_Multi_Turn_Moves_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1091_Campaign_Advice_Movement_Exhausted_Trigger ]]--

events.MovementPointsExhausted[#events.MovementPointsExhausted+1] =
function (context)
	if conditions.CharacterIsLocalCampaign(context) and conditions.IsPlayerTurn(context) and not conditions.CampaignName("tut_shogun", context) and not conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("1091_Campaign_Advice_Movement_Exhausted_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1091a_Campaign_Advice_Movement_Exhausted_Trigger ]]--

events.MovementPointsExhausted[#events.MovementPointsExhausted+1] =
function (context)
	if conditions.CharacterIsLocalCampaign(context) and conditions.IsPlayerTurn(context) and conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("1091a_Campaign_Advice_Movement_Exhausted_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1092_Campaign_Advice_Region_Capital_Trigger ]]--

events.SettlementSelected[#events.SettlementSelected+1] =
function (context)
	if conditions.SettlementIsLocal(context) and not conditions.CampaignName("tut_shogun", context) and not conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("1092_Campaign_Advice_Region_Capital_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1092a_Campaign_Advice_Region_Capital_Trigger ]]--

events.SettlementSelected[#events.SettlementSelected+1] =
function (context)
	if conditions.SettlementIsLocal(context) and conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("1092a_Campaign_Advice_Region_Capital_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1093_Campaign_Advice_Veteran_Selected_Trigger ]]--

events.CharacterSelected[#events.CharacterSelected+1] =
function (context)
	if conditions.CharacterIsLocalCampaign(context) and conditions.CharacterType("boshin_veteran", context) and conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("1093_Campaign_Advice_Veteran_Selected_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1095_Campaign_Advice_Trade_Agreement_Trigger ]]--

events.TradeRouteEstablished[#events.TradeRouteEstablished+1] =
function (context)
	if conditions.IsPlayerTurn(context) and conditions.FactionIsLocal(context) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("1095_Campaign_Advice_Trade_Agreement_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1096_Campaign_Advice_Fame_Levels_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.TurnNumber(context) == 5 and conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("1096_Campaign_Advice_Fame_Levels_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1097_Campaign_Advice_Punitive_Forces_Trigger ]]--

events.CharacterSelected[#events.CharacterSelected+1] =
function (context)
	if conditions.CharacterIsLocalCampaign(context) and (conditions.CharacterType("General", context) or conditions.CharacterType("colonel", context)) and conditions.IsAdmiral(context) and conditions.CampaignName("jap_boshin", context) then
		return true
	end
	return false
end

--[[ 1098_Campaign_Advice_Modernisation_Trigger ]]--

events.SettlementSelected[#events.SettlementSelected+1] =
function (context)
	if conditions.SettlementIsLocal(context) and conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("1098_Campaign_Advice_Modernisation_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1099_Campaign_Advice_Development_Trigger ]]--

events.PanelOpenedCampaign[#events.PanelOpenedCampaign+1] =
function (context)
	if conditions.IsComponentType("technology", context) and conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("1099_Campaign_Advice_Development_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1101_Campaign_Advice_Sieges_Trigger ]]--

events.CampaignSettlementAttacked[#events.CampaignSettlementAttacked+1] =
function (context)
	if conditions.PlayerFactionIsAttacker(context) and conditions.IsPlayerTurn(context) and conditions.IsUnderSiege(context) and not conditions.CampaignName("tut_shogun", context) and not conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("1101_Campaign_Advice_Sieges_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1101b_Campaign_Advice_Sieges_Trigger ]]--

events.CampaignSettlementAttacked[#events.CampaignSettlementAttacked+1] =
function (context)
	if conditions.PlayerFactionIsAttacker(context) and conditions.IsPlayerTurn(context) and conditions.IsUnderSiege(context) and conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("1101b_Campaign_Advice_Sieges_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1101c_Campaign_Advice_Sieges_Trigger ]]--

events.CampaignSettlementAttacked[#events.CampaignSettlementAttacked+1] =
function (context)
	if not conditions.PlayerFactionIsAttacker(context) and conditions.IsPlayerTurn(context) and conditions.IsUnderSiege(context) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("1101a_Campaign_Advice_Sieges_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1102_Campaign_Advice_Ungarrisoned_Region_Trigger ]]--

events.CharacterLeavesGarrison[#events.CharacterLeavesGarrison+1] =
function (context)
	if  false then
		effect.advance_contextual_advice_thread("1102_Campaign_Advice_Ungarrisoned_Region_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1103_Campaign_Advice_Ungarrisoned_Castle_Trigger ]]--

events.CharacterLeavesGarrison[#events.CharacterLeavesGarrison+1] =
function (context)
	if  false then
		effect.advance_contextual_advice_thread("1103_Campaign_Advice_Ungarrisoned_Castle_Thread", 1, context)
		effect.advance_contextual_advice_thread("1103a_Campaign_Advice_Ungarrisoned_Castle_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1103a_Campaign_Advice_Ungarrisoned_Castle_Trigger ]]--

events.CharacterLeavesGarrison[#events.CharacterLeavesGarrison+1] =
function (context)
	if  false then
		return true
	end
	return false
end

--[[ 1104_Campaign_Advice_Warning_Undeveloped_Port_Trigger ]]--

events.SlotTurnStart[#events.SlotTurnStart+1] =
function (context)
	if conditions.SlotIsLocal(context) and conditions.SlotBuildingQueueIdleDespiteCash(context) and conditions.SlotType("port", context) and (conditions.TurnsSinceThreadLastAdvanced("1104_Campaign_Advice_Undeveloped_Port_Thread", context) == 0 or conditions.TurnsSinceThreadLastAdvanced("1104_Campaign_Advice_Undeveloped_Port_Thread", context) == 5) and not conditions.CampaignName("tut_shogun", context) and conditions.TurnNumber(context) >= 15 then
		effect.advance_contextual_advice_thread("1104_Campaign_Advice_Undeveloped_Port_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1105_Campaign_Advice_Warning_Undeveloped_Roads_Trigger ]]--

events.SlotTurnStart[#events.SlotTurnStart+1] =
function (context)
	if conditions.SlotIsLocal(context) and conditions.SlotBuildingQueueIdleDespiteCash(context) and conditions.SlotType("settlement_road", context) and (conditions.TurnsSinceThreadLastAdvanced("2190_Campaign_Advice_Undeveloped_Roads_Thread", context) == 0 or conditions.TurnsSinceThreadLastAdvanced("2190_Campaign_Advice_Undeveloped_Roads_Thread", context) == 5) and not conditions.CampaignName("tut_shogun", context) and conditions.TurnNumber(context) >= 15 then
		effect.advance_contextual_advice_thread("1105_Campaign_Advice_Undeveloped_Roads_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1106_Campaign_Advice_Warning_Undeveloped_Trade_Trigger ]]--

events.RegionTurnStart[#events.RegionTurnStart+1] =
function (context)
	if conditions.RegionIsLocal(context) and not conditions.TradeRouteLimitReached(context) and not conditions.RegionSlotBuildingTypeExists("SHO_Port_2_Trading_Port", context) and (conditions.TurnsSinceThreadLastAdvanced("1106_Campaign_Advice_Warning_Undeveloped_Trade_Thread", context) == 0 or conditions.TurnsSinceThreadLastAdvanced("1106_Campaign_Advice_Warning_Undeveloped_Trade_Thread", context) == 5) and not conditions.CampaignName("tut_shogun", context) and not conditions.CampaignName("jap_boshin", context) and conditions.TurnNumber(context) >= 15 then
		effect.advance_contextual_advice_thread("1106_Campaign_Advice_Undeveloped_Trade_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1106a_Campaign_Advice_Warning_Undeveloped_Trade_Trigger ]]--

events.RegionTurnStart[#events.RegionTurnStart+1] =
function (context)
	if conditions.RegionIsLocal(context) and not conditions.TradeRouteLimitReached(context) and not conditions.RegionSlotBuildingTypeExists("SHO_Port_2_Trading_Port", context) and (conditions.TurnsSinceThreadLastAdvanced("1106_Campaign_Advice_Warning_Undeveloped_Trade_Thread", context) == 0 or conditions.TurnsSinceThreadLastAdvanced("1106_Campaign_Advice_Warning_Undeveloped_Trade_Thread", context) == 5) and conditions.CampaignName("jap_boshin", context) and conditions.TurnNumber(context) >= 15 then
		effect.advance_contextual_advice_thread("1106a_Campaign_Advice_Undeveloped_Trade_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1107_Campaign_Advice_Warning_Unexploited_Resources_Trigger ]]--

events.SlotTurnStart[#events.SlotTurnStart+1] =
function (context)
	if conditions.SlotIsLocal(context) and (conditions.SlotType("SHO_region_specialty_gold_mining", context) or conditions.SlotType("SHO_region_specialty_iron_mining", context) or conditions.SlotType("SHO_region_specialty_horses", context) or conditions.SlotType("SHO_region_specialty_prime_forest", context) or conditions.SlotType("SHO_region_specialty_stone", context) or conditions.SlotType("SHO_region_specialty_artisans", context) or conditions.SlotType("SHO_region_specialty_farm", context)) and (conditions.TurnsSinceThreadLastAdvanced("1107_Campaign_Advice_Unexploited_Resources_Thread", context) == 0 or conditions.TurnsSinceThreadLastAdvanced("1107_Campaign_Advice_Unexploited_Resources_Thread", context) == 5) and not conditions.CampaignName("tut_shogun", context) and conditions.TurnNumber(context) >= 15 then
		effect.advance_contextual_advice_thread("1107_Campaign_Advice_Unexploited_Resources_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1108_Campaign_Advice_Bookmarks_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.TurnNumber(context) >= 12 and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("1108_Campaign_Advice_Bookmarks_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1109_Campaign_Advice_Fog_Of_War_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.TurnNumber(context) >= 12 and not conditions.CampaignName("tut_shogun", context) and not conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("1109_Campaign_Advice_Fog_Of_War_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1109a_Campaign_Advice_Fog_Of_War_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.TurnNumber(context) >= 11 and conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("1109a_Campaign_Advice_Fog_Of_War_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1110_Campaign_Advice_Trade_Routes_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.TurnNumber(context) == 8 and not conditions.CampaignName("tut_shogun", context) and not conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("1110_Campaign_Advice_Trade_Routes_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1111_Campaign_Advice_Slots_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.TurnNumber(context) == 9 and not conditions.CampaignName("tut_shogun", context) and not conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("1111_Campaign_Advice_Slots_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1111a_Campaign_Advice_Slots_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.TurnNumber(context) >= 11 and conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("1111a_Campaign_Advice_Slots_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1112_Campaign_Advice_Resources_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.TurnNumber(context) >= 12 and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("1112_Campaign_Advice_Resources_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1114_Campaign_Advice_Keyboard_Shortcuts_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.TurnNumber(context) >= 12 and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("1114_Campaign_Advice_Keyboard_Shortcuts_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1115_Campaign_Advice_Camera_Controls_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.TurnNumber(context) >= 12 and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("1115_Campaign_Advice_Camera_Controls_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1116_Campaign_Advice_UI_Help_Buttons_Trigger ]]--

events.AdviceDismissed[#events.AdviceDismissed+1] =
function (context)
	if conditions.AdviceJustDisplayed("2139657977", context) and not conditions.CampaignName("tut_shogun", context) and not conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("2189_Campaign_Advice_Encyclopaedia_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1116a_Campaign_Advice_UI_Help_Buttons_Trigger ]]--

events.AdviceDismissed[#events.AdviceDismissed+1] =
function (context)
	if conditions.AdviceJustDisplayed("2139657977", context) and conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("2189a_Campaign_Advice_Encyclopaedia_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1118_Campaign_Advice_Warning_Riot_Trigger ]]--

events.RegionRiots[#events.RegionRiots+1] =
function (context)
	if conditions.RegionIsLocal(context) and conditions.IsPlayerTurn(context) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("1118_Campaign_Advice_Warning_Riot_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1119_Campaign_Advice_Warning_Rebellion_Trigger ]]--

events.RegionRebels[#events.RegionRebels+1] =
function (context)
	if conditions.RegionIsLocal(context) and conditions.IsPlayerTurn(context) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("1119_Campaign_Advice_Warning_Rebellion_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1122_Campaign_Advice_Warning_Bankrupt_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.LosingMoney(context) and conditions.FactionTreasury(context) <= 0 and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("1122_Campaign_Advice_Warning_Bankrupt_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1123_Campaign_Advice_Warning_Upkeep_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.LosingMoney(context) and conditions.SupportCostsPercentage(context) > 60 and conditions.FactionTreasury(context) > 0 and (conditions.FactionTaxLevel("upper_classes", context) < conditions.TaxLevel("tax_extortionate", context) or conditions.FactionTaxLevel("lower_classes", context) < conditions.TaxLevel("tax_extortionate", context)) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("1123_Campaign_Advice_Warning_Upkeep_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1124_Campaign_Advice_Warning_Bankrupt_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.LosingMoney(context) and conditions.FactionTreasury(context) <= 0 and conditions.UnusedInternationalTradeRoute(context) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("1124_Campaign_Advice_Warning_Bankrupt_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1125_Campaign_Advice_Warning_Bankrupt_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.LosingMoney(context) and conditions.SupportCostsPercentage(context) > 60 and conditions.FactionTreasury(context) <= 0 and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("1125_Campaign_Advice_Warning_Bankrupt_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1126_Campaign_Advice_Warning_Cashflow_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.FactionTreasury(context) < 200 and (conditions.FactionTaxLevel("upper_classes", context) < conditions.TaxLevel("tax_extortionate", context) or conditions.FactionTaxLevel("lower_classes", context) < conditions.TaxLevel("tax_extortionate", context)) and not conditions.CampaignName("tut_shogun", context) and not conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("1126_Campaign_Advice_Warning_Cashflow_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1126a_Campaign_Advice_Warning_Cashflow_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.FactionTreasury(context) < 200 and (conditions.FactionTaxLevel("upper_classes", context) < conditions.TaxLevel("tax_extortionate", context) or conditions.FactionTaxLevel("lower_classes", context) < conditions.TaxLevel("tax_extortionate", context)) and conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("1126a_Campaign_Advice_Warning_Cashflow_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1127_Campaign_Advice_Warning_Trade_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.LosingMoney(context) and conditions.TradeNodeAvailableWorldwide(context) and (conditions.TurnsSinceThreadLastAdvanced("1127_Campaign_Advice_Warning_Trade_Thread", context) == 0 or conditions.TurnsSinceThreadLastAdvanced("1127_Campaign_Advice_Warning_Trade_Thread", context) == 5) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("1127_Campaign_Advice_Warning_Trade_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1128_Campaign_Advice_Warning_Adjacent_Rebellion_Trigger ]]--

events.RegionTurnStart[#events.RegionTurnStart+1] =
function (context)
	if not conditions.RegionIsLocal(context) and conditions.IsPlayerTurn(context) and conditions.AdjacentRegionRebelling(context) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("1128_Campaign_Advice_Warning_Rebellion_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1129_Campaign_Advice_Warning_Cashflow_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.LosingMoney(context) and conditions.FactionTreasury(context) < 200 and not conditions.CampaignName("tut_shogun", context) and not conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("1129_Campaign_Advice_Warning_Cashflow_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1129a_Campaign_Advice_Warning_Cashflow_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.LosingMoney(context) and conditions.FactionTreasury(context) < 200 and conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("1129a_Campaign_Advice_Warning_Cashflow_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1130_Campaign_Advice_Warning_Region_Wealth_Trigger ]]--

events.RegionTurnStart[#events.RegionTurnStart+1] =
function (context)
	if conditions.RegionWealthDecrease(context) and conditions.RegionIsLocal(context) and not conditions.CampaignName("tut_shogun", context) and conditions.TurnNumber(context) >= 10 and not conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("1130_Campaign_Advice_Warning_Region_Wealth_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1136_Campaign_Advice_Warning_Religious_Unrest_Trigger ]]--

events.RegionTurnStart[#events.RegionTurnStart+1] =
function (context)
	if conditions.RegionIsLocal(context) and false then
		effect.advance_contextual_advice_thread("1136_Campaign_Advice_Religious_Unrest_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1137_Campaign_Advice_Warning_Religious_Unrest_Trigger ]]--

events.RegionTurnStart[#events.RegionTurnStart+1] =
function (context)
	if conditions.RegionIsLocal(context) and false then
		effect.advance_contextual_advice_thread("1137_Campaign_Advice_Religious_Unrest_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1138_Campaign_Advice_Warning_Population_Trigger ]]--

events.RegionTurnStart[#events.RegionTurnStart+1] =
function (context)
	if conditions.RegionIsLocal(context) and conditions.RegionHasFoodShortages(context) and (conditions.TurnsSinceThreadLastAdvanced("1138_Campaign_Advice_Warning_Population_Thread", context) == 0 or conditions.TurnsSinceThreadLastAdvanced("1138_Campaign_Advice_Warning_Population_Thread", context) == 5) and not conditions.CampaignName("tut_shogun", context) and not conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("1138_Campaign_Advice_Warning_Population_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1142b_Campaign_Advice_Trade_Route_Raided_Trigger ]]--

events.SeaTradeRouteRaided[#events.SeaTradeRouteRaided+1] =
function (context)
	if conditions.TradeRouteIsEnemy(context) and conditions.IsPlayerTurn(context) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("1142_Campaign_Advice_Trade_Route_Raided_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1143_Campaign_Advice_Trade_Route_Raided_Trigger ]]--

events.FactionRoundStart[#events.FactionRoundStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.SeaTradeRouteRaided(context) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("1143_Campaign_Advice_Trade_Route_Raided_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1147_Campaign_Advice_Trade_Nodes_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.IsPlayerTurn(context) and conditions.FactionHasTradeShipNotInTradeNode(context) and conditions.TradeNodeAvailableWorldwide(context) and not conditions.CampaignName("tut_shogun", context) and not conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("1147_Campaign_Advice_Trade_Nodes_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1148_Campaign_Advice_Port_Blockaded_Trigger ]]--

events.SlotRoundStart[#events.SlotRoundStart+1] =
function (context)
	if not conditions.SlotIsLocal(context) and not conditions.SlotIsAlliedCampaign(context) and conditions.IsBuildingInChain("port-navy", context) and conditions.PortBlockadedLocal(context) and not conditions.CampaignName("tut_shogun", context) and not conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("1148_Campaign_Advice_Port_Blockaded_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1149_Campaign_Advice_Port_Blockaded_Trigger ]]--

events.SlotRoundStart[#events.SlotRoundStart+1] =
function (context)
	if conditions.SlotIsLocal(context) and conditions.IsBuildingInChain("port-navy", context) and conditions.PortBlockaded(context) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("1149_Campaign_Advice_Port_Blockaded_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1150_Campaign_Advice_Foreign_Trade_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.TurnNumber(context) == 9 and conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("1150_Campaign_Advice_Foreign_Trade_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1151_Campaign_Advice_Ship_Upgrades_Trigger ]]--

events.PanelOpenedCampaign[#events.PanelOpenedCampaign+1] =
function (context)
	if conditions.IsComponentType("technology", context) and conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("1151_Campaign_Advice_Ship_Upgrades_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1167_Campaign_Advice_Warning_Ally_Betrayal_Trigger ]]--

events.CharacterAttacksAlly[#events.CharacterAttacksAlly+1] =
function (context)
	if conditions.CharacterIsLocalCampaign(context) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("1167_Campaign_Advice_Warning_Ally_Betrayal_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1184_Campaign_Advice_Warning_Bankrupt_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.LosingMoney(context) and conditions.FactionTreasury(context) <= 0 and conditions.TaxCollectionLimited(context) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("1184_Campaign_Advice_Warning_Bankrupt_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1185_Campaign_Advice_Warning_Infrastructure_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.LosingMoney(context) and conditions.FactionTreasury(context) <= 2000 and conditions.TaxCollectionLimited(context) and not conditions.CampaignName("tut_shogun", context) and not conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("1185_Campaign_Advice_Warning_Infrastructure_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1185a_Campaign_Advice_Warning_Infrastructure_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.LosingMoney(context) and conditions.FactionTreasury(context) <= 2000 and conditions.TaxCollectionLimited(context) and conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("1185a_Campaign_Advice_Warning_Infrastructure_Threa", 1, context)
		return true
	end
	return false
end

--[[ 1213_Campaign_Advice_Digging_In_Trigger ]]--

events.CharacterTurnStart[#events.CharacterTurnStart+1] =
function (context)
	if conditions.CharacterIsLocalCampaign(context) and (conditions.CharacterType("General", context) or conditions.CharacterType("colonel", context)) and conditions.CharacterStationaryForOneTurn(context) and not conditions.CampaignName("tut_shogun", context) and not conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("1213_Campaign_Advice_Digging_In_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1213a_Campaign_Advice_Digging_In_Trigger ]]--

events.CharacterTurnStart[#events.CharacterTurnStart+1] =
function (context)
	if conditions.CharacterIsLocalCampaign(context) and (conditions.CharacterType("General", context) or conditions.CharacterType("colonel", context)) and conditions.CharacterStationaryForOneTurn(context) and conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("1213a_Campaign_Advice_Digging_In_Thread", 1, context)
		return true
	end
	return false
end

--[[ 1216_Campaign_Advice_Zones_Of_Control_Trigger ]]--

events.CharacterSelected[#events.CharacterSelected+1] =
function (context)
	if conditions.CharacterIsLocalCampaign(context) and (conditions.CharacterType("General", context) or conditions.CharacterType("colonel", context) or conditions.CharacterType("admiral", context) or conditions.CharacterType("captain", context)) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("1216_Campaign_Advice_Zones_Of_Control_Thread", 1, context)
		return true
	end
	return false
end

--[[ 2000_Campaign_Advice_Research_Goals_Trigger ]]--

events.PanelOpenedCampaign[#events.PanelOpenedCampaign+1] =
function (context)
	if conditions.IsComponentType("technology", context) and conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("2000_Campaign_Advice_Research_Goals_Thread", 1, context)
		return true
	end
	return false
end

--[[ 2189_Campaign_Advice_Encyclopaedia_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.TurnNumber(context) == 4 and not conditions.CampaignName("tut_shogun", context) and not conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("1116_Campaign_Advice_UI_Help_Buttons_Thread", 1, context)
		return true
	end
	return false
end

--[[ 2190_Campaign_Advice_Trade_Nodes_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.IsPlayerTurn(context) and conditions.FactionHasTradeShipNotInTradeNode(context) and conditions.TradeNodeAvailableWorldwide(context) and not conditions.CampaignName("tut_shogun", context) and not conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("2190_Campaign_Advice_Trade_Nodes_Thread", 1, context)
		return true
	end
	return false
end

--[[ 2192_Campaign_Advice_Dilemmas_Trigger ]]--

events.IncomingMessage[#events.IncomingMessage+1] =
function (context)
	if not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("2192_Campaign_Advice_Dilemmas_Thread", 1, context)
		return true
	end
	return false
end

--[[ 2193_Campaign_Advice_Date_Seasons_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.TurnNumber(context) >= 12 and not conditions.CampaignName("tut_shogun", context) then
		return true
	end
	return false
end

--[[ 2194_Campaign_Advice_Advisor_Back_Button_Trigger ]]--

events.AdviceDismissed[#events.AdviceDismissed+1] =
function (context)
	if conditions.AdviceJustDisplayed("1219328082", context) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("2194_Campaign_Advice_Advisor_Back_Button_Thread", 1, context)
		return true
	end
	return false
end

--[[ 2195_Campaign_Advice_Passive_Spying_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.TurnNumber(context) >= 12 and not conditions.CampaignName("tut_shogun", context) and not conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("2195_Campaign_Advice_Passive_Spying_Thread", 1, context)
		return true
	end
	return false
end

--[[ 2195a_Campaign_Advice_Passive_Spying_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.TurnNumber(context) >= 11 and conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("2195a_Campaign_Advice_Passive_Spying_Thread", 1, context)
		return true
	end
	return false
end

--[[ 2196_Campaign_Advice_Heroes_Trigger ]]--

events.BuildingCompleted[#events.BuildingCompleted+1] =
function (context)
	if  false then
		effect.advance_contextual_advice_thread("2196_Campaign_Advice_Heroes_Thread", 1, context)
		return true
	end
	return false
end

--[[ 2197_Campaign_Advice_Legendary_Building_Trigger ]]--

events.BuildingCompleted[#events.BuildingCompleted+1] =
function (context)
	if  false then
		effect.advance_contextual_advice_thread("2197_Campaign_Advice_Legendary_Building_Thread", 1, context)
		return true
	end
	return false
end

--[[ 2197a_Campaign_Advice_Legendary_Building_Trigger ]]--

events.BuildingCompleted[#events.BuildingCompleted+1] =
function (context)
	if  false then
		effect.advance_contextual_advice_thread("2197a_Campaign_Advice_Legendary_Building_Thread", 1, context)
		return true
	end
	return false
end

--[[ 2198_Campaign_Advice_Replenishment_Advice_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterIsLocalCampaign(context) and conditions.CharacterArmyCouldReplenishFromBattle(context) and not conditions.CampaignName("tut_shogun", context) and not conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("2198_Campaign_Advice_Replenishment_Advice_Thread", 1, context)
		return true
	end
	return false
end

--[[ 2198a_Campaign_Advice_Replenishment_Advice_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterIsLocalCampaign(context) and conditions.CharacterArmyCouldReplenishFromBattle(context) and conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("2198a_Campaign_Advice_Replenishment_Advice_Thread", 1, context)
		return true
	end
	return false
end

--[[ 2199_Campaign_Advice_Trade_Post_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.TurnNumber(context) >= 12 and not conditions.CampaignName("tut_shogun", context) and not conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("2199_Campaign_Advice_Trade_Post_Thread", 1, context)
		return true
	end
	return false
end

--[[ 2200_Campaign_Advice_Finance_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.TurnNumber(context) == 7 and not conditions.CampaignName("tut_shogun", context) and not conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("2200_Campaign_Advice_Finance_Thread", 1, context)
		return true
	end
	return false
end

--[[ 2201_Campaign_Advice_Clan_Management_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.TurnNumber(context) == 6 and not conditions.CampaignName("tut_shogun", context) and not conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("2201_Campaign_Advice_Clan_Management_Thread", 1, context)
		return true
	end
	return false
end

--[[ 2202_Campaign_Advice_Drop_In_Battles_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.TurnNumber(context) == 11 and not conditions.CampaignName("tut_shogun", context) then
		return true
	end
	return false
end

--[[ 2211_Campaign_Advice_Recruit_Cmd_Trigger ]]--

events.PanelOpenedCampaign[#events.PanelOpenedCampaign+1] =
function (context)
	if conditions.IsComponentType("enlist_commander", context) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("2211_Campaign_Advice_Recruit_Cmd_Thread", 1, context)
		return true
	end
	return false
end

--[[ 2213_Campaign_Advice_New_Protectorate_Trigger ]]--

events.ClanBecomesVassal[#events.ClanBecomesVassal+1] =
function (context)
	if conditions.IsPlayerTurn(context) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("2213_Campaign_Advice_New_Protectorate_Thread", 1, context)
		return true
	end
	return false
end

--[[ 2214_Campaign_Advice_Attrition_Trigger ]]--

events.CharacterEntersAttritionalArea[#events.CharacterEntersAttritionalArea+1] =
function (context)
	if conditions.CharacterIsLocalCampaign(context) and conditions.IsPlayerTurn(context) and not conditions.CampaignName("tut_shogun", context) and not conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("2214_Campaign_Advice_Attrition_Thread", 1, context)
		return true
	end
	return false
end

--[[ 2214a_Campaign_Advice_Attrition_Trigger ]]--

events.CharacterEntersAttritionalArea[#events.CharacterEntersAttritionalArea+1] =
function (context)
	if conditions.CharacterIsLocalCampaign(context) and conditions.IsPlayerTurn(context) and conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("2214a_Campaign_Advice_Attrition_Thread", 1, context)
		return true
	end
	return false
end

--[[ 2215_Campaign_Advice_Clan_Traits_Trigger ]]--

events.PanelOpenedCampaign[#events.PanelOpenedCampaign+1] =
function (context)
	if conditions.IsComponentType("Summary", context) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("2215_Campaign_Advice_Clan_Traits_Thread", 1, context)
		return true
	end
	return false
end

--[[ 2216_Campaign_Advice_Effects_Bundles_Trigger ]]--

events.ComponentLClickUp[#events.ComponentLClickUp+1] =
function (context)
	if (conditions.IsComponentType("effect1", context) or conditions.IsComponentType("effect2", context) or conditions.IsComponentType("effect3", context) or conditions.IsComponentType("effect4", context) or conditions.IsComponentType("effect5", context)) then
		effect.advance_contextual_advice_thread("2216_Campaign_Advice_Effects_Bundles_Thread", 1, context)
		return true
	end
	return false
end

--[[ 2217_Campaign_Advice_Mission_Objectives_Trigger ]]--

events.MissionIssued[#events.MissionIssued+1] =
function (context)
	if not conditions.CampaignName("tut_shogun", context) and not conditions.CampaignName("jap_gempei", context) then
		effect.advance_contextual_advice_thread("2217_Campaign_Advice_Mission_Objectives_Thread", 1, context)
		return true
	end
	return false
end

--[[ 2218_Campaign_Advice_Skills_Tree_Trigger ]]--

events.PanelOpenedCampaign[#events.PanelOpenedCampaign+1] =
function (context)
	if conditions.IsComponentType("character_skills", context) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("2218_Campaign_Advice_Skills_Tree_Thread", 1, context)
		return true
	end
	return false
end

--[[ 2219_Campaign_Advice_Region_Specialities_Trigger ]]--

events.SlotSelected[#events.SlotSelected+1] =
function (context)
	if conditions.SlotIsLocal(context) and (conditions.SlotType("SHO_Region_Specialty_Craftwork_1_Artisans", context) or conditions.SlotType("SHO_Region_Specialty_Craftwork_2_Fletchers", context) or conditions.SlotType("SHO_Region_Specialty_Craftwork_2_Paper_Mills", context) or conditions.SlotType("SHO_Region_Specialty_Craftwork_3_Laquerware", context) or conditions.SlotType("SHO_Region_Specialty_Craftwork_3_Master_Bowmaker", context) or conditions.SlotType("SHO_Region_Specialty_Gold_Mining_1_Surface_Mining", context) or conditions.SlotType("SHO_Region_Specialty_Gold_Mining_2_Open_Pit", context) or conditions.SlotType("SHO_Region_Specialty_Gold_Mining_3_Mining_Complex", context) or conditions.SlotType("SHO_Region_Specialty_Holy_Site_1_Holy_Site", context) or conditions.SlotType("SHO_Region_Specialty_Holy_Site_2_Mountain_Hermitag", context) or conditions.SlotType("SHO_Region_Specialty_Holy_Site_2_Pilgrim_Hostel", context) or conditions.SlotType("SHO_Region_Specialty_Holy_Site_3_Fortified_Monaste", context) or conditions.SlotType("SHO_Region_Specialty_Holy_Site_3_Great_Soja_Shrine", context) or conditions.SlotType("SHO_Region_Specialty_Horses_1_Pastures", context) or conditions.SlotType("SHO_Region_Specialty_Horses_2_Breeders", context) or conditions.SlotType("SHO_Region_Specialty_Horses_3_Warhorse_Breeders", context) or conditions.SlotType("SHO_Region_Specialty_Intellectual_Centre_1_School", context) or conditions.SlotType("SHO_Region_Specialty_Intellectual_Centre_2_Library", context) or conditions.SlotType("SHO_Region_Specialty_Intellectual_Centre_2_Magistr", context) or conditions.SlotType("SHO_Region_Specialty_Intellectual_Centre_3_Academy", context) or conditions.SlotType("SHO_Region_Specialty_Intellectual_Centre_3_Law_Cou", context) or conditions.SlotType("SHO_Region_Specialty_Iron_Mining_1_Iron_Mine", context) or conditions.SlotType("SHO_Region_Specialty_Iron_Mining_2_Deep_Mine", context) or conditions.SlotType("SHO_Region_Specialty_Iron_Mining_3_Mining_Complex", context) or conditions.SlotType("SHO_Region_Specialty_Naval_1_Merchant_Colony", context) or conditions.SlotType("SHO_Region_Specialty_Naval_2_Pirate_Lair", context) or conditions.SlotType("SHO_Region_Specialty_Naval_2_Warehouses", context) or conditions.SlotType("SHO_Region_Specialty_Naval_3_Pirate_Fortress", context) or conditions.SlotType("SHO_Region_Specialty_Naval_3_Red_Seal_Company", context) or conditions.SlotType("SHO_Region_Specialty_Ninja_1_Hideout", context) or conditions.SlotType("SHO_Region_Specialty_Ninja_2_Burakumin", context) or conditions.SlotType("SHO_Region_Specialty_Ninja_2_Ninjutsu_School", context) or conditions.SlotType("SHO_Region_Specialty_Ninja_3_Clan_Fortress", context) or conditions.SlotType("SHO_Region_Specialty_Ninja_3_Smuggling_Network", context) or conditions.SlotType("SHO_Region_Specialty_Smithing_1_Blacksmith", context) or conditions.SlotType("SHO_Region_Specialty_Smithing_2_Armourer", context) or conditions.SlotType("SHO_Region_Specialty_Smithing_2_Weaponsmith", context) or conditions.SlotType("SHO_Region_Specialty_Smithing_3_Master_Armourer", context) or conditions.SlotType("SHO_Region_Specialty_Smithing_3_Master_Weaponsmith", context) or conditions.SlotType("SHO_Region_Specialty_Stone_1_Stonemason", context) or conditions.SlotType("SHO_Region_Specialty_Stone_2_Quarry", context) or conditions.SlotType("SHO_Region_Specialty_Stone_3_Stoneworls", context) or conditions.SlotType("SHO_Region_Specialty_Timber_1_Lumbercamp", context) or conditions.SlotType("SHO_Region_Specialty_Timber_2_Lumberyards", context) or conditions.SlotType("SHO_Region_Specialty_Timber_3_Sawmills", context)) then
		effect.advance_contextual_advice_thread("2219_Campaign_Advice_Region_Specialities_Thread", 1, context)
		return true
	end
	return false
end

--[[ 2220_Campaign_Advice_Food_Supplies_Trigger ]]--

events.SettlementSelected[#events.SettlementSelected+1] =
function (context)
	if conditions.SettlementIsLocal(context) and not conditions.CampaignName("tut_shogun", context) and not conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("2220_Campaign_Advice_Food_Supplies_Thread", 1, context)
		return true
	end
	return false
end

--[[ 2221_Campaign_Advice_Fleets_Reveal_Trigger ]]--

events.CharacterSelected[#events.CharacterSelected+1] =
function (context)
	if conditions.CharacterIsLocalCampaign(context) and (conditions.CharacterType("General", context) or conditions.CharacterType("colonel", context)) and conditions.IsAdmiral(context) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("2221_Campaign_Advice_Fleets_Reveal_Thread", 1, context)
		return true
	end
	return false
end

--[[ 2222_Campaign_Advice_Natural_Disasters_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.TurnNumber(context) >= 12 and not conditions.CampaignName("tut_shogun", context) and not conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("2222_Campaign_Advice_Natural_Disasters_Thread", 1, context)
		return true
	end
	return false
end

--[[ 2223_Campaign_Advice_Riots_Trigger ]]--

events.SettlementSelected[#events.SettlementSelected+1] =
function (context)
	if conditions.SettlementIsLocal(context) and not conditions.CampaignName("tut_shogun", context) and not conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("2223_Campaign_Advice_Riots_Thread", 1, context)
		return true
	end
	return false
end

--[[ 2223a_Campaign_Advice_Riots_Trigger ]]--

events.SettlementSelected[#events.SettlementSelected+1] =
function (context)
	if conditions.SettlementIsLocal(context) and conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("2223a_Campaign_Advice_Riots_Thread", 1, context)
		return true
	end
	return false
end

--[[ 2224_Campaign_Advice_Rebellions_Trigger ]]--

events.SettlementSelected[#events.SettlementSelected+1] =
function (context)
	if conditions.SettlementIsLocal(context) and not conditions.CampaignName("tut_shogun", context) and not conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("2224_Campaign_Advice_Rebellions_Thread", 1, context)
		return true
	end
	return false
end

--[[ 2224a_Campaign_Advice_Rebellions_Trigger ]]--

events.SettlementSelected[#events.SettlementSelected+1] =
function (context)
	if conditions.SettlementIsLocal(context) and conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("2224a_Campaign_Advice_Rebellions_Thread", 1, context)
		return true
	end
	return false
end

--[[ 2225_Campaign_Advice_Province_Wealth_Trigger ]]--

events.PanelOpenedCampaign[#events.PanelOpenedCampaign+1] =
function (context)
	if conditions.IsComponentType("region_info", context) and not conditions.CampaignName("tut_shogun", context) and not conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("2225_Campaign_Advice_Province_Wealth_Thread", 1, context)
		return true
	end
	return false
end

--[[ 2225a_Campaign_Advice_Province_Wealth_Trigger ]]--

events.PanelOpenedCampaign[#events.PanelOpenedCampaign+1] =
function (context)
	if conditions.IsComponentType("region_info", context) and conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("2225a_Campaign_Advice_Province_Wealth_Thread", 1, context)
		return true
	end
	return false
end

--[[ 2226_Campaign_Advice_Being_Shogun_Trigger ]]--

events.FactionBecomesShogun[#events.FactionBecomesShogun+1] =
function (context)
	if conditions.FactionIsLocal(context) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("2226_Campaign_Advice_Being_Shogun_Thread", 1, context)
		return true
	end
	return false
end

--[[ 2227_Campaign_Advice_Losing_Generals_Trigger ]]--

events.PanelOpenedCampaign[#events.PanelOpenedCampaign+1] =
function (context)
	if conditions.IsComponentType("popup_pre_battle", context) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("2227_Campaign_Advice_Losing_Generals_Thread", 1, context)
		return true
	end
	return false
end

--[[ 2228_Campaign_Advice_Experience_Sea_Trigger ]]--

events.CharacterCompletedBattle[#events.CharacterCompletedBattle+1] =
function (context)
	if conditions.CharacterIsLocalCampaign(context) and conditions.IsAdmiral(context) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("2228_Campaign_Advice_Experience_Sea_Thread", 1, context)
		return true
	end
	return false
end

--[[ 2229_Campaign_Advice_Exempt_Warning_Trigger ]]--

events.RegionTurnStart[#events.RegionTurnStart+1] =
function (context)
	if conditions.RegionIsLocal(context) and conditions.RegionTaxExemptLongerThan(10, context) and conditions.RegionWouldBeHappyWithNoTaxExemption(context) and not conditions.CampaignName("tut_shogun", context) then
		effect.advance_contextual_advice_thread("2229_Campaign_Advice_Exempt_Warning_Thread", 1, context)
		return true
	end
	return false
end

--[[ 2230_Campaign_Advice_Recruit_Agents_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and not conditions.FactionHasRecruitedAnyAgents(context) and conditions.TurnNumber(context) >= 25 and not conditions.CampaignName("tut_shogun", context) and not conditions.CampaignName("jap_gempei", context) and not conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("2230_Campaign_Advice_Recruit_Agents_Thread", 1, context)
		return true
	end
	return false
end

--[[ 2230a_Campaign_Advice_Recruit_Agents_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and not conditions.FactionHasRecruitedAnyAgents(context) and conditions.TurnNumber(context) >= 25 and conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("2230a_Campaign_Advice_Recruit_Agents_Thread", 1, context)
		return true
	end
	return false
end

--[[ 2231_Campaign_Advice_Shirabyoshi_Selected_Trigger ]]--

events.CharacterSelected[#events.CharacterSelected+1] =
function (context)
	if conditions.CharacterIsLocalCampaign(context) and conditions.CharacterType("gempei_dancer", context) and conditions.CampaignName("jap_gempei", context) then
		effect.advance_contextual_advice_thread("2231_Campaign_Advice_Shirabyoshi_Selected_Thread", 1, context)
		return true
	end
	return false
end

--[[ 2232_Campaign_Advice_Sou_ Selected_Trigger ]]--

events.CharacterSelected[#events.CharacterSelected+1] =
function (context)
	if conditions.CharacterIsLocalCampaign(context) and conditions.CharacterType("gempei_monk", context) and conditions.CampaignName("jap_gempei", context) then
		effect.advance_contextual_advice_thread("2232_Campaign_Advice_Sou_Selected_Thread", 1, context)
		return true
	end
	return false
end

--[[ 2233_Campaign_Advice_Junsatsushi_ Selected_Trigger ]]--

events.CharacterSelected[#events.CharacterSelected+1] =
function (context)
	if conditions.CharacterIsLocalCampaign(context) and conditions.CharacterType("gempei_inspector", context) and conditions.CampaignName("jap_gempei", context) then
		effect.advance_contextual_advice_thread("2233_Campaign_Advice_Junsatsushi_Selected_Thread", 1, context)
		return true
	end
	return false
end

--[[ 2234_Campaign_Advice_Monomi_ Selected_Trigger ]]--

events.CharacterSelected[#events.CharacterSelected+1] =
function (context)
	if conditions.CharacterIsLocalCampaign(context) and conditions.CharacterType("gempei_spy", context) and conditions.CampaignName("jap_gempei", context) then
		effect.advance_contextual_advice_thread("2234_Campaign_Advice_Monomi_Selected_Thread", 1, context)
		return true
	end
	return false
end

--[[ 2236_Campaign_Advice_Gempei_Influence_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.TurnNumber(context) == 2 and conditions.CampaignName("jap_gempei", context) and not conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("2236_Campaign_Advice_Gempei_Influence_Thread", 1, context)
		return true
	end
	return false
end

--[[ 2236a_Campaign_Advice_Allegiance_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.TurnNumber(context) == 3 and conditions.CampaignName("jap_boshin", context)  then
		effect.advance_contextual_advice_thread("2236a_Campaign_Advice_Allegiance_Thread", 1, context)
		return true
	end
	return false
end

--[[ 2238_Campaign_Advice_Railways_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.TurnNumber(context) == 6 and conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("2238_Campaign_Advice_Railways_Thread", 1, context)
		return true
	end
	return false
end

--[[ 2239_Campaign_Advice_Naval_Bombardment_Trigger ]]--

events.CharacterSelected[#events.CharacterSelected+1] =
function (context)
	if conditions.CharacterIsLocalCampaign(context) and conditions.CharacterCommandsNavy(context) and conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("2239_Campaign_Advice_Naval_Bombardment_Thread", 1, context)
		return true
	end
	return false
end

--[[ 2240_Campaign_Advice_Artillery_Support_Trigger ]]--

events.CharacterSelected[#events.CharacterSelected+1] =
function (context)
	if conditions.CharacterIsLocalCampaign(context) and conditions.CharacterType("General", context) and conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("2240_Campaign_Advice_Artillery_Support_Thread", 1, context)
		return true
	end
	return false
end

--[[ 2241_Campaign_Advice_Reinforcements_Trigger ]]--

events.CharacterSelected[#events.CharacterSelected+1] =
function (context)
	if conditions.CharacterIsLocalCampaign(context) and conditions.CharacterType("General", context) and conditions.CampaignName("jap_boshin", context) then
		return true
	end
	return false
end

--[[ 2242_Campaign_Advice_Coastal_Defences_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.TurnNumber(context) == 7 and conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("2242_Campaign_Advice_Coastal_Defences_Thread", 1, context)
		return true
	end
	return false
end

--[[ 2243_Campaign_Advice_Port_Battle_Trigger ]]--

events.CharacterSelected[#events.CharacterSelected+1] =
function (context)
	if conditions.CharacterIsLocalCampaign(context) and (conditions.CharacterType("General", context) or conditions.CharacterType("colonel", context)) and conditions.IsAdmiral(context) and conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("2243_Campaign_Advice_Port_Battle_Thread", 1, context)
		return true
	end
	return false
end

--[[ 2244_Campaign_Advice_Video_Tutorials_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.TurnNumber(context) == 2 and conditions.CampaignName("jap_boshin", context)  then
		effect.advance_contextual_advice_thread("2244_Campaign_Advice_Video_Tutorials_Thread", 1, context)
		return true
	end
	return false
end

--[[ 2245_Campaign_Advice_Foreign_Trade_Routes_Trigger ]]--

events.BuildingCompleted[#events.BuildingCompleted+1] =
function (context)
	if (conditions.IsBuildingOfType("bos_port_4_american_trading_district", context) or conditions.IsBuildingOfType("bos_port_4_british_trading_district", context) or conditions.IsBuildingOfType("bos_port_4_french_trading_district", context)) and conditions.CampaignName("jap_boshin", context) then
		effect.advance_contextual_advice_thread("2245_Campaign_Advice_Foreign_Trade_Routes_Thread", 1, context)
		return true
	end
	return false
end

--[[ 3000_STW2_Clan_Intro_Chosokabe_1_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.FactionName("chosokabe", context) and not conditions.CampaignName("tut_shogun", context) and conditions.TurnNumber(context) == 1 then
		effect.advance_contextual_advice_thread("3000_STW2_Clan_Intro_Chosokabe_1", 1, context)
		return true
	end
	return false
end

--[[ 3003_STW2_Clan_Intro_Oda_1_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.FactionName("oda", context) and not conditions.CampaignName("tut_shogun", context) and conditions.TurnNumber(context) == 1 then
		effect.advance_contextual_advice_thread("3003_STW2_Clan_Intro_Oda_1", 1, context)
		return true
	end
	return false
end

--[[ 3006_STW2_Clan_Intro_Uesugi_1_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.FactionName("uesugi", context) and not conditions.CampaignName("tut_shogun", context) and conditions.TurnNumber(context) == 1 then
		effect.advance_contextual_advice_thread("3006_STW2_Clan_Intro_Uesugi_1", 1, context)
		return true
	end
	return false
end

--[[ 3009_STW2_Clan_Intro_Date_1_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.FactionName("date", context) and not conditions.CampaignName("tut_shogun", context) and conditions.TurnNumber(context) == 1 then
		effect.advance_contextual_advice_thread("3009_STW2_Clan_Intro_Date_1", 1, context)
		return true
	end
	return false
end

--[[ 3012_STW2_Clan_Intro_Hojo_1_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.FactionName("hojo", context) and not conditions.CampaignName("tut_shogun", context) and conditions.TurnNumber(context) == 1 then
		effect.advance_contextual_advice_thread("3012_STW2_Clan_Intro_Hojo_1", 1, context)
		return true
	end
	return false
end

--[[ 3015_STW2_Clan_Intro_Mori_1_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.FactionName("mori", context) and not conditions.CampaignName("tut_shogun", context) and conditions.TurnNumber(context) == 1 then
		effect.advance_contextual_advice_thread("3015_STW2_Clan_Intro_Mori_1", 1, context)
		return true
	end
	return false
end

--[[ 3018_STW2_Clan_Intro_Hattori_1_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.FactionName("iga_ninja", context) and not conditions.CampaignName("tut_shogun", context) and conditions.TurnNumber(context) == 1 then
		effect.advance_contextual_advice_thread("3018_STW2_Clan_Intro_Hattori_1", 1, context)
		return true
	end
	return false
end

--[[ 3021_STW2_Clan_Intro_Takeda_1_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.FactionName("takeda", context) and not conditions.CampaignName("tut_shogun", context) and conditions.TurnNumber(context) == 1 then
		effect.advance_contextual_advice_thread("3021_STW2_Clan_Intro_Takeda_1", 1, context)
		return true
	end
	return false
end

--[[ 3024_STW2_Clan_Intro_Shimazu_1_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.FactionName("shimazu", context) and not conditions.CampaignName("tut_shogun", context) and conditions.TurnNumber(context) == 1 then
		effect.advance_contextual_advice_thread("3024_STW2_Clan_Intro_Shimazu_1", 1, context)
		return true
	end
	return false
end

--[[ 3027_STW2_Clan_Intro_Tokugawa_1_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.FactionName("tokugawa", context) and not conditions.CampaignName("tut_shogun", context) and conditions.TurnNumber(context) == 1 then
		effect.advance_contextual_advice_thread("3027_STW2_Clan_Intro_Tokugawa_1", 1, context)
		return true
	end
	return false
end

--[[ 3030_STW2_Clan_Intro_Ikko_Ikki_1_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.FactionName("ikko_ikki", context) and not conditions.CampaignName("tut_shogun", context) and conditions.TurnNumber(context) == 1 then
		effect.advance_contextual_advice_thread("3030_STW2_Clan_Intro_Ikko_Ikki_1", 1, context)
		return true
	end
	return false
end

--[[ 3033_STW2_Gempei_Clan_Intro_Minamoto_1_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and (conditions.FactionName("gem_minamoto_kamakura", context) or conditions.FactionName("gem_minamoto_kiso", context)) and conditions.CampaignName("jap_gempei", context) and conditions.TurnNumber(context) == 1 then
		effect.advance_contextual_advice_thread("3033_STW2_Gempei_Clan_Intro_Minamoto_1_Thread", 1, context)
		return true
	end
	return false
end

--[[ 3034_STW2_Gempei_Clan_Intro_Taira_1_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and (conditions.FactionName("gem_taira_fukuhara", context) or conditions.FactionName("gem_taira_yashima", context)) and conditions.CampaignName("jap_gempei", context) and conditions.TurnNumber(context) == 1 then
		effect.advance_contextual_advice_thread("3034_STW2_Gempei_Clan_Intro_Taira_1_Thread", 1, context)
		return true
	end
	return false
end

--[[ 3035_STW2_Gempei_Clan_Intro_Fujiwara_1_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and (conditions.FactionName("gem_fujiwara_hiraizumi", context) or conditions.FactionName("gem_fujiwara_kubota", context)) and conditions.CampaignName("jap_gempei", context) and conditions.TurnNumber(context) == 1 then
		effect.advance_contextual_advice_thread("3035_STW2_Gempei_Clan_Intro_Fujiwara_1_Thread", 1, context)
		return true
	end
	return false
end

--[[ 3036_STW2_Boshin_Clan_Intro_Satsuma_1_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.FactionName("bos_satsuma", context) and conditions.CampaignName("jap_boshin", context) and conditions.TurnNumber(context) == 1 then
		effect.advance_contextual_advice_thread("3036_STW2_Boshin_Clan_Intro_Satsuma_1_Thread", 1, context)
		return true
	end
	return false
end

--[[ 3037_STW2_Boshin_Clan_Intro_Choshu_1_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.FactionName("bos_choshu", context) and conditions.CampaignName("jap_boshin", context) and conditions.TurnNumber(context) == 1 then
		effect.advance_contextual_advice_thread("3037_STW2_Boshin_Clan_Intro_Choshu_1_Thread", 1, context)
		return true
	end
	return false
end

--[[ 3038_STW2_Boshin_Clan_Intro_Tosa_1_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.FactionName("bos_tosa", context) and conditions.CampaignName("jap_boshin", context) and conditions.TurnNumber(context) == 1 then
		effect.advance_contextual_advice_thread("3038_STW2_Boshin_Clan_Intro_Tosa_1_Thread", 1, context)
		return true
	end
	return false
end

--[[ 3039_STW2_Boshin_Clan_Intro_Aizu_1_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.FactionName("bos_aizu", context) and conditions.CampaignName("jap_boshin", context) and conditions.TurnNumber(context) == 1 then
		effect.advance_contextual_advice_thread("3039_STW2_Boshin_Clan_Intro_Aizu_1_Thread", 1, context)
		return true
	end
	return false
end

--[[ 3040_STW2_Boshin_Clan_Intro_Jozai_1_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.FactionName("bos_jozai", context) and conditions.CampaignName("jap_boshin", context) and conditions.TurnNumber(context) == 1 then
		effect.advance_contextual_advice_thread("3040_STW2_Boshin_Clan_Intro_Jozai_1_Thread", 1, context)
		return true
	end
	return false
end

--[[ 3041_STW2_Boshin_Clan_Intro_Nagaoka_1_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.FactionName("bos_nagaoka", context) and conditions.CampaignName("jap_boshin", context) and conditions.TurnNumber(context) == 1 then
		effect.advance_contextual_advice_thread("3041_STW2_Boshin_Clan_Intro_Nagaoka_1_Thread", 1, context)
		return true
	end
	return false
end

--[[ 3042_STW2_Boshin_Clan_Intro_Saga_1_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.FactionName("bos_saga", context) and conditions.CampaignName("jap_boshin", context) and conditions.TurnNumber(context) == 1 then
		effect.advance_contextual_advice_thread("3042_STW2_Boshin_Clan_Intro_Saga_1_Thread", 1, context)
		return true
	end
	return false
end

--[[ 3043_STW2_Boshin_Clan_Intro_Tsu_1_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.FactionName("bos_ueno", context) and conditions.CampaignName("jap_boshin", context) and conditions.TurnNumber(context) == 1 then
		effect.advance_contextual_advice_thread("3043_STW2_Boshin_Clan_Intro_Tsu_1_Thread", 1, context)
		return true
	end
	return false
end

--[[ 3044_STW2_Boshin_Clan_Intro_Sendai_1_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.FactionName("bos_sendai", context) and conditions.CampaignName("jap_boshin", context) and conditions.TurnNumber(context) == 1 then
		effect.advance_contextual_advice_thread("3044_STW2_Boshin_Clan_Intro_Sendai_1_Thread", 1, context)
		return true
	end
	return false
end

--[[ 3045_STW2_Boshin_Clan_Intro_Obama_1_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.FactionName("bos_obama", context) and conditions.CampaignName("jap_boshin", context) and conditions.TurnNumber(context) == 1 then
		effect.advance_contextual_advice_thread("3045_STW2_Boshin_Clan_Intro_Obama_1_Thread", 1, context)
		return true
	end
	return false
end

--[[ 4000_STW2_Clan_Intro_Otomo_1_Trigger ]]--

events.FactionTurnStart[#events.FactionTurnStart+1] =
function (context)
	if conditions.FactionIsLocal(context) and conditions.FactionName("otomo", context) and not conditions.CampaignName("tut_shogun", context) and conditions.TurnNumber(context) == 1 then
		effect.advance_contextual_advice_thread("4000_STW2_Clan_Intro_Otomo", 1, context)
		return true
	end
	return false
end

