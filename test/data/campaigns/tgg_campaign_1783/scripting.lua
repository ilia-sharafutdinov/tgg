local advice = require "export_advice"
local historic_events = require "export_historic_events"
local scripting = require "EpisodicScripting"
local camera_pan = 0

local function OnAdviceIssued(context)
	-- 0013_Battle_Advice_Missile_Superiority_Thread
	if conditions.AdviceJustDisplayed("-1875830202", context) then
		scripting.HighlightComponent("button_melee", true)

	-- 0065_Battle_Advice_Outnumbered_By_The_Enemy_Thread
	elseif conditions.AdviceJustDisplayed("-758254518", context) then
		scripting.HighlightComponent("button_withdraw", true)

	-- 0077_Battle_Advice_Fire_At_Will_Button_Thread 
	elseif conditions.AdviceJustDisplayed("737354545", context) then
		scripting.HighlightComponent("button_fire_at_will", true)

  	--0079_Battle_Advice_Group_Formations_Button_Thread 
	elseif conditions.AdviceJustDisplayed("2029281479", context) then
		scripting.HighlightComponent("button_groupforms", true)

	--0080_Battle_Advice_Withdraw_Button_Thread 
	elseif conditions.AdviceJustDisplayed("1621609724", context) then
		scripting.HighlightComponent("button_withdraw", true)

	--0081_Battle_Advice_Cancel_Order_Button_Thread 
	elseif conditions.AdviceJustDisplayed("313094221", context) then
		scripting.HighlightComponent("button_halt", true)

	--0082_Battle_Advice_Group_Button_Thread
 	elseif conditions.AdviceJustDisplayed("-722605174", context) then
		scripting.HighlightComponent("button_group", true)

	--0083_Battle_Advice_Group_Formations_Button_Thread
 	elseif conditions.AdviceJustDisplayed("-537894077", context) then
		scripting.HighlightComponent("button_groupforms", true)

	--0100_Battle_Advice_Radar_Map_Thread
 	elseif conditions.AdviceJustDisplayed("-1755835367", context) then
		scripting.HighlightComponent("radar", true)

	--0103_Battle_Advice_Melee_Button_Thread
 	elseif conditions.AdviceJustDisplayed("1424352004", context) then
		scripting.HighlightComponent("button_melee", true)

	--0104_Battle_Advice_Run_Button_Thread
 	elseif conditions.AdviceJustDisplayed("593395637", context) then
		scripting.HighlightComponent("button_movespeed", true)

	--0106_Battle_Advice_Killometer_Thread
 	elseif conditions.AdviceJustDisplayed("-729505557", context) then
		scripting.HighlightComponent("killometer_clip", true)

	--0107_Battle_Advice_Bombardment_Thread
 	elseif conditions.AdviceJustDisplayed("1738763088", context) then
		scripting.HighlightComponent("button_halt", true)
	
	--0144_Battle_Advice_Defending_Forts_Thread
 	elseif conditions.AdviceJustDisplayed("-2693399", context) then
		scripting.HighlightComponent("button_fire_at_will", true)
		
	--0150_Battle_Advice_Target_Their_Weaknesses_Thread
 	elseif conditions.AdviceJustDisplayed("1169098043", context) then
		scripting.HighlightComponent("nav_button_broadside_L", true)	
		
	--0157_Battle_Advice_Ship_Ablaze_Thread
 	elseif conditions.AdviceJustDisplayed("1950152570", context) then
		scripting.HighlightComponent("button_fire_at_will", true)

	--0175_Battle_Advice_Wind_Direction_Thread
 	elseif conditions.AdviceJustDisplayed("-608013080", context) then
		scripting.HighlightComponent("radar", true)

	--0181_Battle_Advice_Outgunned_Avoidance_Thread
 	elseif conditions.AdviceJustDisplayed("-1459886398", context) then
		scripting.HighlightComponent("nav_button_shot_chain", true)

	--0182_Battle_Advice_Crossing_The_T_Thread
 	elseif conditions.AdviceJustDisplayed("1813634075", context) then
		scripting.HighlightComponent("nav_button_broadside_L", true)
	
	--0185_Battle_Advice_Naval_Round_Shot_Thread
 	elseif conditions.AdviceJustDisplayed("-111077650", context) then
		scripting.HighlightComponent("nav_button_shot_standard", true)	

	--0186_Battle_Advice_Naval_Grape_Shot_Thread
 	elseif conditions.AdviceJustDisplayed("-1507140649", context) then
		scripting.HighlightComponent("nav_button_shot_grape", true)	


	--0187_Battle_Advice_Naval_Chain_Shot_Thread
 	elseif conditions.AdviceJustDisplayed("-1177825588", context) then
		scripting.HighlightComponent("nav_button_shot_chain", true)

	--0188_Battle_Advice_Naval_Radar_Map_Thread
 	elseif conditions.AdviceJustDisplayed("2073993693", context) then
		scripting.HighlightComponent("radar", true)

	--0189_Battle_Advice_Naval_Manoeuvre_Compass_Thread
 	elseif conditions.AdviceJustDisplayed("646906330", context) then
		scripting.HighlightComponent("nav_UC_button_turn_left", true)	
	
	--0190_Battle_Advice_Left_Broadside_Button_Thread
 	elseif conditions.AdviceJustDisplayed("-145936557", context) then
		scripting.HighlightComponent("nav_button_broadside_L", true)

	--0191_Battle_Advice_Right_Broadside_Button_Thread
 	elseif conditions.AdviceJustDisplayed("1188422552", context) then
		scripting.HighlightComponent("nav_button_broadside_R", true)

	--0192_Battle_Advice_Naval_Group_Button_Thread
 	elseif conditions.AdviceJustDisplayed("-1944874567", context) then
		scripting.HighlightComponent("button_group", true)

	--0195_Battle_Advice_Naval_Withdraw_Button_Thread
 	elseif conditions.AdviceJustDisplayed("-783991516", context) then
		scripting.HighlightComponent("button_withdraw", true)

	--0196_Battle_Advice_Naval_Fire_At_Will_Thread
 	elseif conditions.AdviceJustDisplayed("-1827006635", context) then
		scripting.HighlightComponent("button_fire_at_will", true)

	--0197_Battle_Advice_Naval_Boarding_Button_Thread
 	elseif conditions.AdviceJustDisplayed("952924146", context) then
		scripting.HighlightComponent("nav_button_board", true)

	--0198_Battle_Advice_Naval_Formations_Button_Thread
 	elseif conditions.AdviceJustDisplayed("1916043659", context) then
		scripting.HighlightComponent("nav_button_groupforms", true)

	--1029_Campaign_Advice_UI_Government_Panel_Thread
 	elseif conditions.AdviceJustDisplayed("-891171119", context) then
		scripting.HighlightComponent("button_public-order lowest", true)

	--1041_Campaign_Advice_UI_Incoming_Message_Thread
 	elseif conditions.AdviceJustDisplayed("1216388585", context) then
		scripting.HighlightComponent("Icon", true)

	--1051_Campaign_Advice_Army_Promotions_Thread
 	elseif conditions.AdviceJustDisplayed("-1061827595", context) then
		scripting.HighlightComponent("army_promote", true)

	--1052_Campaign_Advice_Navy_Promotions_Thread
 	elseif conditions.AdviceJustDisplayed("695400466", context) then
		scripting.HighlightComponent("navy_promote", true)

	--1064_Campaign_Advice_Slot_Selected_Thread
 	elseif conditions.AdviceJustDisplayed("1326115363", context) then
		scripting.HighlightComponent("army_fort", true)

	--1065_Campaign_Advice_Character_Selected_Thread
 	elseif conditions.AdviceJustDisplayed("659772888", context) then
		scripting.HighlightComponent("recruitment_tab", true)

	--1065_Campaign_Advice_Character_Selected_Thread
 	elseif conditions.AdviceJustDisplayed("1372607332", context) then
		scripting.HighlightComponent("army_replenish", true)

	--1100_Campaign_Advice_Government_Type_Thread
 	elseif conditions.AdviceJustDisplayed("-1671835166", context) then
		scripting.HighlightComponent("button_government", true)

	--1110_Campaign_Advice_Trade_Routes_Thread
 	elseif conditions.AdviceJustDisplayed("1242837398", context) then
		scripting.HighlightComponent("button_diplomacy", true)

	--1115_Campaign_Advice_Victory_Conditions_Thread
 	elseif conditions.AdviceJustDisplayed("1049050650", context) then
		scripting.HighlightComponent("button_missions", true)

	--1116_Campaign_Advice_Prestige_Thread
 	elseif conditions.AdviceJustDisplayed("-956562909", context) then
		scripting.HighlightComponent("button_missions", true)

	--1124_Campaign_Advice_Warning_Bankrupt_Thread
 	elseif conditions.AdviceJustDisplayed("295527590", context) then
		scripting.HighlightComponent("button_diplomacy", true)

	--1127_Campaign_Advice_Warning_Trade_Thread
 	elseif conditions.AdviceJustDisplayed("1264671506", context) then
		scripting.HighlightComponent("button_diplomacy", true)

	--1136_Campaign_Advice_Religious_Unrest_Thread
 	elseif conditions.AdviceJustDisplayed("1219045742", context) then
		scripting.HighlightComponent("button_tech", true)

	--1138_Campaign_Advice_Warning_Population_Thread
 	elseif conditions.AdviceJustDisplayed("-1395907252", context) then
		scripting.HighlightComponent("button_tech", true)

	--1139_Campaign_Advice_Warning_Population_Thread
 	elseif conditions.AdviceJustDisplayed("-1604004259", context) then
		scripting.HighlightComponent("button_tech", true)

	--1202_Campaign_Advice_UI_Help_Buildings_Thread
 	elseif conditions.AdviceJustDisplayed("-174893187", context) then
		scripting.HighlightComponent("build_browser", true)

	--1030b_Campaign_Advice_UI_Government_Panel_Thread
 	elseif conditions.AdviceJustDisplayed("-428335498", context) then
		scripting.HighlightComponent("button_government", true)

	--1030c_Campaign_Advice_UI_Government_Panel_Thread
 	elseif conditions.AdviceJustDisplayed("-250658412", context) then
		scripting.HighlightComponent("button_government", true)

--1011_Campaign_Advice_America_Initial_Turns_Thread
--America camera pans = 11, 12, 13
	
	elseif conditions.AdviceJustDisplayed("-759552923", context) then
		scripting.game_interface:set_zoom_limit(1.08, 0.02)
		CampaignUI.ScrollCamera(23,	{-548.000, 269.000, 0.95},
								{-511.000, 304.000, 0.85},
								{-520.000, 280.000, 0.90},
								{-535.000, 249.000, 0.95},
								{-568.000, 220.000, 0.95},
								{-559.000, 171.000, 0.85})
		camera_pan = 11
	
	end
end

local function OnCameraMoverFinished(context)

--1011_Campaign_Advice_America_Initial_Turns_Thread

	if camera_pan == 11 then
		CampaignUI.ScrollCamera(11,	{-719.000, 210.000, 0.65},
								{-633.000, 235.000, 0.70},
								{-574.000, 291.000, 0.75})
		camera_pan = 12
		
	elseif camera_pan == 12 then
		CampaignUI.ScrollCamera(9,	{-676.000, 208.000, 0.75},
								{-590.000, 206.000, 0.65},
								{-536.000, 281.000, 0.85})
		camera_pan = 13
	
		
	elseif camera_pan == 13 then
		scripting.game_interface:set_zoom_limit(1.0, 0.5)
		CampaignUI.SetCameraTarget(-536.000, 281.000)
		camera_pan = 0


	end
end


local function OnAdviceDismissed(context)
	if conditions.AdviceJustDisplayed("-1875830202", context) then
		scripting.HighlightComponent("button_melee", false)

	elseif conditions.AdviceJustDisplayed("-758254518", context) then
		scripting.HighlightComponent("button_withdraw", false)

	elseif conditions.AdviceJustDisplayed("737354545", context) then
		scripting.HighlightComponent("button_fire_at_will", false)

	elseif conditions.AdviceJustDisplayed("2029281479", context) then
		scripting.HighlightComponent("button_groupforms", false)

	elseif conditions.AdviceJustDisplayed("1621609724", context) then
		scripting.HighlightComponent("button_withdraw", false)

	elseif conditions.AdviceJustDisplayed("313094221", context) then
		scripting.HighlightComponent("button_halt", false)

	elseif conditions.AdviceJustDisplayed("-722605174", context) then
		scripting.HighlightComponent("button_group", false)

	elseif conditions.AdviceJustDisplayed("-537894077", context) then
		scripting.HighlightComponent("button_groupforms", false)

	elseif conditions.AdviceJustDisplayed("-1755835367", context) then
		scripting.HighlightComponent("radar", false)

	elseif conditions.AdviceJustDisplayed("1424352004", context) then
		scripting.HighlightComponent("button_melee", false)

	elseif conditions.AdviceJustDisplayed("593395637", context) then
		scripting.HighlightComponent("button_movespeed", false)

	elseif conditions.AdviceJustDisplayed("-729505557", context) then
		scripting.HighlightComponent("killometer_clip", false)

	elseif conditions.AdviceJustDisplayed("1738763088", context) then
		scripting.HighlightComponent("button_halt", false)

	elseif conditions.AdviceJustDisplayed("-2693399", context) then
		scripting.HighlightComponent("button_fire_at_will", false)

	elseif conditions.AdviceJustDisplayed("1169098043", context) then
		scripting.HighlightComponent("nav_button_broadside_L", false)
	
	elseif conditions.AdviceJustDisplayed("1950152570", context) then
		scripting.HighlightComponent("button_fire_at_will", false)

	elseif conditions.AdviceJustDisplayed("-608013080", context) then
		scripting.HighlightComponent("radar", false)

	elseif conditions.AdviceJustDisplayed("-1459886398", context) then
		scripting.HighlightComponent("nav_button_shot_chain", false)

	elseif conditions.AdviceJustDisplayed("1813634075", context) then
		scripting.HighlightComponent("nav_button_broadside_L", false)
		
	elseif conditions.AdviceJustDisplayed("-111077650", context) then
		scripting.HighlightComponent("nav_button_shot_standard", false)

	elseif conditions.AdviceJustDisplayed("-1507140649", context) then
		scripting.HighlightComponent("nav_button_shot_grape", false)

	elseif conditions.AdviceJustDisplayed("-1177825588", context) then
		scripting.HighlightComponent("nav_button_shot_chain", false)

	elseif conditions.AdviceJustDisplayed("2073993693", context) then
		scripting.HighlightComponent("radar", false)

	elseif conditions.AdviceJustDisplayed("646906330", context) then
		scripting.HighlightComponent("nav_UC_button_turn_left", false)
		
	elseif conditions.AdviceJustDisplayed("-145936557", context) then
		scripting.HighlightComponent("nav_button_broadside_L", false)

	elseif conditions.AdviceJustDisplayed("1188422552", context) then
		scripting.HighlightComponent("nav_button_broadside_R", false)

	elseif conditions.AdviceJustDisplayed("-1944874567", context) then
		scripting.HighlightComponent("button_group", false)

	elseif conditions.AdviceJustDisplayed("-783991516", context) then
		scripting.HighlightComponent("button_withdraw", false)

	elseif conditions.AdviceJustDisplayed("-1827006635", context) then
		scripting.HighlightComponent("button_fire_at_will", false)

	elseif conditions.AdviceJustDisplayed("952924146", context) then
		scripting.HighlightComponent("nav_button_board", false)

	elseif conditions.AdviceJustDisplayed("1916043659", context) then
		scripting.HighlightComponent("nav_button_groupforms", false)

	elseif conditions.AdviceJustDisplayed("-891171119", context) then
		scripting.HighlightComponent("button_public-order lowest", false)

	elseif conditions.AdviceJustDisplayed("1216388585", context) then
		scripting.HighlightComponent("Icon", false)

	elseif conditions.AdviceJustDisplayed("-1061827595", context) then
		scripting.HighlightComponent("army_promote", false)

	elseif conditions.AdviceJustDisplayed("695400466", context) then
		scripting.HighlightComponent("navy_promote", false)

	elseif conditions.AdviceJustDisplayed("1326115363", context) then
		scripting.HighlightComponent("army_fort", false)

	elseif conditions.AdviceJustDisplayed("659772888", context) then
		scripting.HighlightComponent("recruitment_tab", false)

	elseif conditions.AdviceJustDisplayed("1372607332", context) then
		scripting.HighlightComponent("army_replenish", false)

	elseif conditions.AdviceJustDisplayed("-1671835166", context) then
		scripting.HighlightComponent("button_government", false)

	elseif conditions.AdviceJustDisplayed("1242837398", context) then
		scripting.HighlightComponent("button_diplomacy", false)

	elseif conditions.AdviceJustDisplayed("1049050650", context) then
		scripting.HighlightComponent("button_missions", false)

	elseif conditions.AdviceJustDisplayed("-956562909", context) then
		scripting.HighlightComponent("button_missions", false)

	elseif conditions.AdviceJustDisplayed("295527590", context) then
		scripting.HighlightComponent("button_diplomacy", false)

	elseif conditions.AdviceJustDisplayed("1264671506", context) then
		scripting.HighlightComponent("button_diplomacy", false)

	elseif conditions.AdviceJustDisplayed("1219045742", context) then
		scripting.HighlightComponent("button_tech", false)

	elseif conditions.AdviceJustDisplayed("-1395907252", context) then
		scripting.HighlightComponent("button_tech", false)

	elseif conditions.AdviceJustDisplayed("-1604004259", context) then
		scripting.HighlightComponent("button_tech", false)

	elseif conditions.AdviceJustDisplayed("-174893187", context) then
		scripting.HighlightComponent("build_browser", false)

	elseif conditions.AdviceJustDisplayed("-428335498", context) then
		scripting.HighlightComponent("button_government", false)

	elseif conditions.AdviceJustDisplayed("-250658412", context) then
		scripting.HighlightComponent("button_government", false)
  		
 --************************************** this is how you can stop the camera pan when the user dismisses the advice
 
	elseif camera_pan ~= 0 then
		
	 --America
 		if conditions.AdviceJustDisplayed("-759552923", context) then
  			CampaignUI.StopCamera()
  			camera_pan = 0
  			scripting.game_interface:set_zoom_limit(1.0, 0.5)
  			CampaignUI.SetCameraTarget(-536.000, 281.000)
	  		

		end
	end
end

local function OnWorldCreated()
	scripting.game_interface:technology_osmosis_for_playables_enable_culture("european")
	scripting.game_interface:technology_osmosis_for_playables_enable_all()
	-- scripting.game_interface:set_campaign_ai_force_all_factions_boardering_humans_to_have_invasion_behaviour(false)
	-- scripting.game_interface:set_campaign_ai_force_all_factions_boardering_human_protectorates_to_have_invasion_behaviour(false)
	scripting.game_interface:show_shroud(false)
end

--------------------------------------------------------------------------------------------------------------------
-- Add event callbacks
-- For a list of all events supported create a "documentation" directory in your empire directory, run a debug build of the game and see
-- the events.txt file
--------------------------------------------------------------------------------------------------------------------
scripting.AddEventCallBack("WorldCreated", OnWorldCreated)
scripting.AddEventCallBack("AdviceIssued", OnAdviceIssued)
scripting.AddEventCallBack("AdviceDismissed", OnAdviceDismissed)
scripting.AddEventCallBack("AdviceSuperseded", OnAdviceDismissed)
scripting.AddEventCallBack("CameraMoverFinished", OnCameraMoverFinished)
