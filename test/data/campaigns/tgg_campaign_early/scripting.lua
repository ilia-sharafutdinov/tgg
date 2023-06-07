local advice = require "export_advice"
local historic_events = require "export_historic_events"
local scripting = require "EpisodicScripting"
local camera_pan = 0

local function OnFactionTurnStart(context)
	if conditions.TurnNumber(context) == 5 then
		scripting.game_interface:enable_auto_generated_missions(true)
	end

	if conditions.FactionName("britain", context) then
		scripting.game_interface:grant_faction_handover("britain", "thirteen_colonies", 6, 15, context)
	elseif conditions.FactionName("spain", context) then
		scripting.game_interface:grant_faction_handover("spain", "new_spain", 6, 15, context)
	elseif conditions.FactionName("france", context) then
		scripting.game_interface:grant_faction_handover("france", "louisiana", 6, 15, context)
	end
end

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

	--1202_Campaign_Advice_UI_Help_Buildings_Thread
 	elseif conditions.AdviceJustDisplayed("-174893187", context) then
		scripting.HighlightComponent("build_browser", true)

	--1030b_Campaign_Advice_UI_Government_Panel_Thread
 	elseif conditions.AdviceJustDisplayed("-428335498", context) then
		scripting.HighlightComponent("button_government", true)

	--1030c_Campaign_Advice_UI_Government_Panel_Thread
 	elseif conditions.AdviceJustDisplayed("-250658412", context) then
		scripting.HighlightComponent("button_government", true)


--1001_Campaign_Advice_Britain_Initial_Turns_Thread
--Britain camera pans = 11, 12, 13, 14, 15
	
	elseif conditions.AdviceJustDisplayed("-324484024", context) and not CampaignUI.IsMultiplayer() then
		scripting.game_interface:set_zoom_limit(1.08, 0.02)
		CampaignUI.ScrollCamera(18,	{-57.000, 418.000, 0.75},
								{-29.000, 362.000, 0.95},
								{36.000, 371.000, 0.95},
								{98.000, 378.000, 0.85})
		camera_pan = 11


--1002_Campaign_Advice_France_Initial_Turns_Thread
--France camera pans = 21, 22, 23, 24
	
	elseif conditions.AdviceJustDisplayed("-1886952522", context) and not CampaignUI.IsMultiplayer()  then
		scripting.game_interface:set_zoom_limit(1.08, 0.02)
		CampaignUI.ScrollCamera(49,	{0.000, 332.000, 0.95},
								{43.000, 336.000, 0.85},
								{70.000, 332.000, 0.95},
								{98.000, 363.000, 0.95},
								{47.000, 367.000, 0.85},
								{70.000, 329.000, 0.85},
								{17.000, 332.000, 0.75})
		camera_pan = 21


--1003_Campaign_Advice_Spain_Initial_Turns_Thread
--Spain camera pans = 31, 32, 33
	elseif conditions.AdviceJustDisplayed("-1109259521", context) and not CampaignUI.IsMultiplayer()  then
		scripting.game_interface:set_zoom_limit(1.08, 0.02)
		CampaignUI.ScrollCamera(17,	{-37.000, 274.000, 0.75},
								{-3.000, 295.000, 0.80},
								{95.000, 276.000, 0.85},
								{157.000, 287.000, 0.75})
								--{218.000, 247.000, 0.75})
		camera_pan = 31
		
		
--1005_Campaign_Advice_Russia_Initial_Turns_Thread
--Russia camera pans = 41, 42
	
	elseif conditions.AdviceJustDisplayed("-1808331232", context) and not CampaignUI.IsMultiplayer()  then
		scripting.game_interface:set_zoom_limit(1.08, 0.02)
		CampaignUI.ScrollCamera(21,	{279.000, 386.000, 0.80},
								{221.000, 387.000, 0.75},
								{219.00, 326.000, 0.65},
								{147.000, 287.000, 0.75})
		camera_pan = 41
	
	
--1006_Campaign_Advice_Prussia_Initial_Turns_Thread
--Prussia camera pans = 51, 52
	
	elseif conditions.AdviceJustDisplayed("962797902", context) and not CampaignUI.IsMultiplayer()  then
		scripting.game_interface:set_zoom_limit(1.08, 0.02)
		CampaignUI.ScrollCamera(25,	{104.000, 366.000, 0.90},
								{91.000, 370.000, 0.95},
								{82.000, 366.000, 0.95},
								{106.00, 352.000, 0.90},
								{120.000, 359.000, 0.95},
								{137.000, 384.000, 0.95})
							
		camera_pan = 51
	
	
--1008_Campaign_Advice_Dutch_Initial_Turns_Thread
--Dutch camera pans = 61, 62, 63, 64
	
	elseif conditions.AdviceJustDisplayed("-1766231494", context) and not CampaignUI.IsMultiplayer()  then
		scripting.game_interface:set_zoom_limit(1.08, 0.02)
		CampaignUI.ScrollCamera(18,	{35.000, 372.000, 1.00},
								{40.000, 354.000, 0.95},
								{29.00, 352.000, 0.90},
								{22.000, 365.000, 0.95},
								{35.000, 371.000, 1.00})
		camera_pan = 61


--1009_Campaign_Advice_Austria_Initial_Turns_Thread
--Austria camera pans = 71, 72, 73
	
	elseif conditions.AdviceJustDisplayed("-1522516535", context) and not CampaignUI.IsMultiplayer() then
		scripting.game_interface:set_zoom_limit(1.08, 0.02)
		CampaignUI.ScrollCamera(27,	{116.000, 339.000, 1.00},
								{160.000, 310.000, 0.95},
								{115.00, 322.000, 0.95},
								{132.000, 351.000, 0.95},
								{116.000, 339.000, 0.80})
		camera_pan = 71
	
	
	
--1012_Campaign_Advice_Poland_Initial_Turns_Thread
--Poland camera pans = 81, 82, 83, 84
	
	elseif conditions.AdviceJustDisplayed("665527234", context) and not CampaignUI.IsMultiplayer()  then
		scripting.game_interface:set_zoom_limit(1.08, 0.02)
		CampaignUI.ScrollCamera(11,	{181.000, 352.000, 0.90},
								{131.000, 348.000, 0.85},
								{129.000, 375.000, 0.90})

								
		camera_pan = 81	
	

--1004_Campaign_Advice_Ottoman_Initial_Turns_Thread
--Ottoman camera pans = 91, 92, 93, 94

	elseif conditions.AdviceJustDisplayed("1447626053", context) and not CampaignUI.IsMultiplayer()  then
		scripting.game_interface:set_zoom_limit(1.08, 0.02)
		CampaignUI.ScrollCamera(21,	{171.000, 291.000, 0.75},
								{145.000, 335.000, 0.80},
								{223.000, 309.000, 0.85},
								{125.000, 306.000, 0.80})
								
		camera_pan = 91	


--1007_Campaign_Advice_Sweden_Initial_Turns_Thread
--Sweden camera pans = 101, 102
	
		elseif conditions.AdviceJustDisplayed("-1638244308", context) and not CampaignUI.IsMultiplayer()  then
		scripting.game_interface:set_zoom_limit(1.08, 0.02)
		CampaignUI.ScrollCamera(39,	{110.000, 418.000, 0.75},
								{201.000, 418.000, 0.75},
								{125.000, 388.000, 0.75},
								{21.000, 365.000, 0.75},
								{62.000, 310.000, 0.75},
								{172.000, 283.000, 0.75})
		
		camera_pan = 101	


--1010a_Campaign_Advice_Maratha_Initial_Turns_Thread
--Maratha camera pans = 111, 112

		elseif conditions.AdviceJustDisplayed("1221146494", context) and not CampaignUI.IsMultiplayer()  then
		scripting.game_interface:set_zoom_limit(1.08, 0.02)
		CampaignUI.ScrollCamera(24,	{527.000, 122.000, 0.95},
								{549.000, 94.000, 0.85},
								{543.000, 181.000, 0.95})
								
		camera_pan = 111	

	
	end
end


local function OnCameraMoverFinished(context)

--1001_Campaign_Advice_Britain_Initial_Turns_Thread

	if camera_pan == 11 then
		CampaignUI.ScrollCamera(11,	{49.000, 332.000, 0.95},
								{8.000, 324.000, 0.95},
								{-31.000, 282.000, 0.85})
		camera_pan = 12
		
	elseif camera_pan == 12 then
		CampaignUI.ScrollCamera(15,	{-515.000, 121.000, 0.85},
								{-580.000, 204.000, 0.75},
								{-548.000, 274.000, 0.75},
								{-504.000, 311.000, 0.75})
		camera_pan = 13
	
	elseif camera_pan == 13 then
		CampaignUI.ScrollCamera(29,	{523.000, 55.000, 0.65},
								{599.000, 135.000, 0.75},
								{554.000, 186.000, 0.85},
								{504.000, 163.000, 0.85},
								{528.000, 114.000, 0.85},
								{563.000, 80.000, 0.75},
								{532.000, 167.000, 0.65})
		camera_pan = 14
		
	elseif camera_pan == 14 then
		CampaignUI.ScrollCamera(8,	{18.000, 342.000, 0.95},
								{6.000, 356.000, 0.95},
								{0.000, 362.000, 0.75})
		camera_pan = 15
		
	elseif camera_pan == 15 then
		scripting.game_interface:set_zoom_limit(1.0, 0.5)
		CampaignUI.SetCameraTarget(0.000, 362.000)
		camera_pan = 0


--1002_Campaign_Advice_France_Initial_Turns_Thread

	elseif camera_pan == 21 then
		CampaignUI.ScrollCamera(18,	{-454.000, 349.000, 0.75},
								{-514.000, 325.000, 0.80},
								{-579.000, 249.000, 0.80},
								{-586.000, 179.000, 0.75})
		camera_pan = 22
		
	elseif camera_pan == 22 then
		CampaignUI.ScrollCamera(18,	{490.000, 169.000, 0.75},
								{577.000, 72.000, 0.80},
								{534.000, 35.000, 0.75},								
								{528.000, 113.000, 0.75})
		camera_pan = 23

	elseif camera_pan == 23 then
		CampaignUI.ScrollCamera(20,	{-391.000, 177.000, 0.95},
								{-432.000, 167.000, 0.95},
								{-453.000, 126.000, 0.95},
								{-434.000, 96.000, 0.95},
								{-467.000, 83.000, 0.90},
								{-486.000, 108.000, 0.85},
								{-519.000, 137.000, 0.80},
								{-581.000, 165.000, 0.75})
		camera_pan = 24
		
	elseif camera_pan == 24 then
		scripting.game_interface:set_zoom_limit(1.0, 0.5)
		CampaignUI.SetCameraTarget(17.387, 332.769)
		camera_pan = 0


--1003_Campaign_Advice_Spain_Initial_Turns_Thread

	elseif camera_pan == 31 then
		CampaignUI.ScrollCamera(18,	{30.000, 375.000, 0.95},
								{39.000, 353.000, 0.90},
								{0.000, 349.000, 0.85})
		camera_pan = 32

	elseif camera_pan == 32 then
		CampaignUI.ScrollCamera(27,	{-492.000, 194.000, 0.95},
								{-562.000, 168.000, 0.80},
								{-500.000, 84.000, 0.70},
								{-541.000, 161.000, 0.50})
		camera_pan = 33

	elseif camera_pan == 33 then
		scripting.game_interface:set_zoom_limit(1.0, 0.5)
		CampaignUI.SetCameraTarget(-26.750, 280.811)
		camera_pan = 0


--1005_Campaign_Advice_Russia_Initial_Turns_Thread
	
		elseif camera_pan == 41 then
		CampaignUI.ScrollCamera(34,	{147.000, 376.000, 0.90},
								{116.000, 338.000, 0.80},
								{73.000, 322.000, 0.75},
								{48.000,328.000, 0.75},
								{8.000, 351.000, 0.75},
								{42.000, 386.000, 0.75},
								{93.000, 368.000, 0.80},
								{150.000, 360.000, 0.90},
								{190.000, 418.000, 0.60})
		camera_pan = 42
	
	elseif camera_pan == 42 then
		scripting.game_interface:set_zoom_limit(1.0, 0.5)
		CampaignUI.SetCameraTarget(267.000, 391.000)
		camera_pan = 0
	
--1006_Campaign_Advice_Prussia_Initial_Turns_Thread

		camera_pan = 51

		elseif camera_pan == 51 then
		CampaignUI.ScrollCamera(23,	{140.000, 437.000, 0.75},
								{64.000, 397.000, 0.75},
								{22.000, 347.000, 0.85},
								{100.000, 335.000, 0.95},
								{95.000, 368.000, 0.80})
		camera_pan = 52

	elseif camera_pan == 52 then
		scripting.game_interface:set_zoom_limit(1.0, 0.5)
		CampaignUI.SetCameraTarget(95.000, 368.000)
		camera_pan = 0
	
--1008_Campaign_Advice_Dutch_Initial_Turns_Thread

	elseif camera_pan == 61 then
		CampaignUI.ScrollCamera(14,	{-35.000, 431.000, 0.95},
								{5.000, 352.000, 0.85},
								{95.000, 369.000, 0.95})
		camera_pan = 62
		
	elseif camera_pan == 62 then
		CampaignUI.ScrollCamera(8,	{-489.000, 85.000, 0.95},
								{-490.000, 81.000, 0.80})
		camera_pan = 63
		
	elseif camera_pan == 63 then
		CampaignUI.ScrollCamera(8,	{851.000, -62.000, 0.95},
								{878.000, -69.000, 0.95})
		camera_pan = 64
		
	elseif camera_pan == 64 then
		CampaignUI.ScrollCamera(8,	{562.000, 58.000, 0.75},
								{570.000, 56.000, 0.90})
		camera_pan = 65
		
	elseif camera_pan == 65 then
		scripting.game_interface:set_zoom_limit(1.0, 0.5)
		CampaignUI.SetCameraTarget(35.000, 371.000)
		camera_pan = 0
		

--1009_Campaign_Advice_Austria_Initial_Turns_Thread

	elseif camera_pan == 71 then
		CampaignUI.ScrollCamera(22,	{31.000, 377.000, 0.80},
								{68.000, 361.000, 0.90},
								{106.000, 368.000, 0.95},
								{135.000, 329.000, 0.80})
		camera_pan = 72
		
	elseif camera_pan == 72 then
		CampaignUI.ScrollCamera(24,	{204.000, 428.000, 0.80},
								{128.000, 365.000, 0.90},
								{172.000, 356.000, 0.90},
								{255.000, 380.000, 0.75})
		camera_pan = 73
		
	elseif camera_pan == 73 then
		scripting.game_interface:set_zoom_limit(1.0, 0.5)
		CampaignUI.SetCameraTarget(116.000, 339.000)
		camera_pan = 0
	
	
--1012_Campaign_Advice_Poland_Initial_Turns_Thread
							
	elseif camera_pan == 81 then
		CampaignUI.ScrollCamera(29,	{191.000, 413.000, 0.75},
								{220.000, 368.000, 0.75},
								{139.000, 324.000, 0.85},
								{144.000, 341.000, 0.85},
								{195.000, 379.000, 0.90})
		camera_pan = 82
		
	elseif camera_pan == 82 then
		CampaignUI.ScrollCamera(23,	{202.000, 290.000, 0.90},
								{182.000, 280.000, 0.90},
								{153.000, 329.000, 0.85},
								{284.000, 297.000, 0.75})
		camera_pan = 83
		
	elseif camera_pan == 83 then
		CampaignUI.ScrollCamera(13,	{-42.000, 278.000, 0.80},
								{8.000, 352.000, 0.75})
		camera_pan = 84
		
	elseif camera_pan == 84 then
		scripting.game_interface:set_zoom_limit(1.0, 0.5)
		CampaignUI.SetCameraTarget(150.000, 367.000)
		camera_pan = 0
		

--1004_Campaign_Advice_Ottoman_Initial_Turns_Thread

	elseif camera_pan == 91 then
		CampaignUI.ScrollCamera(14,	{370.000, 231.000, 0.90},
								{315.000, 231.000, 0.90},
								{315.000, 282.000, 0.95})
		camera_pan = 92

	elseif camera_pan == 92 then
		CampaignUI.ScrollCamera(17,	{104.000, 346.000, 0.90},
								{173.000, 275.000, 0.90},
								{230.000, 270.000, 0.95})
		camera_pan = 93

	elseif camera_pan == 93 then
		CampaignUI.ScrollCamera(27,	{-15.000, 322.000, 0.85},
								{184.000, 307.000, 0.80},
								{68.000, 246.000, 0.75})
		camera_pan = 94

	elseif camera_pan == 94 then
		scripting.game_interface:set_zoom_limit(1.0, 0.5)
		CampaignUI.SetCameraTarget(202.000, 290.000)
		camera_pan = 0
		

--1007_Campaign_Advice_Sweden_Initial_Turns_Thread

	elseif camera_pan == 101 then
		scripting.game_interface:set_zoom_limit(1.0, 0.5)
		CampaignUI.SetCameraTarget(125.000, 417.000)
		camera_pan = 0
		

--1010a_Campaign_Advice_Maratha_Initial_Turns_Thread

	elseif camera_pan == 111 then
		CampaignUI.ScrollCamera(22,	{587.000, 112.000, 0.95},
								{553.000, 134.000, 0.95},
								{525.000, 96.000, 0.85},
								{547.000, 69.000, 0.85},
								{571.000, 53.000, 0.85})
		camera_pan = 112

	elseif camera_pan == 112 then
		CampaignUI.ScrollCamera(7,	{-3.000, 368.000, 0.90},
								{21.000, 340.000, 0.90})
		camera_pan = 113
	
	elseif camera_pan == 113 then
		CampaignUI.ScrollCamera(14,	{582.000, 37.000, 0.85},
								{527.000, 122.000, 0.75})
		camera_pan = 114
							
	elseif camera_pan == 114 then
		scripting.game_interface:set_zoom_limit(1.0, 0.5)
		CampaignUI.SetCameraTarget(527.000, 122.000)
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
		
	 --Britain
 		if conditions.AdviceJustDisplayed("-324484024", context) then
  			CampaignUI.StopCamera()
  			camera_pan = 0
  			scripting.game_interface:set_zoom_limit(1.0, 0.5)
  			CampaignUI.SetCameraTarget(0.000, 362.000)
	  		
	--France
		elseif conditions.AdviceJustDisplayed("-1886952522", context) then
  			CampaignUI.StopCamera()
  			camera_pan = 0
  			scripting.game_interface:set_zoom_limit(1.0, 0.5)
  			CampaignUI.SetCameraTarget(17.387, 332.769)

	--Spain
		elseif conditions.AdviceJustDisplayed("-1109259521", context) then
  			CampaignUI.StopCamera()
  			camera_pan = 0
  			scripting.game_interface:set_zoom_limit(1.0, 0.5)
  			CampaignUI.SetCameraTarget(-26.750, 280.811)

	--Russia
		elseif conditions.AdviceJustDisplayed("-1808331232", context) then
  			CampaignUI.StopCamera()
  			camera_pan = 0
  			scripting.game_interface:set_zoom_limit(1.0, 0.5)
  			CampaignUI.SetCameraTarget(267.000, 391.000)
		
	--Prussia
		elseif conditions.AdviceJustDisplayed("962797902", context) then
  			CampaignUI.StopCamera()
  			camera_pan = 0
  			scripting.game_interface:set_zoom_limit(1.0, 0.5)
  			CampaignUI.SetCameraTarget(95.000, 368.000)
		
	--Dutch	
		elseif conditions.AdviceJustDisplayed("-1766231494", context) then
  			CampaignUI.StopCamera()
  			camera_pan = 0
  			scripting.game_interface:set_zoom_limit(1.0, 0.5)
  			CampaignUI.SetCameraTarget(35.000, 371.000)
		
	--Austria	
		elseif conditions.AdviceJustDisplayed("-1522516535", context) then
  			CampaignUI.StopCamera()
  			camera_pan = 0
  			scripting.game_interface:set_zoom_limit(1.0, 0.5)
  			CampaignUI.SetCameraTarget (116.000, 339.000)
		
	--Poland
		elseif conditions.AdviceJustDisplayed("665527234", context) then
	  		CampaignUI.StopCamera()
  			camera_pan = 0
  			scripting.game_interface:set_zoom_limit(1.0, 0.5)
  			CampaignUI.SetCameraTarget (150.000, 367.000)
		
	--Ottoman
		elseif conditions.AdviceJustDisplayed("1447626053", context) then
	  		CampaignUI.StopCamera()
  			camera_pan = 0
  			scripting.game_interface:set_zoom_limit(1.0, 0.5)
  			CampaignUI.SetCameraTarget (202.000, 290.000)
	 
	--Sweden
		elseif conditions.AdviceJustDisplayed("-1638244308", context) then
	  		CampaignUI.StopCamera()
  			camera_pan = 0
  			scripting.game_interface:set_zoom_limit(1.0, 0.5)
  			CampaignUI.SetCameraTarget (125.000, 417.000)
	 
	--Maratha
		elseif conditions.AdviceJustDisplayed("1221146494", context) then
	  		CampaignUI.StopCamera()
  			camera_pan = 0
  			scripting.game_interface:set_zoom_limit(1.0, 0.5)
  			CampaignUI.SetCameraTarget (527.000, 122.000)

		end
	end
end

local function OnWorldCreated()
	scripting.game_interface:technology_osmosis_for_playables_enable_culture("european")
	scripting.game_interface:technology_osmosis_for_playables_enable_all()
	-- scripting.game_interface:set_campaign_ai_force_all_factions_boardering_humans_to_have_invasion_behaviour(false)
	-- scripting.game_interface:set_campaign_ai_force_all_factions_boardering_human_protectorates_to_have_invasion_behaviour(false)
	scripting.game_interface:show_shroud(false)

	scripting.game_interface:force_diplomacy("pirates", "afghanistan", "peace", false, false)
	scripting.game_interface:force_diplomacy("pirates", "austria", "peace", false, false)
	scripting.game_interface:force_diplomacy("pirates", "barbary_states", "peace", false, false)
	scripting.game_interface:force_diplomacy("pirates", "bavaria", "peace", false, false)
	scripting.game_interface:force_diplomacy("pirates", "britain", "peace", false, false)
	scripting.game_interface:force_diplomacy("pirates", "chechenya_dagestan", "peace", false, false)
	scripting.game_interface:force_diplomacy("pirates", "cherokee", "peace", false, false)
	scripting.game_interface:force_diplomacy("pirates", "colombia", "peace", false, false)
	scripting.game_interface:force_diplomacy("pirates", "courland", "peace", false, false)
	scripting.game_interface:force_diplomacy("pirates", "crimean_khanate", "peace", false, false)
	scripting.game_interface:force_diplomacy("pirates", "denmark", "peace", false, false)
	scripting.game_interface:force_diplomacy("pirates", "france", "peace", false, false)
	scripting.game_interface:force_diplomacy("pirates", "genoa", "peace", false, false)
	scripting.game_interface:force_diplomacy("pirates", "georgia", "peace", false, false)
	scripting.game_interface:force_diplomacy("pirates", "greece", "peace", false, false)
	scripting.game_interface:force_diplomacy("pirates", "hannover", "peace", false, false)
	scripting.game_interface:force_diplomacy("pirates", "hessen", "peace", false, false)
	scripting.game_interface:force_diplomacy("pirates", "hungary", "peace", false, false)
	scripting.game_interface:force_diplomacy("pirates", "huron", "peace", false, false)
	scripting.game_interface:force_diplomacy("pirates", "inuit", "peace", false, false)
	scripting.game_interface:force_diplomacy("pirates", "ireland", "peace", false, false)
	scripting.game_interface:force_diplomacy("pirates", "iroquoi", "peace", false, false)
	scripting.game_interface:force_diplomacy("pirates", "knights_stjohn", "peace", false, false)
	scripting.game_interface:force_diplomacy("pirates", "louisiana", "peace", false, false)
	scripting.game_interface:force_diplomacy("pirates", "mamelukes", "peace", false, false)
	scripting.game_interface:force_diplomacy("pirates", "maratha", "peace", false, false)
	scripting.game_interface:force_diplomacy("pirates", "mexico", "peace", false, false)
	scripting.game_interface:force_diplomacy("pirates", "morocco", "peace", false, false)
	scripting.game_interface:force_diplomacy("pirates", "mughal", "peace", false, false)
	scripting.game_interface:force_diplomacy("pirates", "mysore", "peace", false, false)
	scripting.game_interface:force_diplomacy("pirates", "naples_sicily", "peace", false, false)
	scripting.game_interface:force_diplomacy("pirates", "netherlands", "peace", false, false)
	scripting.game_interface:force_diplomacy("pirates", "new_spain", "peace", false, false)
	scripting.game_interface:force_diplomacy("pirates", "norway", "peace", false, false)
	scripting.game_interface:force_diplomacy("pirates", "ottomans", "peace", false, false)
	scripting.game_interface:force_diplomacy("pirates", "papal_states", "peace", false, false)
	scripting.game_interface:force_diplomacy("pirates", "piedmont_savoy", "peace", false, false)
	scripting.game_interface:force_diplomacy("pirates", "plains", "peace", false, false)
	scripting.game_interface:force_diplomacy("pirates", "poland_lithuania", "peace", false, false)
	scripting.game_interface:force_diplomacy("pirates", "portugal", "peace", false, false)
	scripting.game_interface:force_diplomacy("pirates", "prussia", "peace", false, false)
	scripting.game_interface:force_diplomacy("pirates", "pueblo", "peace", false, false)
	scripting.game_interface:force_diplomacy("pirates", "punjab", "peace", false, false)
	scripting.game_interface:force_diplomacy("pirates", "quebec", "peace", false, false)
	scripting.game_interface:force_diplomacy("pirates", "russia", "peace", false, false)
	scripting.game_interface:force_diplomacy("pirates", "safavids", "peace", false, false)
	scripting.game_interface:force_diplomacy("pirates", "saxony", "peace", false, false)
	scripting.game_interface:force_diplomacy("pirates", "scotland", "peace", false, false)
	scripting.game_interface:force_diplomacy("pirates", "spain", "peace", false, false)
	scripting.game_interface:force_diplomacy("pirates", "sweden", "peace", false, false)
	scripting.game_interface:force_diplomacy("pirates", "thirteen_colonies", "peace", false, false)
	scripting.game_interface:force_diplomacy("pirates", "united_states", "peace", false, false)
	scripting.game_interface:force_diplomacy("pirates", "venice", "peace", false, false)
	scripting.game_interface:force_diplomacy("pirates", "westphalia", "peace", false, false)
	scripting.game_interface:force_diplomacy("pirates", "wurttemberg", "peace", false, false)

	scripting.game_interface:force_diplomacy("afghanistan", "pirates", "peace", false, false)
	scripting.game_interface:force_diplomacy("austria", "pirates", "peace", false, false)
	scripting.game_interface:force_diplomacy("barbary_states", "pirates", "peace", false, false)
	scripting.game_interface:force_diplomacy("bavaria", "pirates", "peace", false, false)
	scripting.game_interface:force_diplomacy("britain", "pirates", "peace", false, false)
	scripting.game_interface:force_diplomacy("chechenya_dagestan", "pirates", "peace", false, false)
	scripting.game_interface:force_diplomacy("colombia", "pirates", "peace", false, false)
	scripting.game_interface:force_diplomacy("courland", "pirates", "peace", false, false)
	scripting.game_interface:force_diplomacy("crimean_khanate", "pirates", "peace", false, false)
	scripting.game_interface:force_diplomacy("denmark", "pirates", "peace", false, false)
	scripting.game_interface:force_diplomacy("france", "pirates", "peace", false, false)
	scripting.game_interface:force_diplomacy("genoa", "pirates", "peace", false, false)
	scripting.game_interface:force_diplomacy("georgia", "pirates", "peace", false, false)
	scripting.game_interface:force_diplomacy("greece", "pirates", "peace", false, false)
	scripting.game_interface:force_diplomacy("hannover", "pirates", "peace", false, false)
	scripting.game_interface:force_diplomacy("hessen", "pirates", "peace", false, false)
	scripting.game_interface:force_diplomacy("hungary", "pirates", "peace", false, false)
	scripting.game_interface:force_diplomacy("huron", "pirates", "peace", false, false)
	scripting.game_interface:force_diplomacy("inuit", "pirates", "peace", false, false)
	scripting.game_interface:force_diplomacy("ireland", "pirates", "peace", false, false)
	scripting.game_interface:force_diplomacy("iroquoi", "pirates", "peace", false, false)
	scripting.game_interface:force_diplomacy("knights_stjohn", "pirates", "peace", false, false)
	scripting.game_interface:force_diplomacy("louisiana", "pirates", "peace", false, false)
	scripting.game_interface:force_diplomacy("mamelukes", "pirates", "peace", false, false)
	scripting.game_interface:force_diplomacy("maratha", "pirates", "peace", false, false)
	scripting.game_interface:force_diplomacy("mexico", "pirates", "peace", false, false)
	scripting.game_interface:force_diplomacy("morocco", "pirates", "peace", false, false)
	scripting.game_interface:force_diplomacy("mughal", "pirates", "peace", false, false)
	scripting.game_interface:force_diplomacy("mysore", "pirates", "peace", false, false)
	scripting.game_interface:force_diplomacy("naples_sicily", "pirates", "peace", false, false)
	scripting.game_interface:force_diplomacy("netherlands", "pirates", "peace", false, false)
	scripting.game_interface:force_diplomacy("new_spain", "pirates", "peace", false, false)
	scripting.game_interface:force_diplomacy("norway", "pirates", "peace", false, false)
	scripting.game_interface:force_diplomacy("ottomans", "pirates", "peace", false, false)
	scripting.game_interface:force_diplomacy("papal_states", "pirates", "peace", false, false)
	scripting.game_interface:force_diplomacy("piedmont_savoy", "pirates", "peace", false, false)
	scripting.game_interface:force_diplomacy("plains", "pirates", "peace", false, false)
	scripting.game_interface:force_diplomacy("poland_lithuania", "pirates", "peace", false, false)
	scripting.game_interface:force_diplomacy("portugal", "pirates", "peace", false, false)
	scripting.game_interface:force_diplomacy("prussia", "pirates", "peace", false, false)
	scripting.game_interface:force_diplomacy("pueblo", "pirates", "peace", false, false)
	scripting.game_interface:force_diplomacy("punjab", "pirates", "peace", false, false)
	scripting.game_interface:force_diplomacy("quebec", "pirates", "peace", false, false)
	scripting.game_interface:force_diplomacy("russia", "pirates", "peace", false, false)
	scripting.game_interface:force_diplomacy("safavids", "pirates", "peace", false, false)
	scripting.game_interface:force_diplomacy("saxony", "pirates", "peace", false, false)
	scripting.game_interface:force_diplomacy("scotland", "pirates", "peace", false, false)
	scripting.game_interface:force_diplomacy("spain", "pirates", "peace", false, false)
	scripting.game_interface:force_diplomacy("sweden", "pirates", "peace", false, false)
	scripting.game_interface:force_diplomacy("thirteen_colonies", "pirates", "peace", false, false)
	scripting.game_interface:force_diplomacy("united_states", "pirates", "peace", false, false)
	scripting.game_interface:force_diplomacy("venice", "pirates", "peace", false, false)
	scripting.game_interface:force_diplomacy("westphalia", "pirates", "peace", false, false)
	scripting.game_interface:force_diplomacy("wurttemberg", "pirates", "peace", false, false)
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
scripting.AddEventCallBack("FactionTurnStart", OnFactionTurnStart)
