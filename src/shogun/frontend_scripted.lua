--[[
Import all the lua scripts
--]]
-- Set up the "include" paths
package.path = ";?.lua;data/ui/templates/?.lua;data/ui/?.lua"
-- Declare this file as an "exportable" module
--module(..., package.seeall)
require "data.all_scripted"
local advice = require "data.export_advice"
local core = require "CoreUtils"
local m_user_defined_event_callbacks = {}
local m_root = nil
local m_current_menu = nil
local m_last_historic_battle = ""
local b_won_last_battle = false
local b_animation_started = false

-------------------------------------------------------------------------------------

function AddEventCallBack(event, func, add_to_user_defined_list)
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

-------------------------------------------------------------------------------------

function TransitionTo(screen_name)
	if m_root then
		m_root:InterfaceFunction("TransitionToMPTuttorials", screen_name)
	end
end

-------------------------------------------------------------------------------------

function TransitionBack()
	if m_root then
		m_root:InterfaceFunction("TransitionBack")
	end
end

-------------------------------------------------------------------------------------

function OnUICreated(context)
	m_root = UIComponent(context.component)
end

-------------------------------------------------------------------------------------
-------------------------------------- BOOLS ----------------------------------------
-------------------------------------------------------------------------------------
--[[
SetVisible()
Find()
Parent()
"FETUTORIALS"
]]--
local FETUTORIALS_DONE = false
local bool_can_start_battle = false
local bool_reset_in_campaign_map = false
local BOOL_Tutorial_In_Progress = false
FETutorial.ClearBool("BOOL_Tutorial_In_Progress")
local BOOL_battle_2 = false
local BOOL_battle_1 = false
local BOOL_battle_3 = false
local BOOL_battle_2 = FETutorial.LoadBool("BOOL_battle_2")
local BOOL_battle_1 = FETutorial.LoadBool("BOOL_battle_1")
local BOOL_battle_3 = FETutorial.LoadBool("BOOL_battle_3")
local BOOL_Player_Lost_Battle = false

local BOOL_Nagato = false
local BOOL_Musashi = false
local BOOL_Satsuma = false
local BOOL_Tosa = false
local BOOL_Kai = false
local BOOL_Iwate = false
local BOOL_Save_Army_Button_Selected = false
local BOOL_Highlight_Ancillaries = false

local BOOL_Highlight_Iwami_Suo = false
local BOOL_Highlight_Higo = false
local BOOL_Highlight_Sagami = false
local BOOL_Highlight_Nagato = false
local BOOL_Highlight_Hyuga = false
local BOOL_Highlight_Suruga = false
local BOOL_Highlight_South_Shinano = false
local BOOL_Highlight_Kozuke = false

local BACK_BUTTON_ADVICE_201 = false

-- keep track of which historic battle advice we are playing (when relevant)
local Historic_Battle_UIC = nil
local Historic_Battle_Last_Played = ""
local Historic_Battle_Last_Advice = 0
local BOOL_Still_On_HB_Screen = false
local BOOL_HB_Sequence_In_Progress = false

-------------------------------------------------------------------------------------
------------------------------------- LOAD BOOLS ------------------------------------
-------------------------------------------------------------------------------------



-------------------------------------------------------------------------------------
------------------------------------- MP ADVICE -------------------------------------
-------------------------------------------------------------------------------------

function unhighlight_campaign_map_region()
	local map_parent = UIComponent(m_root:Find("mp_campaign_map"))
	local map = UIComponent(map_parent:Find("map"))
	map:InterfaceFunction("HighlightCampaignMapRegion","")
end

-------------------------------------------------------------------------------------

function ParentFind(parent_name,child_name)
	local parent = UIComponent(m_root:Find(parent_name))
	local child = UIComponent(parent:Find(child_name))
	if child ~= nil then
		return child
	end
	return nil
end

-------------------------------------------------------------------------------------

function highlight_campaign_map_region(region_key, end_time)
	--local map_parent =  UIComponent(m_root:Find("mp_campaign_map"))
	local map = ParentFind("mp_campaign_map","map") --UIComponent(map_parent:Find("map"))
	map:InterfaceFunction("HighlightCampaignMapRegion",region_key)
	--FETutorial.register_singleshot_timer("unhighlight_campaign_map_region", end_time)
end

-------------------------------------------------------------------------------------

function ChatBox()
	return UIComponent(FETutorial.Chat())
end

-------------------------------------------------------------------------------------

function Highlight_Starting_Mons()
	FETutorial.HighlightComponent(0,true," faction_crest","mp_avatar_general")
	FETutorial.register_singleshot_timer("UnHighlight_Starting_Mons", 5000)
end

-------------------------------------------------------------------------------------

function UnHighlight_Starting_Mons()
	FETutorial.HighlightComponent(0,false," faction_crest","mp_avatar_general")
end

-------------------------------------------------------------------------------------

function Highlight_Starting_Regions()
	FETutorial.HighlightComponent(0,true,"55_musashi_boshin","")	
	FETutorial.HighlightComponent(0,true,"9_nagato_boshin","")	
	FETutorial.register_singleshot_timer("UnHighlight_Starting_Regions", 5000)
end

-------------------------------------------------------------------------------------

function UnHighlight_Starting_Regions()
	FETutorial.HighlightComponent(0,false,"55_musashi_boshin","")	
	FETutorial.HighlightComponent(0,false,"9_nagato_boshin","")	
end

-------------------------------------------------------------------------------------

function Hide_Home_Button()
	local Home_Button = ParentFind("back_button_component","button_home")
	Home_Button:SetState("inactive")
end

function Show_Home_Button()
	local Home_Button = ParentFind("back_button_component","button_home")
	Home_Button:SetState("active")
end

function Hide_Back_Button()
	local Back_Button = ParentFind("back_button_component","button_back")
	Back_Button:SetState("inactive")
end

function Show_Back_Button()
	local Back_Button = ParentFind("back_button_component","button_back")
	Back_Button:SetState("active")
end

-------------------------------------------------------------------------------------

function go_to_campaign_screen()
	TransitionTo("mp_campaign_map")	
end

-------------------------------------------------------------------------------------

function enable_toolbar_buttons()	
	UIComponent(m_root:Find("button_change_avatar")):SetState("active")
	UIComponent(m_root:Find("button_avatar_general")):SetState("active")
	UIComponent(m_root:Find("button_army_management")):SetState("active")
	UIComponent(m_root:Find("button_profile")):SetState("active")
	UIComponent(m_root:Find("button_map")):SetState("active")
	UIComponent(m_root:Find("button_mp_clan")):SetState("active")
	UIComponent(m_root:Find("button_leaderboard")):SetState("active")
	UIComponent(m_root:Find("button_end_tutorial")):SetVisible(false)	
	Show_Back_Button()
	Show_Home_Button()	
	out.ting("")
end

-------------------------------------------------------------------------------------

function go_to_avatar_screen()
	if m_root then
		m_root:InterfaceFunction("TransitionToMPTuttorials", "mp_avatar_general")
		FETutorial.register_singleshot_timer("enable_toolbar_buttons", 1000)
	end	
end

-------------------------------------------------------------------------------------

function OnMPChatLobbyCreated(context)
	if FETutorial.is_tutorial_enabled() == true then
		out.ting("came here !")	
		FETutorial.ClearBool("BOOL_battle_2")
		FETutorial.ClearBool("BOOL_battle_1")
		FETutorial.ClearBool("BOOL_battle_3")
		FETutorial.ClearBool("FETUTORIALS_DONE")
		BOOL_battle_2 = false
		BOOL_battle_1 = false
		BOOL_battle_3 = false
		FETUTORIALS_DONE = false
		bool_can_start_battle = true
		out.ting(" 1. MP CHat Lobby created !")
		ChatBox():InterfaceFunction("AddAdvice", "7000_TUT_MP_Thread")
		COUNTER_MP_Advice = 0
		out.ting(bool_can_start_battle)	
		Hide_Home_Button()
		Hide_All_Toolbar_Buttons()
		FETutorial.register_singleshot_timer("Hide_Cancel_Button", 100)
		BOOL_Tutorial_In_Progress = true
		FETutorial.SaveBool("BOOL_Tutorial_In_Progress")
	end
end

-------------------------------------------------------------------------------------

function Hide_Cancel_Button()
	UIComponent(m_root:Find("button_cancel")):SetState("inactive")
end

-------------------------------------------------------------------------------------

function End_Tutorial_Early()	
	FETutorial.register_singleshot_timer("go_to_avatar_screen", 1000)
	FETUTORIALS_DONE = true
	BOOL_Tutorial_In_Progress = false
	FETutorial.ClearBool("BOOL_Tutorial_In_Progress")
	FETutorial.SaveBool("FETUTORIALS_DONE")		
	unhighlight_campaign_map_region()
	UIComponent(m_root:Find("button_ranked_battle")):SetState("active")
	UIComponent(m_root:Find("player_piece")):SetDisabled(false)
	UIComponent(m_root:Find("button_clan_competition")):SetVisible(true)	
	UIComponent(m_root:Find("clan_group")):SetVisible(true)
	UIComponent(m_root:Find("button_team_setup")):SetVisible(true)
	UIComponent(m_root:Find("button_games_list")):SetVisible(true)	
	UIComponent(m_root:Find("player_navy")):SetVisible(true)
	FETutorial.HighlightComponent(0,false,"button_back", "")
	FETutorial.HighlightComponent(0,false,"button_map","top_menu")
	FETutorial.HighlightComponent(0,false,"button_avatar_general","top_menu")
	FETutorial.HighlightComponent(0,false,"button_army_management","top_menu")
	FETutorial.HighlightComponent(0,false,"button_ranked_battle","mp_campaign_map")	
	FETutorial.HighlightComponent(1,false,"button_save", "mp_army_management")	
	Unhighlight_Avatar_Model()
	out.ting("Tutorial Finished !")
end

-------------------------------------------------------------------------------------

function OnStartRegionPopup(context)	
	if FETutorial.is_tutorial_enabled() == true and BOOL_Tutorial_In_Progress == true then
		if context.string == "ai_player_added" and BOOL_Tutorial_In_Progress == true then
			-- A Player has been added, call functions to disable few buttons here.
			out.ting("Player was added, disabling some buttons for this slot.")
			UIComponent(UIComponent(context.component):Find("player_icon")):SetState("inactive")
			UIComponent(UIComponent(context.component):Find("button_kick")):SetVisible(false)
			UIComponent(UIComponent(context.component):Find("button_close")):SetVisible(false)	
		elseif context.string == "empty_slot_added" and BOOL_Tutorial_In_Progress == true then
			out.ting("An Empty Slot was just added, remove it.")
			UIComponent(context.component):InterfaceFunction("clear_empty_slot")			
		elseif context.string == "human_player_added" and BOOL_Tutorial_In_Progress == true then
			UIComponent(UIComponent(context.component):Find("player_icon")):SetState("inactive")
			UIComponent(UIComponent(context.component):Find("button_kick")):SetVisible(false)
			UIComponent(UIComponent(context.component):Find("button_close")):SetVisible(false)
		elseif context.string == "warning_added" and BOOL_Tutorial_In_Progress == true then			
			UIComponent(context.component):SetVisible(false)			
		elseif context.string == "tutorials_ended" then
			End_Tutorial_Early()
		else
			out.ting(" 2. Start Region Selection Popup Visible. !")
			ChatBox():InterfaceFunction("AddAdvice", "7003_TUT_MP_Thread")
			COUNTER_MP_Advice = 3
			FETutorial.register_singleshot_timer("Highlight_Starting_Mons", 2500)
			UnHighlight_Name_Input()
		end
	end
end

-------------------------------------------------------------------------------------

function OnStartRegionSelected(context)
	if FETutorial.is_tutorial_enabled() == true then
		out.ting(" 3. Start Region Selected ! -- : "..context.string)
		BOOL_Nagato = false
		BOOL_Musashi = false
		BOOL_Satsuma = false
		BOOL_Tosa = false
		BOOL_Kai = false
		BOOL_Iwate = false	
		if context.string == "9_nagato_boshin" then
			BOOL_Nagato = true
			out.ting("Nagato Selected")
		elseif context.string == "55_musashi_boshin" then	
			BOOL_Musashi = true
			out.ting("Musashi Selected")
		elseif context.string == "2_satsuma" then	
			BOOL_Satsuma = true
		elseif context.string == "14_tosa" then	
			BOOL_Tosa = true
		elseif context.string == "49_kai" then	
			BOOL_Kai = true
		elseif context.string == "65_iwate" then	
			BOOL_Iwate = true
		end
	end
end

-------------------------------------------------------------------------------------

function delayed_battle_start()
	unhighlight_campaign_map_region()
	local map_parent = UIComponent(m_root:Find("mp_campaign_map"))
	local map = UIComponent(map_parent:Find("map"))		
	map:InterfaceFunction("AutoresolveBattle")	
end

-------------------------------------------------------------------------------------

function OnMapIconMoved(context)
	if FETutorial.is_tutorial_enabled() == true and BOOL_Tutorial_In_Progress == true then
		out.ting("Map Icon Moved !"..context.string)
		if context.string == "start_battle" then
			if BOOL_battle_1 == true and BOOL_battle_2 == false then
				out.ting("Starting Battle 2")
			elseif BOOL_battle_2 == true then
				out.ting("Starting Battle 3")
			end	
			FETutorial.register_singleshot_timer("delayed_battle_start", 2000)
		else
			if BOOL_Nagato then
				if context.string == "10_suo_boshin" or context.string == "11_iwami_boshin" or context.string == "4_tsukushi_boshin" or context.string == "5_higo_boshin" then
					if COUNTER_MP_Advice == 15 then
						UIComponent(m_root:Find("button_ranked_battle")):SetState("active")
						unhighlight_campaign_map_region()
						UIComponent(m_root:Find("player_piece")):SetDisabled(true)
						ChatBox():InterfaceFunction("AddAdvice", "7016_TUT_MP_Thread")
						COUNTER_MP_Advice = 16
					end
					if context.string == "10_suo_boshin" or context.string == "11_iwami_boshin" then
						BOOL_Highlight_Iwami_Suo = true
					elseif context.string == "5_higo_boshin" then
						BOOL_Highlight_Higo = true
					end
				elseif context.string == "1_hizen_boshin" or context.string == "2_satsuma_boshin" or context.string == "68_nagasaki_boshin" or context.string == "12_aki_boshin" or context.string == "8_bungo_boshin" then
					if COUNTER_MP_Advice == 29 then
						UIComponent(m_root:Find("button_ranked_battle")):SetState("active")
						unhighlight_campaign_map_region()
						UIComponent(m_root:Find("player_piece")):SetDisabled(true)
						ChatBox():InterfaceFunction("AddAdvice", "7030_TUT_MP_Thread")
						COUNTER_MP_Advice = 30
					end
				end
			elseif BOOL_Musashi then
				if context.string == "57_shimosa_boshin" or context.string == "58_shimotsuke_boshin" or context.string == "52_sagami_boshin" then
					if COUNTER_MP_Advice == 15 then
						UIComponent(m_root:Find("button_ranked_battle")):SetState("active")
						unhighlight_campaign_map_region()
						UIComponent(m_root:Find("player_piece")):SetDisabled(true)
						ChatBox():InterfaceFunction("AddAdvice", "7016_TUT_MP_Thread")
						COUNTER_MP_Advice = 16
					end
					if context.string == "52_sagami_boshin" then
						BOOL_Highlight_Sagami = true
					end
				elseif context.string == "49_kai_boshin" or context.string == "56_kazusa_boshin" or context.string == "51_izu_boshin" or context.string == "61_fukushima_boshin" then
					if COUNTER_MP_Advice == 29 then
						UIComponent(m_root:Find("button_ranked_battle")):SetState("active")
						unhighlight_campaign_map_region()
						UIComponent(m_root:Find("player_piece")):SetDisabled(true)
						ChatBox():InterfaceFunction("AddAdvice", "7030_TUT_MP_Thread")
						COUNTER_MP_Advice = 30
					end
				end
			elseif BOOL_Satsuma then
				if context.string == "1_hizen" or context.string == "6_hyuga" or context.string == "9_nagato" then
					if COUNTER_MP_Advice == 15 then
						UIComponent(m_root:Find("button_ranked_battle")):SetState("active")
						unhighlight_campaign_map_region()
						UIComponent(m_root:Find("player_piece")):SetDisabled(true)
						ChatBox():InterfaceFunction("AddAdvice", "7016_TUT_MP_Thread")
						COUNTER_MP_Advice = 16
					end
					if context.string == "9_nagato" then
						BOOL_Highlight_Nagato = true
					end
				elseif context.string == "5_higo" or context.string == "4_tsukushi" or context.string == "7_buzen" or context.string == "11_iwami" or context.string == "10_suo" then
					if COUNTER_MP_Advice == 29 then
						UIComponent(m_root:Find("button_ranked_battle")):SetState("active")
						unhighlight_campaign_map_region()
						UIComponent(m_root:Find("player_piece")):SetDisabled(true)
						ChatBox():InterfaceFunction("AddAdvice", "7030_TUT_MP_Thread")
						COUNTER_MP_Advice = 30
					end
				end
			elseif BOOL_Tosa then
				if context.string == "6_hyuga" or context.string == "13_iyo" then
					if COUNTER_MP_Advice == 15 then
						UIComponent(m_root:Find("button_ranked_battle")):SetState("active")
						unhighlight_campaign_map_region()
						UIComponent(m_root:Find("player_piece")):SetDisabled(true)
						ChatBox():InterfaceFunction("AddAdvice", "7016_TUT_MP_Thread")
						COUNTER_MP_Advice = 16
					end
					if context.string == "6_hyuga" then
						BOOL_Highlight_Hyuga = true
					end
				elseif context.string == "20_awa" or context.string == "2_satsuma" or context.string == "5_higo" then					
					if COUNTER_MP_Advice == 29 then
						UIComponent(m_root:Find("button_ranked_battle")):SetState("active")
						unhighlight_campaign_map_region()
						UIComponent(m_root:Find("player_piece")):SetDisabled(true)
						ChatBox():InterfaceFunction("AddAdvice", "7030_TUT_MP_Thread")
						COUNTER_MP_Advice = 30
					end
				end
			elseif BOOL_Kai then
				if context.string == "50_suruga" or context.string == "46_south_shinano" or context.string == "54_kozuke" or context.string == "55_musashi" or context.string == "52_sagami" then
					if COUNTER_MP_Advice == 15 then
						UIComponent(m_root:Find("button_ranked_battle")):SetState("active")
						unhighlight_campaign_map_region()
						UIComponent(m_root:Find("player_piece")):SetDisabled(true)
						ChatBox():InterfaceFunction("AddAdvice", "7016_TUT_MP_Thread")
						COUNTER_MP_Advice = 16
					end
					if context.string == "50_suruga" then
						BOOL_Highlight_Suruga = true
					elseif context.string == "46_south_shinano" then
						BOOL_Highlight_South_Shinano = true
					elseif context.string == "52_sagami" then
						BOOL_Highlight_Sagami = true
					elseif context.string == "54_kozuke" then
						BOOL_Highlight_Kozuke = true
					end
				elseif context.string == "48_north_shinano" or context.string == "51_izu" or context.string == "47_totomi" or context.string == "41_mikawa" or context.string == "53_echigo"then	
					if COUNTER_MP_Advice == 29 then
						UIComponent(m_root:Find("button_ranked_battle")):SetState("active")
						unhighlight_campaign_map_region()
						UIComponent(m_root:Find("player_piece")):SetDisabled(true)
						ChatBox():InterfaceFunction("AddAdvice", "7030_TUT_MP_Thread")
						COUNTER_MP_Advice = 30
					end
				end
			elseif BOOL_Iwate then
				if context.string == "62_uzen" then
					if COUNTER_MP_Advice == 15 then
						UIComponent(m_root:Find("button_ranked_battle")):SetState("active")
						unhighlight_campaign_map_region()
						UIComponent(m_root:Find("player_piece")):SetDisabled(true)
						ChatBox():InterfaceFunction("AddAdvice", "7016_TUT_MP_Thread")
						COUNTER_MP_Advice = 16
					end
				elseif context.string == "63_miyagi" or context.string == "64_ugo" or context.string == "61_fukushima" or context.string == "53_echigo" then	
					if COUNTER_MP_Advice == 29 then
						UIComponent(m_root:Find("button_ranked_battle")):SetState("active")
						unhighlight_campaign_map_region()
						UIComponent(m_root:Find("player_piece")):SetDisabled(true)
						ChatBox():InterfaceFunction("AddAdvice", "7030_TUT_MP_Thread")
						COUNTER_MP_Advice = 30
					end
				end
			end
		end
	end
end


function Hide_AI_Slot()
	local AI_Slot_2 = ParentFind("alliance2","player2")
	out.ting("Hide player 2 "..AI_Slot_2:Id())
	AI_Slot_2:SetVisible(false)
	local AI_Slot_1 = ParentFind("alliance2","player1")
	local icon = UIComponent(AI_Slot_1:Find("player_icon"))
	icon:SetState("inactive")
	out.ting("player 1 player_icon "..icon:Id())
	local kick = UIComponent(AI_Slot_1:Find("button_kick"))
	kick:SetState("inactive")
	out.ting("kick button  "..kick:Id())
	local button_close = UIComponent(AI_Slot_1:Find("button_close"))
	button_close:SetState("inactive")
	
end

-------------------------------------------------------------------------------------

function Hide_All_Toolbar_Buttons()
	UIComponent(m_root:Find("button_change_avatar")):SetState("inactive")
	UIComponent(m_root:Find("button_avatar_general")):SetState("inactive")
	UIComponent(m_root:Find("button_army_management")):SetState("inactive")
	UIComponent(m_root:Find("button_profile")):SetState("inactive")
	UIComponent(m_root:Find("button_map")):SetState("inactive")
	UIComponent(m_root:Find("button_mp_clan")):SetState("inactive")
	UIComponent(m_root:Find("button_leaderboard")):SetState("inactive")
	local encyclopaedia = ParentFind("top_menu","button_encyclopaedia")
	encyclopaedia:SetState("inactive")
end

-------------------------------------------------------------------------------------

function Hide_Game_Mode_Buttons()
	UIComponent(m_root:Find("button_clan_competition")):SetVisible(false)	
	UIComponent(m_root:Find("clan_group")):SetVisible(false)
	UIComponent(m_root:Find("button_team_setup")):SetVisible(false)
	UIComponent(m_root:Find("button_games_list")):SetVisible(false)	
	UIComponent(m_root:Find("player_navy")):SetVisible(false)
end

-------------------------------------------------------------------------------------

function Hide_Battle_Setup_Buttons()	
	UIComponent(m_root:Find("match_sea")):SetState("inactive")	
	UIComponent(m_root:Find("match_siege")):SetState("inactive")	
	UIComponent(m_root:Find("match_auto-team")):SetState("inactive")	
	UIComponent(m_root:Find("match_drop-in")):SetState("inactive")	
	UIComponent(m_root:Find("mixed_avatars_check")):SetVisible(false)
	--UIComponent(m_root:Find("mixed_avatars_check")):SetState("inactive")
	UIComponent(m_root:Find("match_land")):SetState("selected_inactive")	
	UIComponent(m_root:Find("match_one_on_one")):SetState("selected_inactive")
end

-------------------------------------------------------------------------------------

function Hide_Button_Customize()
	UIComponent(m_root:Find("button_customize")):SetState("inactive")
end

-------------------------------------------------------------------------------------

function Unhighlight_Avatar_Model()
	FETutorial.HighlightComponent(0,false,"player_piece","mp_campaign_map")	
end

function Highlight_ranked_battle_button()
	FETutorial.HighlightComponent(0,true,"button_ranked_battle","")	
end

function Unhighlight_ranked_battle_button()
	FETutorial.HighlightComponent(0,false,"button_ranked_battle","")	
end

function Unhighlight_auto_team_button()
	FETutorial.HighlightComponent(0,false,"button_team_setup","")	
end

function Unhighlight_battle_list_button()
	FETutorial.HighlightComponent(0,false,"button_games_list","")
end

function Unhighlight_clan_comp_button()
	FETutorial.HighlightComponent(0,false,"button_clan_competition","")	
end

function Highlight_onquest_map_button()
	FETutorial.HighlightComponent(0,true,"button_map","top_menu")
	FETutorial.register_singleshot_timer("Unhighlight_onquest_map_button", 2500)
end

function Unhighlight_onquest_map_button()
	FETutorial.HighlightComponent(0,false,"button_map","top_menu")
end

function UnHighlight_Name_Input()
	FETutorial.HighlightComponent(0,false,"name_input","", true)
end

-------------------------------------------------------------------------------------

local function OnAdviceFinished(context)
	if FETutorial.is_tutorial_enabled() == true and BOOL_Tutorial_In_Progress == true then
		out.ting("Advice Finished ! = " .. context.string)	
		if (COUNTER_MP_Advice == 0 and ChatBox()) then
			ChatBox():InterfaceFunction("AddAdvice", "7001_TUT_MP_Thread")
			COUNTER_MP_Advice = 1
		elseif (COUNTER_MP_Advice == 1 and ChatBox()) then
			ChatBox():InterfaceFunction("AddAdvice", "7002_TUT_MP_Thread")
			COUNTER_MP_Advice = 2
			FETutorial.HighlightComponent(0,true,"name_input","", true)
			FETutorial.register_singleshot_timer("UnHighlight_Name_Input", 2500)
		elseif (COUNTER_MP_Advice == 3 and ChatBox()) then
			ChatBox():InterfaceFunction("AddAdvice", "7004_TUT_MP_Thread")
			COUNTER_MP_Advice = 4	
			FETutorial.register_singleshot_timer("Highlight_Starting_Regions", 2500)
		elseif (COUNTER_MP_Advice == 6 and ChatBox()) then
			ChatBox():InterfaceFunction("AddAdvice", "7007_TUT_MP_Thread")
			COUNTER_MP_Advice = 7	
		elseif (COUNTER_MP_Advice == 7 and ChatBox()) then
			if BOOL_Save_Army_Button_Selected == false then
				FETutorial.HighlightComponent(1,true,"button_save", "mp_army_management", true)
			end		
		elseif (COUNTER_MP_Advice == 8 and ChatBox()) then
			ChatBox():InterfaceFunction("AddAdvice", "7009_TUT_MP_Thread")
			COUNTER_MP_Advice = 9		
			UIComponent(m_root:Find("button_ranked_battle")):SetState("active")
			FETutorial.HighlightComponent(0,true,"player_piece","mp_campaign_map", true)	
			FETutorial.register_singleshot_timer("Unhighlight_Avatar_Model", 2500)
		elseif (COUNTER_MP_Advice == 9 and ChatBox()) then	
			FETutorial.HighlightComponent(0,true,"button_ranked_battle","mp_campaign_map")	
		elseif (COUNTER_MP_Advice == 12 and ChatBox()) then
			FETutorial.HighlightComponent(1,true,"button_skill_tree","mp_postbattle", true)	
		elseif (COUNTER_MP_Advice == 14 and ChatBox()) then	
			ChatBox():InterfaceFunction("AddAdvice", "7025_TUT_MP_Thread")
			COUNTER_MP_Advice = 25	
			UIComponent(m_root:Find("button_map")):SetState("active")
			FETutorial.register_singleshot_timer("Highlight_onquest_map_button", 2000)
		elseif (COUNTER_MP_Advice == 16 and ChatBox()) then
			ChatBox():InterfaceFunction("AddAdvice", "7017_TUT_MP_Thread")
			COUNTER_MP_Advice = 17
		elseif (COUNTER_MP_Advice == 17 and ChatBox()) then	
			FETutorial.HighlightComponent(0,true,"button_ranked_battle","mp_campaign_map")	
		elseif (COUNTER_MP_Advice == 21 or COUNTER_MP_Advice == 210 and ChatBox()) then	
			if BACK_BUTTON_ADVICE_201 == false then
				ChatBox():InterfaceFunction("AddAdvice", "7050_TUT_MP_Thread")
				FETutorial.HighlightComponent(0,true,"button_back", "back_button_component")
				BACK_BUTTON_ADVICE_201 = true
			end
		elseif (COUNTER_MP_Advice == 22 and ChatBox()) then	
			ChatBox():InterfaceFunction("AddAdvice", "7023_TUT_MP_Thread")
			COUNTER_MP_Advice = 23
		elseif (COUNTER_MP_Advice == 24 and ChatBox()) then	
			out.ting("Highlight Avatar Toolbar Button")
			FETutorial.HighlightComponent(0,true,"button_avatar_general","top_menu")	
		elseif (COUNTER_MP_Advice == 26 and ChatBox()) then		
			ChatBox():InterfaceFunction("AddAdvice", "7027_TUT_MP_Thread")
			COUNTER_MP_Advice = 27	
		elseif (COUNTER_MP_Advice == 30 and ChatBox()) then	
			FETutorial.HighlightComponent(0,true,"button_ranked_battle","mp_campaign_map")	
		elseif (COUNTER_MP_Advice == 36 and ChatBox()) then	
			FETutorial.HighlightComponent(0,true,"button_army_management","top_menu")	
		elseif (COUNTER_MP_Advice == 38 and ChatBox()) then	
			FETutorial.HighlightComponent(0,true,"button_upgrade","mp_army_management")		
		elseif (COUNTER_MP_Advice == 41 and ChatBox()) then		
			FETutorial.HighlightComponent(0,true,"button_map", "top_menu")	
			FETutorial.register_singleshot_timer("Unhighlight_onquest_map_button", 2500)
		elseif (COUNTER_MP_Advice == 42 and ChatBox()) then	
			FETutorial.register_singleshot_timer("Highlight_ranked_battle_button", 7000)
			UIComponent(m_root:Find("button_ranked_battle")):SetState("inactive")
			FETutorial.register_singleshot_timer("Unhighlight_ranked_battle_button", 10000)
			ChatBox():InterfaceFunction("AddAdvice", "7043_TUT_MP_Thread")
			COUNTER_MP_Advice = 43
		elseif (COUNTER_MP_Advice == 43 and ChatBox()) then	
			UIComponent(m_root:Find("button_team_setup")):SetVisible(true)
			FETutorial.HighlightComponent(0,true,"button_team_setup","")	
			UIComponent(m_root:Find("button_team_setup")):SetState("inactive")
			FETutorial.register_singleshot_timer("Unhighlight_auto_team_button", 3000)
			ChatBox():InterfaceFunction("AddAdvice", "7044_TUT_MP_Thread")
			COUNTER_MP_Advice = 44
		elseif (COUNTER_MP_Advice == 44 and ChatBox()) then	
			UIComponent(m_root:Find("button_games_list")):SetVisible(true)
			FETutorial.HighlightComponent(0,true,"button_games_list","")
			UIComponent(m_root:Find("button_games_list")):SetState("inactive")
			FETutorial.register_singleshot_timer("Unhighlight_battle_list_button", 3000)	
			ChatBox():InterfaceFunction("AddAdvice", "7047_TUT_MP_Thread")
			COUNTER_MP_Advice = 47
		elseif (COUNTER_MP_Advice == 47 and ChatBox()) then	
			UIComponent(m_root:Find("button_clan_competition")):SetVisible(true)	
			UIComponent(m_root:Find("clan_group")):SetVisible(true)	
			FETutorial.HighlightComponent(0,true,"button_clan_competition","", true)	
			UIComponent(m_root:Find("button_clan_competition")):SetState("inactive")
			FETutorial.register_singleshot_timer("Unhighlight_clan_comp_button", 3000)
			ChatBox():InterfaceFunction("AddAdvice", "7048_TUT_MP_Thread")
			local map = ParentFind("mp_campaign_map","map") 
			map:InterfaceFunction("toggle_battle_rewards",true)
			map:InterfaceFunction("enable_xp_from_ai_battles", false)
			COUNTER_MP_Advice = 48
		elseif (COUNTER_MP_Advice == 48 and ChatBox()) then
			UIComponent(m_root:Find("button_ranked_battle")):SetState("active")
			UIComponent(m_root:Find("button_team_setup")):SetState("active")
			UIComponent(m_root:Find("button_games_list")):SetState("active")
			UIComponent(m_root:Find("button_clan_competition")):SetState("active")
			UIComponent(m_root:Find("button_change_avatar")):SetState("active")
			UIComponent(m_root:Find("button_avatar_general")):SetState("active")
			UIComponent(m_root:Find("button_army_management")):SetState("active")
			UIComponent(m_root:Find("button_profile")):SetState("active")
			UIComponent(m_root:Find("button_map")):SetState("active")
			UIComponent(m_root:Find("button_mp_clan")):SetState("active")
			UIComponent(m_root:Find("button_leaderboard")):SetState("active")
			UIComponent(m_root:Find("button_end_tutorial")):SetVisible(false)			
			local encyclopaedia = ParentFind("top_menu","button_encyclopaedia")
			encyclopaedia:SetState("active")
			FETUTORIALS_DONE = true
			BOOL_Tutorial_In_Progress = false
			TransitionTo("mp_avatar_general")	
			FETutorial.ClearBool("BOOL_Tutorial_In_Progress")
			FETutorial.SaveBool("FETUTORIALS_DONE")	
			out.ting("Tutorial Finished !")
		end			
	-- Steve, All the Audio File playback will be controlled from here,
	-- once the first file ends playing other in sequence will have to be played from here!
	elseif m_current_menu:Id() == "historical_battles" then
		--[[ Have to manage all the advice for any thing here !]]--	
		Historic_Battle_Last_Advice = Historic_Battle_Last_Advice + 1

		out.ting("HIS: advice #" .. Historic_Battle_Last_Advice .. " ended for battle " .. m_last_historic_battle)
		
		-- continue the advice sequences that have been kicked off
		FETutorial.register_singleshot_timer("Play_Next_HB_Advice", 1000)
		
	end
end


function Hide_HIST_Subtiles()
	local hist_battle = UIComponent(m_current_menu:Find("historic_advise"))
	if hist_battle ~= nil then
		hist_battle:SetVisible(false)
	end
end

function fade_out_button_half(button_name)
	local button = UIComponent(Historic_Battle_UIC:Find(button_name))
	button:TriggerAnimation("hide")
	UIComponent((button):Find("year")):TriggerAnimation("hide")	
	UIComponent((button):Find("completion")):TriggerAnimation("hide")	
	
	local line_name = button_name.."_line"
	UIComponent(Historic_Battle_UIC:Find(line_name)):SetVisible(true)
	UIComponent(Historic_Battle_UIC:Find(line_name)):TriggerAnimation("show")
end

function fade_in_button_half(button_name)
	local button = UIComponent(Historic_Battle_UIC:Find(button_name))
	button:TriggerAnimation("show")
	UIComponent((button):Find("year")):TriggerAnimation("show")
	UIComponent((button):Find("completion")):TriggerAnimation("show")	
	
	local line_name = button_name.."_line"
	UIComponent(Historic_Battle_UIC:Find(line_name)):SetVisible(false)
	UIComponent(Historic_Battle_UIC:Find(line_name)):TriggerAnimation("hide")
end

function fade_back_button_half(button_name)
	local button = UIComponent(Historic_Battle_UIC:Find(button_name))
	--button:TriggerAnimation("show")
	UIComponent((button):Find("label")):TriggerAnimation("show")
	
	UIComponent(Historic_Battle_UIC:Find(button_name.."_line")):SetVisible(true)
	UIComponent(Historic_Battle_UIC:Find(button_name.."_line")):TriggerAnimation("show")
	UIComponent((button):Find("location_marker")):SetVisible(true)
	UIComponent(Historic_Battle_UIC:Find(button_name .. "_marker")):SetVisible(true)
end

function fade_out_button(button_name)
	local button = UIComponent(Historic_Battle_UIC:Find(button_name))
	button:TriggerAnimation("hide")
	UIComponent((button):Find("year")):TriggerAnimation("hide")
	UIComponent((button):Find("completion")):TriggerAnimation("hide")
	UIComponent((button):Find("label")):TriggerAnimation("hide")
	
	UIComponent((button):Find("location_marker")):SetVisible(false)
	UIComponent(Historic_Battle_UIC:Find(button_name .. "_marker")):SetVisible(false)
end

function fade_in_button(button_name)
	local button = UIComponent(Historic_Battle_UIC:Find(button_name))
	button:TriggerAnimation("show")
	UIComponent((button):Find("year")):TriggerAnimation("show")
	UIComponent((button):Find("completion")):TriggerAnimation("show")
	UIComponent((button):Find("label")):TriggerAnimation("show")
	
	UIComponent((button):Find("location_marker")):SetVisible(true)
	UIComponent(Historic_Battle_UIC:Find(button_name .. "_marker")):SetVisible(true)
end

function disable_historic_battle_icons()
	UIComponent(Historic_Battle_UIC:Find("Toba_Fushimi")):SetInteractive(false)
	UIComponent(Historic_Battle_UIC:Find("Osaka")):SetInteractive(false)
	UIComponent(Historic_Battle_UIC:Find("Ueno")):SetInteractive(false)
	UIComponent(Historic_Battle_UIC:Find("Aizu")):SetInteractive(false)
	UIComponent(Historic_Battle_UIC:Find("Miyako_Bay")):SetInteractive(false)
	UIComponent(Historic_Battle_UIC:Find("Hakodate")):SetInteractive(false)
end

function enable_historic_battle_icons()
	UIComponent(Historic_Battle_UIC:Find("Toba_Fushimi")):SetInteractive(true)
	UIComponent(Historic_Battle_UIC:Find("Osaka")):SetInteractive(true)
	UIComponent(Historic_Battle_UIC:Find("Ueno")):SetInteractive(true)
	UIComponent(Historic_Battle_UIC:Find("Aizu")):SetInteractive(true)
	UIComponent(Historic_Battle_UIC:Find("Miyako_Bay")):SetInteractive(true)
	UIComponent(Historic_Battle_UIC:Find("Hakodate")):SetInteractive(true)
end

function revert_UI_from_historic_sequence()	
	
	for i = 0, UIComponent(Historic_Battle_UIC:Find("map_panel_boshin")):ChildCount()-1 do
		local item = UIComponent(UIComponent(Historic_Battle_UIC:Find("map_panel_boshin")):Find(i));
		if item:Id() ~= "Toba_Fushimi" and item:Id() ~= "Osaka" and item:Id() ~= "Ueno" and item:Id() ~= "Aizu" and item:Id() ~= "Miyako_Bay" and item:Id() ~= "Hakodate" then
			--item:TriggerAnimation("hide")
			item:SetVisible(false)
		end		
	end
	
	UIComponent(Historic_Battle_UIC:Find("Edo_marker")):SetVisible(false)
	
	for i = 0, UIComponent(Historic_Battle_UIC:Find("Osaka_link")):ChildCount()-1 do
		local item = UIComponent(UIComponent(Historic_Battle_UIC:Find("Osaka_link")):Find(i));
		--item:TriggerAnimation("hide")	
		item:SetVisible(false)
	end
	
	for i = 0, UIComponent(Historic_Battle_UIC:Find("Toba_Fushimi_link")):ChildCount()-1 do
		local item = UIComponent(UIComponent(Historic_Battle_UIC:Find("Toba_Fushimi_link")):Find(i));
		--item:TriggerAnimation("hide")	
		item:SetVisible(false)
	end
	
	for i = 0, UIComponent(Historic_Battle_UIC:Find("Ueno_link")):ChildCount()-1 do
		local item = UIComponent(UIComponent(Historic_Battle_UIC:Find("Ueno_link")):Find(i));
		--item:TriggerAnimation("hide")	
		item:SetVisible(false)
	end
	
	for i = 0, UIComponent(Historic_Battle_UIC:Find("Aizu_link")):ChildCount()-1 do
		local item = UIComponent(UIComponent(Historic_Battle_UIC:Find("Aizu_link")):Find(i));
		--item:TriggerAnimation("hide")	
		item:SetVisible(false)
	end
	
	for i = 0, UIComponent(Historic_Battle_UIC:Find("Miyako_Bay_link")):ChildCount()-1 do
		local item = UIComponent(UIComponent(Historic_Battle_UIC:Find("Miyako_Bay_link")):Find(i));
		--item:TriggerAnimation("hide")	
		item:SetVisible(false)
	end
	
	for i = 0, UIComponent(Historic_Battle_UIC:Find("Edo")):ChildCount()-1 do
		local item = UIComponent(UIComponent(Historic_Battle_UIC:Find("Edo")):Find(i));
		--item:TriggerAnimation("hide")	
		item:SetVisible(false)
	end
	
	fade_in_button("Toba_Fushimi")
	fade_in_button("Osaka")
	fade_in_button("Ueno")
	fade_in_button("Aizu")
	fade_in_button("Miyako_Bay")
	fade_in_button("Hakodate")
	enable_historic_battle_icons()
end
function Start_HB_Advice(uic, last_battle)
	Historic_Battle_UIC = uic
	Historic_Battle_Last_Played = last_battle
	Historic_Battle_Last_Advice = 0
	
	-- only disable stuff if we've just won one of the battles we have sequences for
	if Historic_Battle_Last_Played == "Toba_Fushimi" or
		Historic_Battle_Last_Played == "Osaka" or
		Historic_Battle_Last_Played == "Ueno" or
		Historic_Battle_Last_Played == "Aizu" or
		Historic_Battle_Last_Played == "Miyako_Bay" then
		
		BOOL_Still_On_HB_Screen = true
		FETutorial.SaveBool("BOOL_Still_On_HB_Screen")
		disable_historic_battle_icons();
		BOOL_HB_Sequence_In_Progress = true
		FETutorial.register_singleshot_timer("Play_Next_HB_Advice", 1500)
	end;
end;


function Play_Next_HB_Advice()
	out.ting("Play_Next_HB_Advice(" .. tostring(Historic_Battle_Last_Played) .. ", " .. tostring(Historic_Battle_Last_Advice) ..") called")
	
	if not FETutorial.LoadBool("BOOL_Still_On_HB_Screen") then
		return;
	end;
	
	if Historic_Battle_Last_Played == "Toba_Fushimi" then
		Play_Next_HB_Advice_TFOS()
		
	elseif Historic_Battle_Last_Played == "Osaka" then
		Play_Next_HB_Advice_OSUE()
		
	elseif Historic_Battle_Last_Played == "Ueno" then
		Play_Next_HB_Advice_UEAI()
		
	elseif Historic_Battle_Last_Played == "Aizu" then
		Play_Next_HB_Advice_AIMB()
		
	elseif Historic_Battle_Last_Played == "Miyako_Bay" then
		Play_Next_HB_Advice_MBHA()
	end;
end;


function Show_TFOS_Bubble()
	if not FETutorial.LoadBool("BOOL_Still_On_HB_Screen") then
		return;
	end;
	
	UIComponent(UIComponent(Historic_Battle_UIC:Find("Toba_Fushimi_link")):Find("map_bubble")):SetVisible(true)
	UIComponent(UIComponent(Historic_Battle_UIC:Find("Toba_Fushimi_link")):Find("map_bubble")):TriggerAnimation("show")
end

function Hide_TFOS_Bubble()
	if not FETutorial.LoadBool("BOOL_Still_On_HB_Screen") then
		return;
	end;

	UIComponent(UIComponent(Historic_Battle_UIC:Find("Toba_Fushimi_link")):Find("map_bubble")):TriggerAnimation("hide")
end	

function Show_TFOS_Enemy_Arrow_01()
	if not FETutorial.LoadBool("BOOL_Still_On_HB_Screen") then
		return;
	end;

	link = UIComponent(Historic_Battle_UIC:Find("Toba_Fushimi_link"))
	
	UIComponent(link:Find("enemy_arrow_1")):SetVisible(true)
	UIComponent(link:Find("enemy_arrow_1")):TriggerAnimation("path_anim")
	UIComponent(link:Find("enemy_arrow_2")):SetVisible(true)
	UIComponent(link:Find("enemy_arrow_2")):TriggerAnimation("path_anim")
	UIComponent(link:Find("enemy_arrow_3")):SetVisible(true)
	UIComponent(link:Find("enemy_arrow_3")):TriggerAnimation("path_anim")
end

function Show_TFOS_Allied_Arrow_01()
	if not FETutorial.LoadBool("BOOL_Still_On_HB_Screen") then
		return;
	end;

	link = UIComponent(Historic_Battle_UIC:Find("Toba_Fushimi_link"))
	
	UIComponent(link:Find("arrow_1")):SetVisible(true)
	UIComponent(link:Find("arrow_1")):TriggerAnimation("path_anim")
	UIComponent(link:Find("arrow_2")):SetVisible(true)
	UIComponent(link:Find("arrow_2")):TriggerAnimation("path_anim")
	UIComponent(link:Find("arrow_3")):SetVisible(true)
	UIComponent(link:Find("arrow_3")):TriggerAnimation("path_anim")
end


function Play_Next_HB_Advice_TFOS()
	if not FETutorial.LoadBool("BOOL_Still_On_HB_Screen") then
		return;
	end;
	
	if Historic_Battle_Last_Advice == 0 then
		Historic_Battle_UIC:InterfaceFunction("AddAdvice", "Bos.Narr.HB.Frontend_TFOS_01")	
							
		fade_out_button_half("Toba_Fushimi")
		fade_out_button("Osaka")
		fade_out_button("Ueno")
		fade_out_button("Aizu")
		fade_out_button("Miyako_Bay")
		fade_out_button("Hakodate")	
				
	elseif Historic_Battle_Last_Advice == 1 then
		Historic_Battle_UIC:InterfaceFunction("AddAdvice", "Bos.Narr.HB.Frontend_TFOS_02")
		
		Show_TFOS_Bubble();
		FETutorial.register_singleshot_timer("Show_TFOS_Enemy_Arrow_01", 2000)
		
	elseif Historic_Battle_Last_Advice == 2 then
		Show_Takamori_Photo()
		Historic_Battle_UIC:InterfaceFunction("AddAdvice", "Bos.Narr.HB.Frontend_TFOS_03")
		FETutorial.register_singleshot_timer("Show_TFOS_Allied_Arrow_01", 1000)
	else
		out.ting("Finished Toba-Fushimi -> Osaka sequence")
		Hide_Takamori_Photo()
				
		Hide_TFOS_Bubble()
		
		fade_in_button_half("Toba_Fushimi")
		fade_in_button("Osaka")
		fade_in_button("Ueno")
		fade_in_button("Aizu")
		fade_in_button("Miyako_Bay")
		fade_in_button("Hakodate")	
		
		
		FETutorial.register_singleshot_timer("enable_historic_battle_icons", 1000)
		
		Hide_HIST_Subtiles()
		BOOL_HB_Sequence_In_Progress = false
	end;
end;


function Show_Castle_Photo()
	if not FETutorial.LoadBool("BOOL_Still_On_HB_Screen") then
		return;
	end;
	
	UIComponent(Historic_Battle_UIC:Find("castle_photo")):SetVisible(true)
	UIComponent(Historic_Battle_UIC:Find("castle_photo")):TriggerAnimation("show")
end

function Hide_Castle_Photo()
	if not FETutorial.LoadBool("BOOL_Still_On_HB_Screen") then
		return;
	end;

	UIComponent(Historic_Battle_UIC:Find("castle_photo")):TriggerAnimation("hide")
end	


function Show_Imperial_Banner_Photo()
	if not FETutorial.LoadBool("BOOL_Still_On_HB_Screen") then
		return;
	end;

	UIComponent(Historic_Battle_UIC:Find("imperial_banner_photo")):SetVisible(true)
	UIComponent(Historic_Battle_UIC:Find("imperial_banner_photo")):TriggerAnimation("show")
end

function Hide_Imperial_Banner_Photo()
	if not FETutorial.LoadBool("BOOL_Still_On_HB_Screen") then
		return;
	end;

	UIComponent(Historic_Battle_UIC:Find("imperial_banner_photo")):TriggerAnimation("hide")
end	


function Show_Ueno_Photo()
	if not FETutorial.LoadBool("BOOL_Still_On_HB_Screen") then
		return;
	end;

	UIComponent(Historic_Battle_UIC:Find("ueno_photo")):SetVisible(true)
	UIComponent(Historic_Battle_UIC:Find("ueno_photo")):TriggerAnimation("show")
end

function Hide_Ueno_Photo()
	if not FETutorial.LoadBool("BOOL_Still_On_HB_Screen") then
		return;
	end;
	
	UIComponent(Historic_Battle_UIC:Find("ueno_photo")):TriggerAnimation("hide")
end	


function Show_Southern_Japan_Fill()
	if not FETutorial.LoadBool("BOOL_Still_On_HB_Screen") then
		return;
	end;
	
	UIComponent(Historic_Battle_UIC:Find("south_japan_fill")):SetVisible(true)
	UIComponent(Historic_Battle_UIC:Find("south_japan_fill")):TriggerAnimation("show")
end

function Hide_Southern_Japan_Fill()
	if not FETutorial.LoadBool("BOOL_Still_On_HB_Screen") then
		return;
	end;

	UIComponent(Historic_Battle_UIC:Find("south_japan_fill")):TriggerAnimation("hide")
end	


function Show_Edo_Label()
	if not FETutorial.LoadBool("BOOL_Still_On_HB_Screen") then
		return;
	end;

	link = UIComponent(Historic_Battle_UIC:Find("Edo"))
	
	--link:TriggerAnimation("show")
	link:SetVisible(true)
	UIComponent(link:Find("Edo_label")):SetVisible(true)
	UIComponent(link:Find("Edo_label")):TriggerAnimation("show")
	UIComponent(link:Find("location_marker")):SetVisible(true)

	UIComponent(Historic_Battle_UIC:Find("Edo_marker")):SetVisible(true)
end


function Show_Tokyo_Label()
	if not FETutorial.LoadBool("BOOL_Still_On_HB_Screen") then
		return;
	end;

	link = UIComponent(Historic_Battle_UIC:Find("Edo"))
	
	--link:TriggerAnimation("show")
	link:SetVisible(true)
	UIComponent(link:Find("Tokyo_label")):SetVisible(true)
	UIComponent(link:Find("Tokyo_label")):TriggerAnimation("show")
	UIComponent(link:Find("location_marker")):SetVisible(true)

	UIComponent(Historic_Battle_UIC:Find("Edo_marker")):SetVisible(true)
end

function Fade_Edo_To_Tokyo()
	if not FETutorial.LoadBool("BOOL_Still_On_HB_Screen") then
		return;
	end;

	link = UIComponent(Historic_Battle_UIC:Find("Edo"))
	
	UIComponent(link:Find("Edo_label")):TriggerAnimation("hide")
	UIComponent(link:Find("Tokyo_label")):SetVisible(true)
	UIComponent(link:Find("Tokyo_label")):TriggerAnimation("show")
end	

function Hide_Edo_Label()
	if not FETutorial.LoadBool("BOOL_Still_On_HB_Screen") then
		return;
	end;

	link = UIComponent(Historic_Battle_UIC:Find("Edo"))
	
	UIComponent(link:Find("Edo_label")):TriggerAnimation("hide")
	UIComponent(link:Find("location_marker")):SetVisible(false)
	
	UIComponent(Historic_Battle_UIC:Find("Edo_marker")):SetVisible(false)
end

function Hide_Tokyo_Label()
	if not FETutorial.LoadBool("BOOL_Still_On_HB_Screen") then
		return;
	end;

	link = UIComponent(Historic_Battle_UIC:Find("Edo"))
	
	UIComponent(link:Find("Tokyo_label")):TriggerAnimation("hide")
	UIComponent(link:Find("location_marker")):SetVisible(false)
	
	UIComponent(Historic_Battle_UIC:Find("Edo_marker")):SetVisible(false)
end	


function Show_OSUE_Enemy_Arrow_01()
	if not FETutorial.LoadBool("BOOL_Still_On_HB_Screen") then
		return;
	end;

	link = UIComponent(Historic_Battle_UIC:Find("Osaka_link"))
	
	UIComponent(link:Find("enemy_arrow_1")):SetVisible(true)
	UIComponent(link:Find("enemy_arrow_1")):TriggerAnimation("path_anim")
	UIComponent(link:Find("enemy_arrow_2")):SetVisible(true)
	UIComponent(link:Find("enemy_arrow_2")):TriggerAnimation("path_anim")
	UIComponent(link:Find("enemy_arrow_3")):SetVisible(true)
	UIComponent(link:Find("enemy_arrow_3")):TriggerAnimation("path_anim")
	UIComponent(link:Find("enemy_arrow_4")):SetVisible(true)
	UIComponent(link:Find("enemy_arrow_4")):TriggerAnimation("path_anim")
	UIComponent(link:Find("enemy_arrow_5")):SetVisible(true)
	UIComponent(link:Find("enemy_arrow_5")):TriggerAnimation("path_anim")
	UIComponent(link:Find("enemy_arrow_6")):SetVisible(true)
	UIComponent(link:Find("enemy_arrow_6")):TriggerAnimation("path_anim")
end


function Show_OSUE_Allied_Arrow_01()
	if not FETutorial.LoadBool("BOOL_Still_On_HB_Screen") then
		return;
	end;

	link = UIComponent(Historic_Battle_UIC:Find("Osaka_link"))
	
	UIComponent(link:Find("arrow_1")):SetVisible(true)
	UIComponent(link:Find("arrow_1")):TriggerAnimation("path_anim")
	UIComponent(link:Find("arrow_2")):SetVisible(true)
	UIComponent(link:Find("arrow_2")):TriggerAnimation("path_anim")
	UIComponent(link:Find("arrow_3")):SetVisible(true)
	UIComponent(link:Find("arrow_3")):TriggerAnimation("path_anim")
	UIComponent(link:Find("arrow_4")):SetVisible(true)
	UIComponent(link:Find("arrow_4")):TriggerAnimation("path_anim")
	UIComponent(link:Find("arrow_5")):SetVisible(true)
	UIComponent(link:Find("arrow_5")):TriggerAnimation("path_anim")
	UIComponent(link:Find("arrow_6")):SetVisible(true)
	UIComponent(link:Find("arrow_6")):TriggerAnimation("path_anim")
end


function Play_Next_HB_Advice_OSUE()
	if not FETutorial.LoadBool("BOOL_Still_On_HB_Screen") then
		return;
	end;
	
	if Historic_Battle_Last_Advice == 0 then		
		fade_out_button("Toba_Fushimi")
		fade_out_button_half("Osaka")
		fade_out_button("Ueno")
		fade_out_button("Aizu")
		fade_out_button("Miyako_Bay")
		fade_out_button("Hakodate")	
		
		Historic_Battle_UIC:InterfaceFunction("AddAdvice", "Bos.Narr.HB.Frontend_OSUE_01")
		
		FETutorial.register_singleshot_timer("Show_Castle_Photo", 1000)
		
		FETutorial.register_singleshot_timer("Show_OSUE_Enemy_Arrow_01", 5000)
		FETutorial.register_singleshot_timer("Show_Edo_Label", 5000)
				
	elseif Historic_Battle_Last_Advice == 1 then
		Hide_Castle_Photo()
		Historic_Battle_UIC:InterfaceFunction("AddAdvice", "Bos.Narr.HB.Frontend_OSUE_02")
	elseif Historic_Battle_Last_Advice == 2 then
		Show_Southern_Japan_Fill()
		FETutorial.register_singleshot_timer("Show_Imperial_Banner_Photo", 4000)
		Historic_Battle_UIC:InterfaceFunction("AddAdvice", "Bos.Narr.HB.Frontend_OSUE_03")
	elseif Historic_Battle_Last_Advice == 3 then	
		Show_OSUE_Allied_Arrow_01()
		Historic_Battle_UIC:InterfaceFunction("AddAdvice", "Bos.Narr.HB.Frontend_OSUE_04")
	elseif Historic_Battle_Last_Advice == 4 then
		Hide_Imperial_Banner_Photo()
		Historic_Battle_UIC:InterfaceFunction("AddAdvice", "Bos.Narr.HB.Frontend_OSUE_05")		
	elseif Historic_Battle_Last_Advice == 5 then
		Historic_Battle_UIC:InterfaceFunction("AddAdvice", "Bos.Narr.HB.Frontend_OSUE_06")
		Hide_Southern_Japan_Fill()
		FETutorial.register_singleshot_timer("Show_Ueno_Photo", 3000)
	elseif Historic_Battle_Last_Advice == 6 then	
		Historic_Battle_UIC:InterfaceFunction("AddAdvice", "Bos.Narr.HB.Frontend_OSUE_07")
		fade_back_button_half("Ueno")
	else
		out.ting("Finished Osaka -> Ueno sequence")
		
		Hide_Ueno_Photo()
		Hide_Edo_Label()
						
		fade_in_button("Toba_Fushimi")
		fade_in_button_half("Osaka")
		fade_in_button_half("Ueno")
		fade_in_button("Aizu")
		fade_in_button("Miyako_Bay")
		fade_in_button("Hakodate")
		
		FETutorial.register_singleshot_timer("enable_historic_battle_icons", 1000)
		
		Hide_HIST_Subtiles()
		BOOL_HB_Sequence_In_Progress = false
	end;
end;


function Show_UEAI_Allied_Arrow_01()
	if not FETutorial.LoadBool("BOOL_Still_On_HB_Screen") then
		return;
	end;

	link = UIComponent(Historic_Battle_UIC:Find("Ueno_link"))
	
	UIComponent(link:Find("arrow_1")):SetVisible(true)
	UIComponent(link:Find("arrow_1")):TriggerAnimation("path_anim")
	UIComponent(link:Find("arrow_2")):SetVisible(true)
	UIComponent(link:Find("arrow_2")):TriggerAnimation("path_anim")
	UIComponent(link:Find("arrow_3")):SetVisible(true)
	UIComponent(link:Find("arrow_3")):TriggerAnimation("path_anim")
end


function Show_Takamori_Photo()
	if not FETutorial.LoadBool("BOOL_Still_On_HB_Screen") then
		return;
	end;

	UIComponent(Historic_Battle_UIC:Find("takamori_photo")):SetVisible(true)
	UIComponent(Historic_Battle_UIC:Find("takamori_photo")):TriggerAnimation("show")
end

function Hide_Takamori_Photo()
	if not FETutorial.LoadBool("BOOL_Still_On_HB_Screen") then
		return;
	end;

	UIComponent(Historic_Battle_UIC:Find("takamori_photo")):TriggerAnimation("hide")
end	


function Show_Central_Japan_Fill()
	if not FETutorial.LoadBool("BOOL_Still_On_HB_Screen") then
		return;
	end;
	
	UIComponent(Historic_Battle_UIC:Find("central_japan_fill")):SetVisible(true)
	UIComponent(Historic_Battle_UIC:Find("central_japan_fill")):TriggerAnimation("show")
end

function Hide_Central_Japan_Fill()
	if not FETutorial.LoadBool("BOOL_Still_On_HB_Screen") then
		return;
	end;

	UIComponent(Historic_Battle_UIC:Find("central_japan_fill")):TriggerAnimation("hide")
end	


function Show_North_Japan_Fill()
	if not FETutorial.LoadBool("BOOL_Still_On_HB_Screen") then
		return;
	end;
	
	UIComponent(Historic_Battle_UIC:Find("north_japan_fill")):SetVisible(true)
	UIComponent(Historic_Battle_UIC:Find("north_japan_fill")):TriggerAnimation("show")
end

function Hide_North_Japan_Fill()
	if not FETutorial.LoadBool("BOOL_Still_On_HB_Screen") then
		return;
	end;

	UIComponent(Historic_Battle_UIC:Find("north_japan_fill")):TriggerAnimation("hide")
end	


function Play_Next_HB_Advice_UEAI()
	if not FETutorial.LoadBool("BOOL_Still_On_HB_Screen") then
		return;
	end;

	if Historic_Battle_Last_Advice == 0 then
		
		fade_out_button("Toba_Fushimi")
		fade_out_button("Osaka")
		fade_out_button_half("Ueno")
		fade_out_button("Aizu")
		fade_out_button("Miyako_Bay")
		fade_out_button("Hakodate")	
		
		Historic_Battle_UIC:InterfaceFunction("AddAdvice", "Bos.Narr.HB.Frontend_UEAI_01")
		
		FETutorial.register_singleshot_timer("Show_Imperial_Banner_Photo", 5000)
		FETutorial.register_singleshot_timer("Show_Central_Japan_Fill", 3000)
	elseif Historic_Battle_Last_Advice == 1 then
		Historic_Battle_UIC:InterfaceFunction("AddAdvice", "Bos.Narr.HB.Frontend_UEAI_02")
		Show_Edo_Label()
		FETutorial.register_singleshot_timer("Fade_Edo_To_Tokyo", 4000)
	elseif Historic_Battle_Last_Advice == 2 then
		Hide_Imperial_Banner_Photo()
		Show_North_Japan_Fill()
		Historic_Battle_UIC:InterfaceFunction("AddAdvice", "Bos.Narr.HB.Frontend_UEAI_03")
	elseif Historic_Battle_Last_Advice == 3 then
		Historic_Battle_UIC:InterfaceFunction("AddAdvice", "Bos.Narr.HB.Frontend_UEAI_04")
		fade_back_button_half("Aizu")
	elseif Historic_Battle_Last_Advice == 4 then
		Show_UEAI_Allied_Arrow_01()
		Show_Takamori_Photo()
		Hide_Central_Japan_Fill()
		Hide_North_Japan_Fill()
		Hide_Tokyo_Label()
		Historic_Battle_UIC:InterfaceFunction("AddAdvice", "Bos.Narr.HB.Frontend_UEAI_05")	
	else
		out.ting("Finished Ueno -> Aizu sequence")		
		Hide_HIST_Subtiles()
		
		Hide_Takamori_Photo()
		
		fade_in_button("Toba_Fushimi")
		fade_in_button("Osaka")
		fade_in_button_half("Ueno")
		fade_in_button_half("Aizu")
		fade_in_button("Miyako_Bay")
		fade_in_button("Hakodate")
		
		FETutorial.register_singleshot_timer("enable_historic_battle_icons", 1000)
		BOOL_HB_Sequence_In_Progress = false
	end;
end;


function Show_Kotetsu_Photo()
	if not FETutorial.LoadBool("BOOL_Still_On_HB_Screen") then
		return;
	end;
	
	UIComponent(Historic_Battle_UIC:Find("kotetsu_photo")):SetVisible(true)
	UIComponent(Historic_Battle_UIC:Find("kotetsu_photo")):TriggerAnimation("show")
end

function Hide_Kotetsu_Photo()
	if not FETutorial.LoadBool("BOOL_Still_On_HB_Screen") then
		return;
	end;

	UIComponent(Historic_Battle_UIC:Find("kotetsu_photo")):TriggerAnimation("hide")
end	


function Show_AIMB_Enemy_Arrow_01()
	if not FETutorial.LoadBool("BOOL_Still_On_HB_Screen") then
		return;
	end;
	
	link = UIComponent(Historic_Battle_UIC:Find("Aizu_link"))
	
	UIComponent(link:Find("enemy_arrow_1")):SetVisible(true)
	UIComponent(link:Find("enemy_arrow_1")):TriggerAnimation("path_anim")
	UIComponent(link:Find("enemy_arrow_2")):SetVisible(true)
	UIComponent(link:Find("enemy_arrow_2")):TriggerAnimation("path_anim")
	UIComponent(link:Find("enemy_arrow_3")):SetVisible(true)
	UIComponent(link:Find("enemy_arrow_3")):TriggerAnimation("path_anim")
end


function Show_AIMB_Enemy_Arrow_02()
	if not FETutorial.LoadBool("BOOL_Still_On_HB_Screen") then
		return;
	end;

	link = UIComponent(Historic_Battle_UIC:Find("Aizu_link"))
	
	UIComponent(link:Find("enemy_arrow_4")):SetVisible(true)
	UIComponent(link:Find("enemy_arrow_4")):TriggerAnimation("path_anim")
	UIComponent(link:Find("enemy_arrow_5")):SetVisible(true)
	UIComponent(link:Find("enemy_arrow_5")):TriggerAnimation("path_anim")
	UIComponent(link:Find("enemy_arrow_6")):SetVisible(true)
	UIComponent(link:Find("enemy_arrow_6")):TriggerAnimation("path_anim")
end


function Show_Far_North_Japan_Fill()
	if not FETutorial.LoadBool("BOOL_Still_On_HB_Screen") then
		return;
	end;

	UIComponent(Historic_Battle_UIC:Find("far_north_japan_fill")):SetVisible(true)
	UIComponent(Historic_Battle_UIC:Find("far_north_japan_fill")):TriggerAnimation("show")
	UIComponent(Historic_Battle_UIC:Find("Ezo_label")):SetVisible(true)
	UIComponent(Historic_Battle_UIC:Find("Ezo_label")):TriggerAnimation("show")
end

function Hide_Far_North_Japan_Fill()
	if not FETutorial.LoadBool("BOOL_Still_On_HB_Screen") then
		return;
	end;

	UIComponent(Historic_Battle_UIC:Find("far_north_japan_fill")):TriggerAnimation("hide")
	UIComponent(Historic_Battle_UIC:Find("Ezo_label")):TriggerAnimation("hide")
end	


function Play_Next_HB_Advice_AIMB()
	if not FETutorial.LoadBool("BOOL_Still_On_HB_Screen") then
		return;
	end;

	if Historic_Battle_Last_Advice == 0 then
		
		fade_out_button("Toba_Fushimi")
		fade_out_button("Osaka")
		fade_out_button("Ueno")
		fade_out_button_half("Aizu")
		fade_out_button("Miyako_Bay")
		fade_out_button("Hakodate")	
		
		Historic_Battle_UIC:InterfaceFunction("AddAdvice", "Bos.Narr.HB.Frontend_AIMB_01")
	elseif Historic_Battle_Last_Advice == 1 then
		Show_AIMB_Enemy_Arrow_01()
		Show_Far_North_Japan_Fill()
		Historic_Battle_UIC:InterfaceFunction("AddAdvice", "Bos.Narr.HB.Frontend_AIMB_02")
	elseif Historic_Battle_Last_Advice == 2 then
		Historic_Battle_UIC:InterfaceFunction("AddAdvice", "Bos.Narr.HB.Frontend_AIMB_03")
	elseif Historic_Battle_Last_Advice == 3 then
		Historic_Battle_UIC:InterfaceFunction("AddAdvice", "Bos.Narr.HB.Frontend_AIMB_04")	
		FETutorial.register_singleshot_timer("Show_Kotetsu_Photo", 2000)
	elseif Historic_Battle_Last_Advice == 4 then
		Historic_Battle_UIC:InterfaceFunction("AddAdvice", "Bos.Narr.HB.Frontend_AIMB_05")
		fade_back_button_half("Miyako_Bay")
		Show_AIMB_Enemy_Arrow_02()
		FETutorial.register_singleshot_timer("Hide_Far_North_Japan_Fill", 2000)
		FETutorial.register_singleshot_timer("Hide_Kotetsu_Photo", 2000)
	else
		out.ting("Finished Aizu -> Miyako Bay sequence")		
		Hide_HIST_Subtiles()
		
		fade_in_button("Toba_Fushimi")
		fade_in_button("Osaka")
		fade_in_button("Ueno")
		fade_in_button_half("Aizu")
		fade_in_button_half("Miyako_Bay")
		fade_in_button("Hakodate")
		
		FETutorial.register_singleshot_timer("enable_historic_battle_icons", 1000)
		BOOL_HB_Sequence_In_Progress = false
	end;
end;


function Show_MBHA_Allied_Arrow_01()
	if not FETutorial.LoadBool("BOOL_Still_On_HB_Screen") then
		return;
	end;

	link = UIComponent(Historic_Battle_UIC:Find("Miyako_Bay_link"))
	
	UIComponent(link:Find("arrow_1")):SetVisible(true)
	UIComponent(link:Find("arrow_1")):TriggerAnimation("path_anim")
	UIComponent(link:Find("arrow_2")):SetVisible(true)
	UIComponent(link:Find("arrow_2")):TriggerAnimation("path_anim")
	UIComponent(link:Find("arrow_3")):SetVisible(true)
	UIComponent(link:Find("arrow_3")):TriggerAnimation("path_anim")
end


function Play_Next_HB_Advice_MBHA()
	if not FETutorial.LoadBool("BOOL_Still_On_HB_Screen") then
		return;
	end;

	if Historic_Battle_Last_Advice == 0 then
		
		fade_out_button("Toba_Fushimi")
		fade_out_button("Osaka")
		fade_out_button("Ueno")
		fade_out_button_half("Aizu")
		fade_out_button_half("Miyako_Bay")
		fade_out_button("Hakodate")
		
		Show_Tokyo_Label()
		Show_Far_North_Japan_Fill()
		
		Historic_Battle_UIC:InterfaceFunction("AddAdvice", "Bos.Narr.HB.Frontend_MBHA_01")
		
		FETutorial.register_singleshot_timer("Show_Kotetsu_Photo", 1000)
		FETutorial.register_singleshot_timer("Hide_Kotetsu_Photo", 6000)
	elseif Historic_Battle_Last_Advice == 1 then
		FETutorial.register_singleshot_timer("Show_Takamori_Photo", 1000)
		Historic_Battle_UIC:InterfaceFunction("AddAdvice", "Bos.Narr.HB.Frontend_MBHA_02")
	elseif Historic_Battle_Last_Advice == 2 then
		Hide_Takamori_Photo()
		Show_MBHA_Allied_Arrow_01()
		fade_back_button_half("Hakodate")
		Historic_Battle_UIC:InterfaceFunction("AddAdvice", "Bos.Narr.HB.Frontend_MBHA_03")
	else
		out.ting("Finished Aizu -> Miyako Bay sequence")
		Hide_Tokyo_Label()
		Hide_Far_North_Japan_Fill()
		Hide_HIST_Subtiles()
		
		fade_in_button("Toba_Fushimi")
		fade_in_button("Osaka")
		fade_in_button("Ueno")
		fade_in_button_half("Aizu")
		fade_in_button_half("Miyako_Bay")
		fade_in_button_half("Hakodate")
		
		FETutorial.register_singleshot_timer("enable_historic_battle_icons", 1000)
		BOOL_HB_Sequence_In_Progress = false
	end;
end;



-------------------------------------------------------------------------------------
---------------------------------- COMPONENT CLICKED --------------------------------
-------------------------------------------------------------------------------------

function OnComponentLClickUp(context)	
	out.ting("Component clicked = " .. context.string)	
	if FETutorial.is_tutorial_enabled() == true and BOOL_Tutorial_In_Progress == true then		
		if conditions.IsComponentType("card_Boshin_Inf_Spear_Levy_MP", context) or conditions.IsComponentType("card_Boshin_Inf_Spear_Yari_Kachi_MP", context) or conditions.IsComponentType("card_Boshin_Inf_Sword_Katana_Kachi_MP", context) or conditions.IsComponentType("card_Boshin_Inf_Missile_Bow_Kachi_MP", context) or conditions.IsComponentType("card_Boshin_Cav_Spear_Yari_Ki_MP", context) or conditions.IsComponentType("card_Boshin_Inf_Missile_Matchlock_Kachi_MP", context) or conditions.IsComponentType("card_Boshin_Inf_Line_Red_Bear_Infantry_MP", context) or conditions.IsComponentType("card_Boshin_Inf_Line_White_Tiger_Force_MP", context) then
			local Veteran_Card = UIComponent(context.component)
			local Card_Type = UIComponent(Veteran_Card:Parent("tab_veterans",false))
			if Card_Type ~=nil and Card_Type:Id() == "tab_veterans" then
				if COUNTER_MP_Advice == 37 then
					ChatBox():InterfaceFunction("AddAdvice", "7038_TUT_MP_Thread")
					COUNTER_MP_Advice = 38
				end
			end
		elseif conditions.IsComponentType("card_Inf_Spear_Yari_Ashigaru_MP", context) or conditions.IsComponentType("card_Inf_Heavy_Warrior_Nuns_MP", context) or conditions.IsComponentType("card_Genpei_Inf_Heavy_Naginata_Attendants_MP", context) or conditions.IsComponentType("card_Inf_Sword_Katana_Ashigaru_MP", context) or conditions.IsComponentType("card_Inf_Sword_Katana_Samurai_MP", context) or conditions.IsComponentType("card_Genpei_Inf_Sword_Sword_Attendants_MP", context) or conditions.IsComponentType("card_Inf_Missile_Bow_Ashigaru_MP", context) or conditions.IsComponentType("card_Cav_Spear_Light_Cavalry_MP", context) or conditions.IsComponentType("card_Cav_Spear_Naginata_Warrior_Monk_Cavalry_MP", context) or conditions.IsComponentType("card_Genpei_Cav_Spear_Naginata_Cavalry_MP", context) or conditions.IsComponentType("card_Inf_Spear_Yari_Samurai_MP", context) or conditions.IsComponentType("card_Inf_Missile_Bow_Samurai_MP", context)	then
			local Veteran_Card = UIComponent(context.component)
			local Card_Type = UIComponent(Veteran_Card:Parent("tab_veterans",false))
			if Card_Type ~=nil and Card_Type:Id() == "tab_veterans" then
				if COUNTER_MP_Advice == 37 then
					ChatBox():InterfaceFunction("AddAdvice", "7038_TUT_MP_Thread")
					COUNTER_MP_Advice = 38
				end
			end
		elseif conditions.IsComponentType("card_Gen_Taisho_Mp", context) or conditions.IsComponentType("card_Boshin_Gen_Generals_Bodyguard_MP", context) or conditions.IsComponentType("card_Boshin_Gen_Generals_Hatamoto_MP", context) then
			if COUNTER_MP_Advice == 5 or COUNTER_MP_Advice == 6 or COUNTER_MP_Advice == 7 then
				FETutorial.register_singleshot_timer("Hide_Button_Customize", 10)
			end
		elseif conditions.IsComponentType("button_armour_sets", context) then
			if COUNTER_MP_Advice == 14 or COUNTER_MP_Advice == 25 then
				ChatBox():InterfaceFunction("AddAdvice", "7026_TUT_MP_Thread")
				COUNTER_MP_Advice = 26
			end
		elseif conditions.IsComponentType("button_army_management", context) then	
			FETutorial.HighlightComponent(0,false,"button_army_management","top_menu")
			if COUNTER_MP_Advice == 36 then	
				ChatBox():InterfaceFunction("AddAdvice", "7046_TUT_MP_Thread")
				COUNTER_MP_Advice = 46
			end
		elseif conditions.IsComponentType("button_army_setup_ok", context) or conditions.IsComponentType("player_icon", context) then
			if COUNTER_MP_Advice == 11 then
				FETutorial.register_singleshot_timer("Hide_Button_Ancillaries", 500)
			end 
		elseif conditions.IsComponentType("button_avatar_general", context) then
			FETutorial.HighlightComponent(0,false,"button_avatar_general","top_menu")
			if COUNTER_MP_Advice == 24 then
				ChatBox():InterfaceFunction("AddAdvice", "7014_TUT_MP_Thread")
				COUNTER_MP_Advice = 14
			end 
		elseif conditions.IsComponentType("button_back", context) then	
			FETutorial.HighlightComponent(0,false,"button_back", "")
			FETutorial.HighlightComponent(0,false,"button_back", "back_button_component")
			if COUNTER_MP_Advice == 13 or COUNTER_MP_Advice == 21 or COUNTER_MP_Advice == 33 or COUNTER_MP_Advice == 34 or COUNTER_MP_Advice == 210 then
				TransitionTo("mp_campaign_map")	
			end		
		elseif conditions.IsComponentType("button_cancel", context) then
			if COUNTER_MP_Advice == 13 then
				Show_Back_Button()
				ChatBox():InterfaceFunction("AddAdvice", "7045_TUT_MP_Thread")
				FETutorial.HighlightComponent(0,true,"button_back", "")	
			elseif COUNTER_MP_Advice == 40 then
				UIComponent(m_root:Find("button_map")):SetState("active")
				ChatBox():InterfaceFunction("AddAdvice", "7041_TUT_MP_Thread")
				COUNTER_MP_Advice = 41	
			end
		elseif conditions.IsComponentType("button_map", context) then
			FETutorial.HighlightComponent(0,false,"button_map", "top_menu")	
		elseif conditions.IsComponentType("button_modify", context) then
			UIComponent(m_root:Find("tab_veterans")):SetVisible(false)
		elseif conditions.IsComponentType("button_ranked_battle", context) then	
			FETutorial.HighlightComponent(0,false,"button_ranked_battle","mp_campaign_map")	
			if COUNTER_MP_Advice == 8 or COUNTER_MP_Advice == 9 then
				Unhighlight_Avatar_Model()
				Hide_Battle_Setup_Buttons()	
				ChatBox():InterfaceFunction("AddAdvice", "7010_TUT_MP_Thread")
				COUNTER_MP_Advice = 10	
			elseif COUNTER_MP_Advice == 21 or COUNTER_MP_Advice == 34 or COUNTER_MP_Advice == 210 then
				Hide_Battle_Setup_Buttons()	
				if COUNTER_MP_Advice == 21 or COUNTER_MP_Advice == 210 then
					ChatBox():InterfaceFunction("AddAdvice", "7018_TUT_MP_Thread")
					COUNTER_MP_Advice = 18
				else
					ChatBox():InterfaceFunction("AddAdvice", "7031_TUT_MP_Thread")
					COUNTER_MP_Advice = 31	
				end
			end
			if COUNTER_MP_Advice == 15 or COUNTER_MP_Advice == 16 or COUNTER_MP_Advice == 17 then
				Hide_Battle_Setup_Buttons()	
				ChatBox():InterfaceFunction("AddAdvice", "7018_TUT_MP_Thread")
				COUNTER_MP_Advice = 18	
			end
			if COUNTER_MP_Advice == 30 then
				Hide_Battle_Setup_Buttons()	
				ChatBox():InterfaceFunction("AddAdvice", "7031_TUT_MP_Thread")
				COUNTER_MP_Advice = 31	
			end
		elseif conditions.IsComponentType("button_ok", context) then
			UIComponent(m_root:Find("button_cancel")):SetState("active")
			if COUNTER_MP_Advice == 13 or COUNTER_MP_Advice == 22 or COUNTER_MP_Advice == 23 then
				Show_Back_Button()
				ChatBox():InterfaceFunction("AddAdvice", "7045_TUT_MP_Thread")	
				FETutorial.HighlightComponent(0,true,"button_back", "")		
			elseif COUNTER_MP_Advice == 26 or COUNTER_MP_Advice == 27 then
				ChatBox():InterfaceFunction("AddAdvice", "7028_TUT_MP_Thread")
				COUNTER_MP_Advice = 28
				UIComponent(m_root:Find("button_map")):SetState("active")
				FETutorial.HighlightComponent(0,true,"button_map", "top_menu")	
				FETutorial.register_singleshot_timer("Unhighlight_onquest_map_button", 2500)
			elseif COUNTER_MP_Advice == 40 then
				UIComponent(m_root:Find("button_map")):SetState("active")
				ChatBox():InterfaceFunction("AddAdvice", "7041_TUT_MP_Thread")
				COUNTER_MP_Advice = 41
			end
		elseif conditions.IsComponentType("button_add_veteran_unit", context) then
			if (COUNTER_MP_Advice == 34 and BOOL_Player_Lost_Battle == false) then	
				Show_Back_Button()
				ChatBox():InterfaceFunction("AddAdvice", "7045_TUT_MP_Thread")
				FETutorial.HighlightComponent(0,true,"button_back","")
			else
				Show_Back_Button()
				ChatBox():InterfaceFunction("AddAdvice", "7050_TUT_MP_Thread")
				FETutorial.HighlightComponent(0,true,"button_back","")
			end
		elseif conditions.IsComponentType("button_ready", context) or conditions.IsComponentType("button_ancillaries", context) then
			if (COUNTER_MP_Advice == 32 and BOOL_Highlight_Ancillaries == false) then
				FETutorial.unregister_timer("Highlight_Modify_Retainers_Button")
			else
				FETutorial.HighlightComponent(0,false,"button_ancillaries","", true)
			end
		elseif conditions.IsComponentType("button_save", context) then
			BOOL_Save_Army_Button_Selected = true	
			FETutorial.HighlightComponent(1,false,"button_save", "mp_army_management")	
		elseif conditions.IsComponentType("button_search", context) then	
			FETutorial.HighlightComponent(1,false,"button_search","")
		elseif conditions.IsComponentType("button_show_retainer_popup", context) then	
			-- Highlighting all retainer buttons as I'm sick of this bug! don't worry, only one 
			-- of buttons will show and only highlights visible buttons. If this doesn't work
			-- then must be a timing issue
			FETutorial.HighlightComponent(0,false,"button_show_retainer_popup","reward_entry0")	
			FETutorial.HighlightComponent(0,false,"button_show_retainer_popup","reward_entry1")	
			FETutorial.HighlightComponent(0,false,"button_show_retainer_popup","reward_entry2")	
			
			ChatBox():InterfaceFunction("AddAdvice", "7022_TUT_MP_Thread")
			COUNTER_MP_Advice = 22
		elseif conditions.IsComponentType("button_skill_tree", context) then
			FETutorial.HighlightComponent(1,false,"button_skill_tree","mp_postbattle")
			if COUNTER_MP_Advice == 12 then
				ChatBox():InterfaceFunction("AddAdvice", "7013_TUT_MP_Thread")
				COUNTER_MP_Advice = 13
			end
		elseif conditions.IsComponentType("button_upgrade", context) then	
			FETutorial.HighlightComponent(0,false,"button_upgrade","mp_army_management")	
			if COUNTER_MP_Advice == 38 then
				ChatBox():InterfaceFunction("AddAdvice", "7039_TUT_MP_Thread")
				COUNTER_MP_Advice = 39
			end
		elseif conditions.IsComponentType("skill_icon", context) then	
			if COUNTER_MP_Advice == 39 then	
				ChatBox():InterfaceFunction("AddAdvice", "7040_TUT_MP_Thread")
				COUNTER_MP_Advice = 40
			end
		elseif conditions.IsComponentType("tab_veterans", context) then	
			FETutorial.HighlightComponent(0,false,"tab_veterans","mp_army_management")	
			if COUNTER_MP_Advice == 46 then
				ChatBox():InterfaceFunction("AddAdvice", "7037_TUT_MP_Thread")
				COUNTER_MP_Advice = 37
			end
		end	
	end
end

-------------------------------------------------------------------------------------

function load_battle()	
	if BOOL_battle_1 == false then
		if BOOL_Nagato or BOOL_Musashi then
			FETutorial.SaveArmySize(3)
			m_current_menu:InterfaceFunction("SetTutorialBattle","sho_mp_boshin_gifu","bos_cb_jozai")	
		elseif BOOL_Satsuma or BOOL_Tosa or BOOL_Kai or BOOL_Iwate then
			FETutorial.SaveArmySize(3)
			m_current_menu:InterfaceFunction("SetTutorialBattle","sho_mp_rice_fields","takeda")	
		end
	elseif BOOL_battle_2 == false then
		if BOOL_Nagato or BOOL_Musashi then
			FETutorial.SaveArmySize(4)
			m_current_menu:InterfaceFunction("SetTutorialBattle","sho_mp_boshin_iwaki_foothills","bos_cb_aizu")	
		elseif BOOL_Satsuma or BOOL_Tosa or BOOL_Kai or BOOL_Iwate then
			FETutorial.SaveArmySize(4)
			m_current_menu:InterfaceFunction("SetTutorialBattle","sho_mp_forest_gully","hojo")	
		end
	elseif BOOL_battle_3 == false then
		out.ting("Loading Battle 3 Setup")
		if BOOL_Nagato or BOOL_Musashi then
			out.ting("Loading Battle 3 Boshin Setup")
			FETutorial.SaveArmySize(6)
			m_current_menu:InterfaceFunction("SetTutorialBattle","sho_mp_boshin_ridge_pass","bos_cb_nagaoka")	
		elseif BOOL_Satsuma or BOOL_Tosa or BOOL_Kai or BOOL_Iwate then
			out.ting("Loading Battle 3 Shogun Setup")
			FETutorial.SaveArmySize(6)
			m_current_menu:InterfaceFunction("SetTutorialBattle","sho_mp_oboke_gorge","date")	
		end
	end	 	
end

-------------------------------------------------------------------------------------

function OnArmyCreated(context)
	if FETutorial.is_tutorial_enabled() == true and BOOL_Tutorial_In_Progress == true then
		out.ting("TESTING 123"..context.string)
		if context.string == "army_saved" then
			out.ting("Army Saved !")
			if COUNTER_MP_Advice == 6 or COUNTER_MP_Advice == 7 then
				FETutorial.register_singleshot_timer("go_to_campaign_screen", 1000)
			end
		elseif context.string == "unit_added" then
			out.ting("User has added a unit !")
			if COUNTER_MP_Advice == 5 then
				ChatBox():InterfaceFunction("AddAdvice", "7006_TUT_MP_Thread")
				COUNTER_MP_Advice = 6
			end
		elseif context.string == "tut_host_failed" then
			out.ting("Failed to host the game, will be heading to army Management screen from here !")
			TransitionTo("mp_campaign_map")
			if COUNTER_MP_Advice == 10 or COUNTER_MP_Advice == 18 or COUNTER_MP_Advice == 31 then
				FETutorial.HighlightComponent(0,true,"button_ranked_battle","mp_campaign_map")	
				Hide_Game_Mode_Buttons()
				UIComponent(m_root:Find("button_avatar_general")):SetState("inactive")
				UIComponent(m_root:Find("button_army_management")):SetState("inactive")
				UIComponent(m_root:Find("button_profile")):SetState("inactive")
				UIComponent(m_root:Find("button_map")):SetState("inactive")
				UIComponent(m_root:Find("button_mp_clan")):SetState("inactive")
				UIComponent(m_root:Find("button_leaderboard")):SetState("inactive")
				local encyclopaedia = ParentFind("top_menu","button_encyclopaedia")
				encyclopaedia:SetState("inactive")
				UIComponent(m_root:Find("player_piece")):SetDisabled(true)
				local map = ParentFind("mp_campaign_map","map") 
				map:InterfaceFunction("toggle_battle_rewards",false)
				if COUNTER_MP_Advice == 31 then
					map:InterfaceFunction("toggle_vetran_drop",true)
				else
					map:InterfaceFunction("toggle_vetran_drop",false)
				end
			end
		end
		if context.string == "pb_player_won" then
			out.ting("Player Won Battle")
			BOOL_Player_Lost_Battle = false
		elseif context.string == "pb_player_lost" then
			out.ting("Player Lost Battle")
			BOOL_Player_Lost_Battle = true
		end	
		if context.string == "pb_show_unlocked_unit" then
			if (COUNTER_MP_Advice == 20 and BOOL_Player_Lost_Battle == false) then	
				ChatBox():InterfaceFunction("AddAdvice", "7052_TUT_MP_Thread")
			end
		end
		if context.string == "pb_show_vetrans" then
			out.ting("Post Battle Veteran")
			ChatBox():InterfaceFunction("AddAdvice", "7034_TUT_MP_Thread")
			UIComponent(m_root:Find("button_close_add_unit")):SetState("inactive")
			COUNTER_MP_Advice = 34
		elseif context.string == "pb_show_reward_buttons" then
			out.ting("Post Battle Summary")
			if (COUNTER_MP_Advice == 20 and BOOL_Player_Lost_Battle == false) then	
				out.ting("Highlight Popup Button")
				ChatBox():InterfaceFunction("AddAdvice", "7051_TUT_MP_Thread")
				
				-- Highlighting all retainer buttons as I'm sick of this bug! don't worry, only one 
				-- of buttons will show and only highlights visible buttons. If this doesn't work
				-- then must be a timing issue
				FETutorial.HighlightComponent(0,true,"button_show_retainer_popup","reward_entry0")	
				FETutorial.HighlightComponent(0,true,"button_show_retainer_popup","reward_entry1")	
				FETutorial.HighlightComponent(0,true,"button_show_retainer_popup","reward_entry2")	
			end
		end
	end
end

-------------------------------------------------------------------------------------

function Hide_Button_Ancillaries()
	UIComponent(m_root:Find("button_ancillaries")):SetVisible(false)
	UIComponent(m_root:Find("ancillary_card1")):SetState("locked")
	local AI_Slot_1 = ParentFind("alliance2","player1")
	local button_close = UIComponent(AI_Slot_1:Find("button_close"))
	button_close:SetState("inactive")
	if COUNTER_MP_Advice == 19 then
		UIComponent(m_root:Find("ancillary_card2")):SetState("locked")
	end
end

-------------------------------------------------------------------------------------

local been_to_battle_setup = false

function First_Post_Battle_Advice()
	if BOOL_Player_Lost_Battle == false then
		Hide_Back_Button()
		ChatBox():InterfaceFunction("AddAdvice", "7012_TUT_MP_Thread")
		COUNTER_MP_Advice = 12
	else
		ChatBox():InterfaceFunction("AddAdvice", "7021_TUT_MP_Thread")
		COUNTER_MP_Advice = 210
		BOOL_battle_1 = false
		FETutorial.SaveBool("BOOL_battle_1")	
	end
end

function Second_Post_Battle_Advice()
	if BOOL_Player_Lost_Battle == false then
		Hide_Back_Button()
		ChatBox():InterfaceFunction("AddAdvice", "7020_TUT_MP_Thread")
		COUNTER_MP_Advice = 20
	else
		ChatBox():InterfaceFunction("AddAdvice", "7021_TUT_MP_Thread")
		COUNTER_MP_Advice = 21
		BOOL_battle_2 = false
		FETutorial.SaveBool("BOOL_battle_2")
	end
end

function Third_Post_Battle_Advice()
	if BOOL_Player_Lost_Battle == false then
		Hide_Back_Button()
		ChatBox():InterfaceFunction("AddAdvice", "7033_TUT_MP_Thread")
		COUNTER_MP_Advice = 33
	else
		ChatBox():InterfaceFunction("AddAdvice", "7035_TUT_MP_Thread")
		COUNTER_MP_Advice = 35
		BOOL_battle_3 = false
		FETutorial.SaveBool("BOOL_battle_3")
	end
end

-------------------------------------------------------------------------------------

function UnHighlight_Armour_Set_Button()
	FETutorial.HighlightComponent(0,false,"button_armour_sets","mp_avatar_general")
end

function Highlight_Player_Navy()
	FETutorial.HighlightComponent(0,true,"player_navy","mp_campaign_map", true)
	FETutorial.register_singleshot_timer("UnHighlight_Player_Navy", 5000)		
end

function UnHighlight_Player_Navy()
	FETutorial.HighlightComponent(0,false,"player_navy","mp_campaign_map")	
end

function Highlight_Veteran_Tab()
	FETutorial.HighlightComponent(30,true,"tab_veterans","mp_army_management", true)	
end

function Highlight_Modify_Retainers_Button()
	FETutorial.HighlightComponent(0,true,"button_ancillaries","", true)	
	BOOL_Highlight_Ancillaries = true
	FETutorial.register_singleshot_timer("UnHighlight_Modify_Retainers_Button", 2500)
end

function UnHighlight_Modify_Retainers_Button()
	FETutorial.HighlightComponent(0,false,"button_ancillaries","", true)	
end

function Set_Button_Ready_Active()
	UIComponent(m_root:Find("button_ready")):SetVisible(true)
	UIComponent(m_root:Find("button_ready")):SetState("active")
end

function Setup_Veteran_Drop()
	local map = ParentFind("mp_campaign_map","map") 
	map:InterfaceFunction("toggle_vetran_drop",true)
	out.ting("Reward Veteran Unit")
	if BOOL_Nagato then
		out.ting("Reward Veteran Unit Red Bear")
		map:InterfaceFunction("award_vetran","Boshin_Inf_Line_Red_Bear_Infantry_MP")
	elseif BOOL_Musashi then
		out.ting("Reward Veteran Unit White Tiger Force")
		map:InterfaceFunction("award_vetran","Boshin_Inf_Line_White_Tiger_Force_MP")
	elseif BOOL_Satsuma then
		out.ting("Reward Veteran Unit Yari Samurai")
		map:InterfaceFunction("award_vetran","Inf_Spear_Yari_Samurai_MP")
	elseif BOOL_Tosa then
		out.ting("Reward Veteran Unit Bow Samurai")
		map:InterfaceFunction("award_vetran","Inf_Missile_Bow_Samurai_MP")
	elseif BOOL_Kai then
		out.ting("Reward Veteran Unit Yari Cavalry")
		map:InterfaceFunction("award_vetran","Cav_Spear_Yari_Cavalry_MP")
	elseif BOOL_Iwate then
		out.ting("Reward Veteran Unit Katana Samurai")
		map:InterfaceFunction("award_vetran","Inf_Sword_Katana_Samurai_MP")
	end	
end

-------------------------------------------------------------------------------------

function OnFrontEndScreenChange(context)
	m_current_menu = UIComponent(context.component)
	
	
	-- test script, remove me !
	--[[
	if m_current_menu:Id() == "historical_battles" then
		Start_HB_Advice(UIComponent(context.component), "Ueno")
		
		return
	end
	]]
	
	if FETutorial.is_tutorial_enabled() == true and FETUTORIALS_DONE == false then		
		if context.string == "main" then
			out.ting("-----------------------------------------------------------------------------------------")
		elseif context.string == "mp_army_management" then
			if COUNTER_MP_Advice == 3 or COUNTER_MP_Advice == 4 then
				ChatBox():InterfaceFunction("AddAdvice", "7005_TUT_MP_Thread")
				COUNTER_MP_Advice = 5	
				UIComponent(m_root:Find("button_fleets")):SetState("inactive")
				UIComponent(m_root:Find("tab_veterans")):SetVisible(false)
				UIComponent(m_root:Find("button_customize")):SetState("inactive")
				UnHighlight_Starting_Regions()
			elseif COUNTER_MP_Advice == 46 then
				UIComponent(m_root:Find("button_fleets")):SetState("inactive")
				FETutorial.register_singleshot_timer("Highlight_Veteran_Tab", 500)	
			end
		elseif context.string == "mp_campaign_map" then
			FETutorial.HighlightComponent(0,false,"button_back", "")
			FETutorial.HighlightComponent(0,false,"button_back", "back_button_component")
			if COUNTER_MP_Advice == 5 or COUNTER_MP_Advice == 6 or COUNTER_MP_Advice == 7 then
				Show_Home_Button()
				UIComponent(m_root:Find("player_piece")):SetDisabled(true)
				UIComponent(m_root:Find("player_navy")):SetVisible(false)
				FETutorial.HighlightComponent(1,false,"button_save", "")	
				ChatBox():InterfaceFunction("AddAdvice", "7008_TUT_MP_Thread")
				COUNTER_MP_Advice = 8	
				UIComponent(m_root:Find("button_ranked_battle")):SetState("inactive")
				Hide_Game_Mode_Buttons()	
				local map = ParentFind("mp_campaign_map","map") 
				map:InterfaceFunction("toggle_battle_rewards",false)
				map:InterfaceFunction("toggle_vetran_drop",false)
				map:InterfaceFunction("enable_xp_from_ai_battles", true)	
			elseif COUNTER_MP_Advice == 12 or COUNTER_MP_Advice == 13 then
				UIComponent(m_root:Find("button_ranked_battle")):SetState("inactive")
				Hide_Game_Mode_Buttons()
				Hide_All_Toolbar_Buttons()
				ChatBox():InterfaceFunction("AddAdvice", "7015_TUT_MP_Thread")
				COUNTER_MP_Advice = 15	
				if BOOL_Nagato then
					local map = ParentFind("mp_campaign_map","map") 
					map:InterfaceFunction("set_highlight_color",17,55,237)
					highlight_campaign_map_region("10_suo_boshin", 0)
					highlight_campaign_map_region("11_iwami_boshin", 0)
					highlight_campaign_map_region("4_tsukushi_boshin", 0)
					highlight_campaign_map_region("5_higo_boshin", 0)
				elseif	BOOL_Musashi then
					local map = ParentFind("mp_campaign_map","map") 
					map:InterfaceFunction("set_highlight_color",17,55,237)
					highlight_campaign_map_region("57_shimosa_boshin", 0)
					highlight_campaign_map_region("58_shimotsuke_boshin", 0)
					highlight_campaign_map_region("52_sagami_boshin", 0)
				elseif	BOOL_Satsuma then
					local map = ParentFind("mp_campaign_map","map") 
					map:InterfaceFunction("set_highlight_color",17,55,237)
					highlight_campaign_map_region("1_hizen", 0)
					highlight_campaign_map_region("6_hyuga", 0)
					highlight_campaign_map_region("9_nagato", 0)				
				elseif	BOOL_Tosa then
					local map = ParentFind("mp_campaign_map","map") 
					map:InterfaceFunction("set_highlight_color",17,55,237)
					highlight_campaign_map_region("6_hyuga", 0)
					highlight_campaign_map_region("13_iyo", 0)
				elseif	BOOL_Kai then
					local map = ParentFind("mp_campaign_map","map") 
					map:InterfaceFunction("set_highlight_color",17,55,237)
					highlight_campaign_map_region("50_suruga", 0)
					highlight_campaign_map_region("46_south_shinano", 0)
					highlight_campaign_map_region("54_kozuke", 0)
					highlight_campaign_map_region("55_musashi", 0)
					highlight_campaign_map_region("52_sagami", 0)			
				elseif	BOOL_Iwate then
					local map = ParentFind("mp_campaign_map","map") 
					map:InterfaceFunction("set_highlight_color",17,55,237)
					highlight_campaign_map_region("62_uzen", 0)	
				end
			elseif COUNTER_MP_Advice == 20 or COUNTER_MP_Advice == 22 or COUNTER_MP_Advice == 23 then	
				out.ting("Get ready to highlight avatar toolbar button")
				UIComponent(m_root:Find("button_ranked_battle")):SetState("inactive")
				Hide_Game_Mode_Buttons()	
				UIComponent(m_root:Find("button_change_avatar")):SetState("inactive")
				UIComponent(m_root:Find("button_army_management")):SetState("inactive")
				UIComponent(m_root:Find("button_profile")):SetState("inactive")
				UIComponent(m_root:Find("button_map")):SetState("inactive")
				UIComponent(m_root:Find("button_mp_clan")):SetState("inactive")
				UIComponent(m_root:Find("button_leaderboard")):SetState("inactive")
				local encyclopaedia = ParentFind("top_menu","button_encyclopaedia")
				encyclopaedia:SetState("inactive")
				ChatBox():InterfaceFunction("AddAdvice", "7024_TUT_MP_Thread")
				COUNTER_MP_Advice = 24
				UIComponent(m_root:Find("player_piece")):SetDisabled(true)
			elseif COUNTER_MP_Advice == 21 or COUNTER_MP_Advice == 34 or COUNTER_MP_Advice == 35 or COUNTER_MP_Advice == 210 then
				if BOOL_Player_Lost_Battle then
					BOOL_Player_Lost_Battle = false
					FETutorial.HighlightComponent(0,true,"button_ranked_battle","mp_campaign_map")	
					Hide_Game_Mode_Buttons()
					UIComponent(m_root:Find("button_avatar_general")):SetState("inactive")
					UIComponent(m_root:Find("button_change_avatar")):SetState("inactive")
					UIComponent(m_root:Find("button_army_management")):SetState("inactive")
					UIComponent(m_root:Find("button_profile")):SetState("inactive")
					UIComponent(m_root:Find("button_map")):SetState("inactive")
					UIComponent(m_root:Find("button_mp_clan")):SetState("inactive")
					UIComponent(m_root:Find("button_leaderboard")):SetState("inactive")
					local encyclopaedia = ParentFind("top_menu","button_encyclopaedia")
					encyclopaedia:SetState("inactive")
					UIComponent(m_root:Find("player_piece")):SetDisabled(true)
					if COUNTER_MP_Advice == 35 then
						Setup_Veteran_Drop()
					else
						local map = ParentFind("mp_campaign_map","map") 						
						map:InterfaceFunction("toggle_vetran_drop",false)
					end				
				elseif BOOL_Player_Lost_Battle == false then
					if COUNTER_MP_Advice == 34 then
						UIComponent(m_root:Find("button_ranked_battle")):SetState("inactive")
						Hide_Game_Mode_Buttons()	
						UIComponent(m_root:Find("button_avatar_general")):SetState("inactive")
						UIComponent(m_root:Find("button_change_avatar")):SetState("inactive")
						UIComponent(m_root:Find("button_profile")):SetState("inactive")
						UIComponent(m_root:Find("button_map")):SetState("inactive")
						UIComponent(m_root:Find("button_mp_clan")):SetState("inactive")
						UIComponent(m_root:Find("button_leaderboard")):SetState("inactive")
						local encyclopaedia = ParentFind("top_menu","button_encyclopaedia")
						encyclopaedia:SetState("inactive")	
						UIComponent(m_root:Find("player_piece")):SetDisabled(true)
						ChatBox():InterfaceFunction("AddAdvice", "7036_TUT_MP_Thread")
						COUNTER_MP_Advice = 36
					end	
				end
			elseif COUNTER_MP_Advice == 25 or COUNTER_MP_Advice == 26 or COUNTER_MP_Advice == 27 or COUNTER_MP_Advice == 28 then
				UIComponent(m_root:Find("button_ranked_battle")):SetState("inactive")
				UIComponent(m_root:Find("button_avatar_general")):SetState("inactive")
				UIComponent(m_root:Find("button_map")):SetState("inactive")
				ChatBox():InterfaceFunction("AddAdvice", "7029_TUT_MP_Thread")
				COUNTER_MP_Advice = 29	
				Hide_Game_Mode_Buttons()
				Setup_Veteran_Drop()
				if BOOL_Nagato then
					local map = ParentFind("mp_campaign_map","map") 
					map:InterfaceFunction("set_highlight_color",17,55,237)
					highlight_campaign_map_region("1_hizen_boshin", 0)
					highlight_campaign_map_region("68_nagasaki_boshin", 0)
					highlight_campaign_map_region("2_satsuma_boshin", 0)
					if BOOL_Highlight_Iwami_Suo then
						highlight_campaign_map_region("12_aki_boshin", 0)
					elseif BOOL_Highlight_Higo then
						highlight_campaign_map_region("8_bungo_boshin", 0)
					end				
				elseif	BOOL_Musashi then
					local map = ParentFind("mp_campaign_map","map") 
					map:InterfaceFunction("set_highlight_color",17,55,237)
					highlight_campaign_map_region("56_kazusa_boshin", 0)
					highlight_campaign_map_region("49_kai_boshin", 0)
					highlight_campaign_map_region("61_fukushima_boshin", 0)
					if BOOL_Highlight_Sagami then
						highlight_campaign_map_region("51_izu_boshin", 0)				
					end
				elseif	BOOL_Satsuma then
					local map = ParentFind("mp_campaign_map","map") 
					map:InterfaceFunction("set_highlight_color",17,55,237)
					highlight_campaign_map_region("5_higo", 0)
					highlight_campaign_map_region("4_tsukushi", 0)
					highlight_campaign_map_region("7_buzen", 0)
					if BOOL_Highlight_Nagato then
						highlight_campaign_map_region("11_iwami", 0)
						highlight_campaign_map_region("10_suo", 0)
					end
				elseif	BOOL_Tosa then
					local map = ParentFind("mp_campaign_map","map") 
					map:InterfaceFunction("set_highlight_color",17,55,237)
					highlight_campaign_map_region("20_awa", 0)
					highlight_campaign_map_region("2_satsuma", 0)
					if BOOL_Highlight_Hyuga then
						highlight_campaign_map_region("5_higo", 0)
					end
				elseif	BOOL_Kai then
					local map = ParentFind("mp_campaign_map","map") 
					map:InterfaceFunction("set_highlight_color",17,55,237)
					highlight_campaign_map_region("48_north_shinano", 0)
					if BOOL_Highlight_Sagami then
						highlight_campaign_map_region("51_izu", 0)
					elseif BOOL_Highlight_Suruga then
						highlight_campaign_map_region("51_izu", 0)
						highlight_campaign_map_region("47_totomi", 0)
					elseif BOOL_Highlight_South_Shinano then
						highlight_campaign_map_region("47_totomi", 0)
						highlight_campaign_map_region("41_mikawa", 0)
					elseif BOOL_Highlight_Kozuke then
						highlight_campaign_map_region("53_echigo", 0)
					end					
				elseif	BOOL_Iwate then
					local map = ParentFind("mp_campaign_map","map") 
					map:InterfaceFunction("set_highlight_color",17,55,237)
					highlight_campaign_map_region("63_miyagi", 0)
					highlight_campaign_map_region("64_ugo", 0)
					highlight_campaign_map_region("61_fukushima", 0)
					highlight_campaign_map_region("53_echigo", 0)
				end
			elseif COUNTER_MP_Advice == 37 or COUNTER_MP_Advice == 38 or COUNTER_MP_Advice == 39 or COUNTER_MP_Advice == 40 or COUNTER_MP_Advice == 41 then	
				UIComponent(m_root:Find("button_army_management")):SetState("inactive")
				UIComponent(m_root:Find("button_map")):SetState("inactive")
				UIComponent(m_root:Find("button_ranked_battle")):SetState("inactive")
				UIComponent(m_root:Find("player_navy")):SetVisible(true)
				UIComponent(m_root:Find("button_clan_competition")):SetVisible(false)	
				UIComponent(m_root:Find("clan_group")):SetVisible(false)
				UIComponent(m_root:Find("button_team_setup")):SetVisible(false)
				UIComponent(m_root:Find("button_games_list")):SetVisible(false)	
				ChatBox():InterfaceFunction("AddAdvice", "7042_TUT_MP_Thread")
				COUNTER_MP_Advice = 42
				FETutorial.register_singleshot_timer("Highlight_Player_Navy", 4000)		
			end
		elseif context.string == "mp_battle_setup" then
			if COUNTER_MP_Advice == 10 then
				ChatBox():InterfaceFunction("AddAdvice", "7011_TUT_MP_Thread")
				COUNTER_MP_Advice = 11	
				FETutorial.register_singleshot_timer("Hide_Button_Ancillaries", 500)	
				FETutorial.register_singleshot_timer("Hide_AI_Slot", 1000)	
				UIComponent(m_root:Find("button_ready")):SetVisible(false)
				UIComponent(m_root:Find("button_ready")):SetState("inactive")
				FETutorial.register_singleshot_timer("Set_Button_Ready_Active", 2500)	
			elseif COUNTER_MP_Advice == 18 then
				ChatBox():InterfaceFunction("AddAdvice", "7019_TUT_MP_Thread")
				COUNTER_MP_Advice = 19	
				FETutorial.register_singleshot_timer("Hide_Button_Ancillaries", 500)
				FETutorial.register_singleshot_timer("Hide_AI_Slot", 1000)	
				UIComponent(m_root:Find("button_ready")):SetVisible(false)
				UIComponent(m_root:Find("button_ready")):SetState("inactive")
				FETutorial.register_singleshot_timer("Set_Button_Ready_Active", 2500)	
			elseif COUNTER_MP_Advice == 31 then	
				ChatBox():InterfaceFunction("AddAdvice", "7032_TUT_MP_Thread")
				COUNTER_MP_Advice = 32	
				FETutorial.register_singleshot_timer("Hide_AI_Slot", 1000)	
				FETutorial.register_singleshot_timer("Highlight_Modify_Retainers_Button", 5000)	
				UIComponent(m_root:Find("button_ready")):SetVisible(false)
				UIComponent(m_root:Find("button_ready")):SetState("inactive")
				FETutorial.register_singleshot_timer("Set_Button_Ready_Active", 2500)	
			end
		end
		out.ting(" Current Layout : "..context.string.." - -- -"..m_current_menu:Id())
		out.ting(bool_can_start_battle)
		if bool_can_start_battle == true then
			if context.string == "mp_games_list" and BOOL_battle_1 == false then
				out.ting("Going for First Battle !")			
				BOOL_battle_1 = true
				FETutorial.SaveBool("BOOL_battle_1")	
				bool_can_start_battle = false
			elseif context.string == "mp_games_list" and BOOL_battle_2 == false then
				out.ting("Going for Second Battle !")			
				BOOL_battle_2 = true
				FETutorial.SaveBool("BOOL_battle_2")	
				bool_can_start_battle = false
			elseif context.string == "mp_games_list" and BOOL_battle_3 == false then
				out.ting("Going for Third Battle !")			
				BOOL_battle_3 = true
				FETutorial.SaveBool("BOOL_battle_3")	
				bool_can_start_battle = false
			end
		end
		out.ting(" End of ---=-=-=-=-=-==-=-==-=-=--=--=-=-=-")
		-- When we begin to host battle disable the consequent once,since this layout will be called while comming back from battle.
		-- Once we come 	
		if context.string == "mp_postbattle" and BOOL_battle_1 == true and BOOL_battle_2 == false then		
			bool_reset_in_campaign_map = true
			out.ting("In Post battle of First Battle, Enabling the Seond one. !")
			FETutorial.register_singleshot_timer("First_Post_Battle_Advice", 500)
		elseif context.string == "mp_postbattle" and BOOL_battle_2 == true and BOOL_battle_3 == false then
			out.ting("In Post battle of Second Battle, Enabling the Third one. !")		
			bool_reset_in_campaign_map = true
			if COUNTER_MP_Advice == 19 then
				FETutorial.register_singleshot_timer("Second_Post_Battle_Advice", 500)
			end
		elseif context.string == "mp_postbattle" and BOOL_battle_3 == true then
			out.ting("In Post battle of Third Battle, Good place to mark Tutorial Finished !")		
			bool_reset_in_campaign_map = true
			if COUNTER_MP_Advice == 32 then
				FETutorial.register_singleshot_timer("Third_Post_Battle_Advice", 500)
			end
		end
		if bool_reset_in_campaign_map == true then
			if context.string == "mp_campaign_map"then
				bool_can_start_battle = true
				bool_reset_in_campaign_map = false
			elseif context.string == "mp_battle_setup" then
				--  We have come back to Battle Setup From PostBattle
				been_to_battle_setup = true
				m_current_menu:InterfaceFunction("ClearCurrentGame") 
				TransitionBack()			
			elseif context.string == "mp_games_list" and been_to_battle_setup == true then
				--  We have come back to Games List From BattleSetup.
				been_to_battle_setup = false
				TransitionBack()
			end
		else 
			if context.string == "mp_battle_setup" then	
				FETutorial.register_singleshot_timer("load_battle", 2000)		
			end			
		end
	end	
end

-------------------------------------------------------------------------------------
-- For Steve, Historic battle things handeled here !
function OnHistoricBattleEvent(context)
	out.ting("HIS:"..context.string)	
	if context.string == "battle_won" then
		-- Player is victorious, post-battle, but not yet back at the historic battle frontend
		out.ting("2.HIS: we have won the battle "..m_last_historic_battle)		
		b_won_last_battle = true
	elseif context.string == "battle_lost" then
		-- Player is defeated, post-battle, but not yet back at the historic battle frontend
		b_won_last_battle = false
		out.ting("2.HIS: we have lost the battle "..m_last_historic_battle)
	elseif context.string == "enter_historic" then
		-- Player is now back at the historic battle frontend, test b_won_last_battle to determine the last result
		if b_won_last_battle == true then
			
			-- kick off the advice sequences
			Start_HB_Advice(UIComponent(context.component), m_last_historic_battle)
			

			b_animation_started = true
		end
		b_won_last_battle = false
	elseif context.string == "animation_ended" then
		 --  Not sure if this event is required, but if we want to do anthing once some animation has ended then here, assuming that animation name will be same as the last_battle_fought name!
		 out.ting("HIS: animation ended .. "..m_last_historic_battle)
		 b_animation_started = false
	elseif context.string == "hist_cancel_sequence" and BOOL_HB_Sequence_In_Progress == true then
		-- we have cancelled the sequence !
		--1. Need to stop the animations that re playing, atleast revert the UI status and hide the animations that are playing.
		out.ting("trying to cancel the hist sequence")
		Historic_Battle_UIC = UIComponent(context.component)
		revert_UI_from_historic_sequence()
	else
		-- If it is not battle won/loss then it is the key for that battle that was last fought !		
		m_last_historic_battle = context.string
		out.ting("1.HIS: battle is starting..based on the result of the battle will be next point..name of the battle is.. "..m_last_historic_battle)
		b_won_last_battle = false
		b_animation_started = false
	end
end

AddEventCallBack("ComponentLClickUp", OnComponentLClickUp)
AddEventCallBack("UICreated", OnUICreated)
AddEventCallBack("StartRegionSelected", OnStartRegionSelected)
AddEventCallBack("MapIconMoved", OnMapIconMoved)
AddEventCallBack("MPLobbyChatCreated", OnMPChatLobbyCreated)
AddEventCallBack("AdviceFinishedTrigger", OnAdviceFinished)
AddEventCallBack("StartRegionPopupVisible", OnStartRegionPopup)
AddEventCallBack("FirstArmyCreated", OnArmyCreated)
AddEventCallBack("FrontEndScreenChange", OnFrontEndScreenChange)
AddEventCallBack("HistoricBattleEvent", OnHistoricBattleEvent)
