local core		= require "ui/CoreUtils"
local scripting	= core.Require "EpisodicScripting"
local advice	= core.Require "export_advice"
local camera_pan = 0


scripting.SetCampaign("natives")

out.ting("loading new script")
local players_turn = true
local function OnFactionTurnStart(context)
	out.ting("On faction start")
	if conditions.FactionIsLocal(context) then
		out.ting("local faction")
		players_turn = true
		if conditions.TurnNumber(context) == 1 then
			out.ting("turn 1, cut a hole in shroud")
			scripting.game_interface:unveil_black_shroud("shroud_map_1")
			--scripting.game_interface:set_map_bounds(-760, 460, -340, 87)
			
		end
	end
end

local function OnPanelOpenedCampaign(context)
	out.ting("On  Panel Opened Campaign" .. context.string)
	if conditions.IsComponentType("region_info", context) then
		scripting.EnableFeature("Hide_tax_on_region_details")
	elseif conditions.IsComponentType("missions", context) then
		scripting.EnableFeature("Hide_prestige_on_mission_panel")

	--[[ These conditions are now built into the actual scripts for natives.
	elseif conditions.IsComponentType("entity_lists", context) then
		scripting.EnableFeature("Hide_fleet_on_list_panel")
	elseif conditions.IsComponentType("government_screens", context) then
		scripting.EnableFeature("Hide_taxes_and_ministers_on_government_screen")
	--]]
	end
end



--
-- TRIGGER FEATURES AS A RESULT OF ADVICE HAVING JUST BEEN DISPLAYED
--


local function OnAdviceIssued(context)


--
-- CAMERA PANS
--

-- 2001_Campaign_Advice_Iroquois_Initial_Turn_Thread

	if conditions.AdviceJustDisplayed("1248354970", context) and not CampaignUI.IsMultiplayer() then
		out.ting("Kicking off the Iroquois pan")

		scripting.game_interface:set_zoom_limit(1.08, 0.02)

		CampaignUI.ScrollCamera(30,	{-572.000, 305.000, 0.85},
						{-529.000, 283.000, 0.80},
						{-516.000, 327.000, 0.80},
						{-601.000, 312.000, 0.85},
						{-597.000, 253.000, 0.85},
						{-543.000, 303.000, 0.95})

		camera_pan = 10



-- 2002_Campaign_Advice_Huron_Initial_Turn_Thread

	elseif conditions.AdviceJustDisplayed("24097043", context) and not CampaignUI.IsMultiplayer() then
		out.ting("Kicking off the Huron pan")

		scripting.game_interface:set_zoom_limit(1.08, 0.02)

		CampaignUI.ScrollCamera(30,	{-628.000, 305.000, 0.75},
						{-566.000, 289.000, 0.80},
						{-574.000, 344.000, 0.85},
						{-687.000, 302.000, 0.80},
						{-642.000, 260.000, 0.85},
						{-598.000, 323.000, 0.95})

		camera_pan = 20



-- 2003_Campaign_Advice_Pueblo_Initial_Turn_Thread

	elseif conditions.AdviceJustDisplayed("-1082576296", context) and not CampaignUI.IsMultiplayer() then
		out.ting("Kicking off the Pueblo Nations pan")

		scripting.game_interface:set_zoom_limit(1.08, 0.02)

		CampaignUI.ScrollCamera(30,	{-740.000, 195.000, 0.85},
						{-682.000, 284.000, 0.75},
						{-612.000, 277.000, 0.75},
						{-556.000, 262.000, 0.75},
						{-649.000, 215.000, 0.80},
						{-729.000, 221.000, 0.95})

		camera_pan = 30



-- 2004_Campaign_Advice_Plains_Initial_Turn_Thread

	elseif conditions.AdviceJustDisplayed("1770580345", context) and not CampaignUI.IsMultiplayer() then
		out.ting("Kicking off the Plains Nations pan")

		scripting.game_interface:set_zoom_limit(1.08, 0.02)

		CampaignUI.ScrollCamera(30,	{-732.000, 336.000, 0.85},
						{-714.000, 300.000, 0.75},
						{-716.000, 233.000, 0.80},
						{-628.000, 242.000, 0.80},
						{-619.000, 296.000, 0.80},
						{-677.000, 301.000, 0.85},
						{-732.000, 336.000, 0.95})

		camera_pan = 40



-- 2005_Campaign_Advice_Cherokee_Initial_Turn_Thread

	elseif conditions.AdviceJustDisplayed("1343471686", context) and not CampaignUI.IsMultiplayer() then
		out.ting("Kicking off the Cherokee pan")

		scripting.game_interface:set_zoom_limit(1.08, 0.02)
		
		CampaignUI.ScrollCamera(30,	{-646.000, 230.000, 0.80},
						{-566.000, 245.000, 0.85},
						{-596.000, 215.000, 0.85},
						{-650.000, 240.000, 0.80},
						{-587.000, 292.000, 0.80},
						{-557.000, 289.000, 0.85},
						{-603.000, 247.000, 0.95})

		camera_pan = 50


	end
end



--
-- ADD CAMERA RESTRAINTS ONCE A CAMERA PAN HAS FINISHED
--


local function OnCameraMoverFinished(context)


-- 2001_Campaign_Advice_Iroquois_Initial_Turn_Thread

	if camera_pan == 10 then
		out.ting("The Iroquois pan has finished - setting camera constraints and resetting camera_pan to Zero")
		scripting.game_interface:set_zoom_limit(1.0, 0.5)
		CampaignUI.SetCameraTarget(-543.000, 303.000)
		camera_pan = 0


-- 2002_Campaign_Advice_Huron_Initial_Turn_Thread

	elseif camera_pan == 20 then
		out.ting("The Huron pan has finished - setting camera constraints and resetting camera_pan to Zero")
		scripting.game_interface:set_zoom_limit(1.0, 0.5)
		CampaignUI.SetCameraTarget(-598.000, 323.000)
		camera_pan = 0


-- 2003_Campaign_Advice_Pueblo_Initial_Turn_Thread

	elseif camera_pan == 30 then
		out.ting("The Pueblo Nations pan has finished - setting camera constraints and resetting camera_pan to Zero")
		scripting.game_interface:set_zoom_limit(1.0, 0.5)
		CampaignUI.SetCameraTarget(-729.000, 221.000)
		camera_pan = 0


-- 2004_Campaign_Advice_Plains_Initial_Turn_Thread

	elseif camera_pan == 40 then
		out.ting("The Plains Nations pan has finished - setting camera constraints and resetting camera_pan to Zero")
		scripting.game_interface:set_zoom_limit(1.0, 0.5)
		CampaignUI.SetCameraTarget(-732.000, 336.000)
		camera_pan = 0


-- 2005_Campaign_Advice_Cherokee_Initial_Turn_Thread

	elseif camera_pan == 50 then
		out.ting("The Cherokee pan has finished - setting camera constraints and resetting camera_pan to Zero")
		scripting.game_interface:set_zoom_limit(1.0, 0.5)
		CampaignUI.SetCameraTarget(-603.000, 247.000)
		camera_pan = 0

	end
end



--
-- TRIGGER FEATURES AS A RESULT OF ADVICE HAVING JUST BEEN DISMISSED
--


local function OnAdviceDismissed(context)


--
-- CANCELS CAMERA PAN WHEN THE PLAYER DISMISSES THE ADVICE
--

	if camera_pan ~= 0 then


	-- 2001_Campaign_Advice_Iroquois_Initial_Turn_Thread


		if conditions.AdviceJustDisplayed("1248354970", context) then
			CampaignUI.StopCamera()
  			camera_pan = 0
  			scripting.game_interface:set_zoom_limit(1.0, 0.5)
  			CampaignUI.SetCameraTarget(-543.000, 303.000)


	-- 2002_Campaign_Advice_Huron_Initial_Turn_Thread

		elseif conditions.AdviceJustDisplayed("24097043", context) then
			CampaignUI.StopCamera()
  			camera_pan = 0
  			scripting.game_interface:set_zoom_limit(1.0, 0.5)
  			CampaignUI.SetCameraTarget(-598.000, 328.000)
		

	-- 2003_Campaign_Advice_Pueblo_Initial_Turn_Thread

		elseif conditions.AdviceJustDisplayed("-1082576296", context) then
			CampaignUI.StopCamera()
  			camera_pan = 0
  			scripting.game_interface:set_zoom_limit(1.0, 0.5)
  			CampaignUI.SetCameraTarget(-729.000, 221.000)
		

	-- 2004_Campaign_Advice_Plains_Initial_Turn_Thread

		elseif conditions.AdviceJustDisplayed("1770580345", context) then
			CampaignUI.StopCamera()
  			camera_pan = 0
  			scripting.game_interface:set_zoom_limit(1.0, 0.5)
  			CampaignUI.SetCameraTarget(-731.000, 336.000)


	-- 2005_Campaign_Advice_Cherokee_Initial_Turn_Thread

		elseif conditions.AdviceJustDisplayed("1343471686", context) and not CampaignUI.IsMultiplayer() then
			CampaignUI.StopCamera()
  			camera_pan = 0
  			scripting.game_interface:set_zoom_limit(1.0, 0.5)
  			CampaignUI.SetCameraTarget(-603.000, 247.000)
		
		end
	end
end

local function OnWorldCreated()
	-- scripting.game_interface:set_campaign_ai_force_all_factions_boardering_humans_to_have_invasion_behaviour(false)
	-- scripting.game_interface:set_campaign_ai_force_all_factions_boardering_human_protectorates_to_have_invasion_behaviour(false)
	scripting.game_interface:show_shroud(false)
end




scripting.AddEventCallBack("WorldCreated", OnWorldCreated)
scripting.AddEventCallBack("FactionTurnStart", OnFactionTurnStart)
scripting.AddEventCallBack("PanelOpenedCampaign", OnPanelOpenedCampaign)
scripting.AddEventCallBack("AdviceIssued", OnAdviceIssued)
scripting.AddEventCallBack("AdviceDismissed", OnAdviceDismissed)
scripting.AddEventCallBack("AdviceSuperseded", OnAdviceDismissed)
scripting.AddEventCallBack("CameraMoverFinished", OnCameraMoverFinished)