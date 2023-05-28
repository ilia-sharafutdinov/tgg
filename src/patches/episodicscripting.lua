-- Set up the "include" paths
package.path = ";?.lua;data/ui/templates/?.lua;data/ui/?.lua"

-- Declare this file as an "exportable" module
module(..., package.seeall)

-- Import the events table so we can add callbacks for each game event
local core = require "CoreUtils"
local events = core.Require "data.events"
local message_handler = core.Require "message_handler"

out.ting("loading episodic scripting")

--------------------------------------------------------------------------------------------------------------------
-- Local variables - these are essentially private data

-- Declare the interface to the AI module specified in EpisodicScriptingEnv.cpp
game_interface = nil
local m_hidden_components = {}
local m_root = nil
local m_campaign = nil
local m_saved_state = nil
local m_user_defined_event_callbacks = {}
local m_in_campaign = false

-- A list of components which should currently be highlighted.
local m_highlighted_components			= {}
local m_highlighted_construction_items	= {}
local m_highlighted_recruitment_items	= {}

-- Modders don't have to follow this format, this isn't necessarily the best way of going about things, it's just an option we choose
-- Define feature sets and components that are disabled/hidden by default at the start of the campaign

local m_starting_configuration =	{
										["episodic_1"] = 
										{
											["Features"]			= { "disable_elections", "show_shroud_1_1", "show_shroud_1_2", "show_shroud_1_3", "spawn_port" },
											["Hidden"]				= { "button_tech", "build_browser", "button_diplomacy", "button_lists", "faction_hud_flags", "ornate back", "button_government",
																		"army_fort", "army_disband", "army_promote",
																		"radar arrow L", "radar arrow R", "globe" },
											["Disabled"]			= { },
											["Building"]			= { "corn_tenanted_farms", "shipyard", "trading_port", "minor_governors_residence", "settlement_fortifications", "fishing_fleet", "large_tobacco_plantation", "large_cotton_plantation" },
											["Unit"]				= { },
											["Intro_movie"]			= "movies\\RTI_CS2_V01_Bink_Sound.bik",
											["Battlefield"]			= { {-535.585, 293.602, 8, "BattleTerrain\\presets\\RTI_Ambush_2\\", false},
																		{-539.807, 272.635, 2.3, "BattleTerrain\\presets\\RTI_Indian_Village_1\\", true},
																		{-541.575, 295.643, 2.3, "BattleTerrain\\presets\\RTI_Indian_Village_2\\", true} },
											["Exclusion_zone"]		= { },
											["Visibility_trigger"]	= { },
											["Location_trigger"]	= { {-546, 290, 4, "virginia_colonists"} },
											["Settlement_override"]	= { {"settlement:virginia:williamsburg", "JT_city_1_slot_together"}	},
											["Building_override"]	= { {"settlement:virginia:williamsburg:settlement_minor", "minor_magistrate", ""},
																		{"corn:virginia:north", "corn_peasant_farms", "Ep1_city_farm_corn"},
																		{"southern_usa:virginia:central", "small_cotton_plantation", "Ep1_city_plantation_cotton"},
																		{"southern_usa:virginia:central", "small_tobacco_plantation", "Ep1_city_plantation_tobacco"},
																		{"port:virginia:yorktown", "local_fishery", "Ep1_port_fishery"}	}
										},
										["episodic_3"] = 
										{
											["Features"]			= { "disable_elections", "government", "show_shroud_2_1", "show_shroud_2_2", "show_shroud_2_3", "list", "unlockable_natives" },
											["Hidden"]				= { "button_government", "ornate back", "button_lists",
																		"button_tech", "build_browser", "faction_hud_flags",
																		"army_fort",
																		"radar arrow L", "radar arrow R", "globe" },
											["Disabled"]			= { },
											["Building"]			= { "corn_tenanted_farms", "large_tobacco_plantation", "settlement_fortifications", "minor_governors_palace", "trading_port", "minor_governors_encampment", "major_fishery", "drydock", "improved_settlement_fortifications", "fur_exchange", "western_artillery_fort", "large_cotton_plantation" },
											["Unit"]				= { "sloop" },
											["Intro_movie"]			= "movies\\RTI_CS3_V01_Bink_Sound.bik",
											["Battlefield"]			= { {-549.145, 292.321, 2.3, "BattleTerrain\\presets\\RTI_Ambush_4\\", false},
																		{-549.894, 307.086, 2.3, "BattleTerrain\\presets\\RTI_Fort_1\\", true},
																		{-563.431, 289.506, 2.3, "BattleTerrain\\presets\\RTI_Fort_2\\", true},
																		{-541.857, 316.648, 4.3, "BattleTerrain\\presets\\RTI_Fort_3\\", true},
																		{-458.897, 324.525, 2.3, "BattleTerrain\\presets\\RTI_Fort_4\\", true},
																		{-557.553, 307.292, 2.3, "BattleTerrain\\presets\\RTI_Fort_5\\", true},
																		{-428.576, 327.603, 2.3, "BattleTerrain\\presets\\RTI_Fort_6\\", true},
																		{-505.902, 336.276, 2.3, "BattleTerrain\\presets\\RTI_Fort_7\\", true},
																		{-523.721, 325.998, 2.3, "BattleTerrain\\presets\\RTI_Fort_8\\", true},
																		{-512.922, 332.889, 2.3, "BattleTerrain\\presets\\RTI_Fort_9\\", true} },

											["Exclusion_zone"]		= { { -553, 298, -550, 295, true, true, true, "france" } },
											["Visibility_trigger"]	= { },
											["Location_trigger"]	= { {-564, 289, 8, "virginia"}, {-449.57, 326.78, 36, "virginia"} },
											["Settlement_override"]	= { },
											["Building_override"]	= { }
										},
										["episodic_5"] =
										{
											["Features"]			= { "disable_elections", "start_of_ep5" },
											["Hidden"]				= { "radar arrow L", "radar arrow R", "globe"},
											["Disabled"]			= { },
											["Building"]			= { },
											["Unit"]				= { "dhow", "indiaman", "lugger" },
											["Intro_movie"]			= "movies\\RTI_CS5_V04_Bink_Sound.bik",
											["Battlefield"]			= { },
											["Exclusion_zone"]		= { },
											["Visibility_trigger"]	= { },
											["Location_trigger"]	= { },
											["Settlement_override"]	= { },
											["Building_override"]	= { }
										},							 
										["natives"] =
										{
											["Features"]			= { "use_regular_advice" },
											["Hidden"]				= { "army_fort", "radar arrow L", "radar arrow R", "globe"},
											["Disabled"]			= { },
											["Building"]			= { },
											["Unit"]				= { },
											["Intro_movie"]			= "",
											["Battlefield"]			= { },
											["Exclusion_zone"]		= { },
											["Visibility_trigger"]	= { },
											["Location_trigger"]	= { },
											["Settlement_override"]	= { },
											["Building_override"]	= { }
										},		
									}							 
									  
--------------------------------------------------------------------------------------------------------------------
-- Local functions 
--------------------------------------------------------------------------------------------------------------------

-- Hide a component by divorcing it from it's parent
local function HideComponent(id)
	local c = m_root:Find(id)
	local p = UIComponent(c):Parent()
	UIComponent(c):SetDisabled(true)
	m_hidden_components[id] = { ["Component"] = c,
						        ["Parent"]    = p,
							    ["Index"]	  = UIComponent(p):Divorce(c)
						   }
end

-- Reveal a component by getting it's original parent to re-adopt it.
-- This relies on the parent not ever being deleted, and the index remaining valid, otherwise things can go wrong
local function RevealComponent(id)
	local details = m_hidden_components[id]
	
	if details ~= nil then
		out.ting("Revealing " .. id)
		UIComponent(details.Parent):Adopt(details.Component, details.Index)	
		
		-- Run the components script as if it was removed from UI tree at startup then it won't have had it's script run
		UIComponent(details.Component):SetDisabled(false)
		UIComponent(details.Component):RunScript()
		-- Clear the table entry
		m_hidden_components[id] = nil
	else
		out.ting("RevealComponent cannot find " .. id)
	end
end

local function EnableComponent(id, enable)
	local c = UIComponent(m_root:Find(id))
	if enable then
		-- Cope with the pre-unification of button state naming conventions
		if c:SetState("normal") or c:SetState("Unselected") or c:SetState("up") then end
	else
		c:SetState("inactive")
		-- c:SetInteractive(false)
	end
end

events.HudRefresh[#events.HudRefresh+1] =
function ()
	out.ting("HUD refresh")

	for s,v in pairs( m_highlighted_components ) do
	
		local component_addr = m_root:Find( v )

		if component_addr ~= nil then

			local component = UIComponent( component_addr )
	
			component:Highlight( true )
		
		end
	
	end

	for s,v in pairs( m_highlighted_construction_items ) do

		CampaignUI.HighlightConstructionItem( v, true )
	
	end

	for s,v in pairs( m_highlighted_recruitment_items ) do

		CampaignUI.HighlightRecruitmentItem( v, true )
	
	end

end

-- Shane updated this to keep a history of the highlighted items so that when the HUD is reconstructed at any point 
-- it can reinstate any highlighting using the above funtion.
-- The event to listen for is HUD_REFRESH_EVENT.
function HighlightComponent( id, enable )

	local component_addr = m_root:Find( id )

	assert( component_addr ~= nil )

	if component_addr ~= nil then

		local component = UIComponent( component_addr )

		if enable == true then
		
			m_highlighted_components[ id ] = id
			
		else
		
			m_highlighted_components[ id ] = nil
			
		end
			
		component:Highlight( enable )

	else
		out.ting("HighlightComponent cannot find " .. id)
	end

end

function HighlightConstructionItem( building_key, enable )

	if enable == true then
	
		m_highlighted_construction_items[ building_key ] = building_key
		
	else
	
		m_highlighted_construction_items[ building_key ] = nil
		
	end

	CampaignUI.HighlightConstructionItem( building_key, enable )

end

function HighlightRecruitmentItem( unit_key, enable )

	if enable == true then

		m_highlighted_recruitment_items[ unit_key ] = unit_key

	else

		m_highlighted_recruitment_items[ unit_key ] = nil

	end
	
	CampaignUI.HighlightRecruitmentItem( unit_key, enable )

end

function ShowHUD(show)
	UIComponent(m_root:Find("veneer_DY")):SetVisible(show)
	message_handler.HideAllMessages(not show)
end

-- Go through all the hidden components we have and test if they have a parent
-- If they haven't then they won't get deleted when the UI tree is destroyed, so delete it now
local function OnDestroyed()
	if m_in_campaign then
		out.ting("exiting campaign, saving heirarchy")
		m_saved_state = m_root:SaveUIHeirarchy()
		
		for k, v in pairs(m_hidden_components) do
			if UIComponent(v.Component):Parent(false) == nil then
				Component.Destroy(v.Component, true)
			end
		end
	else
		out.ting("exiting non-campaign")
	end
	
	for k, v in pairs(m_hidden_components) do
		out.ting(k)
	end

	m_root = nil
	m_hidden_components = {}
	ClearMessageAutoShowOverrides()
end

--------------------------------------------------------------------------------------------------------------------
-- Define the feature set.  This has to be after the local function declarations as we call some of the functions
-- If these functions get too bloated then they can be explicitly declared in the local function section, it's just
-- that I like anonymous functions :)
--------------------------------------------------------------------------------------------------------------------

local m_features = { 
	-- This declares an anymous function that we can use to reveal various components
	["disable_elections"] = {
		["Enable"] = function()		end,
		["Disable"] = function()
			game_interface:disable_elections(true)
		end
		},
		
	["show_shroud_1_1"] = {
		["Enable"] = function()	
			game_interface:unveil_black_shroud("shroud_map_1_1")
			game_interface:set_map_bounds(-567, 281, -540, 256)
			game_interface:disable_shopping_for_ai_under_shroud(true)
		end,
		["Disable"] = function()
			ShowHUD(false)
		end,
		},
		
	["show_shroud_1_2"] = {
		["Enable"] = function()
			game_interface:remove_barrier("shroud_map_1_1")
			game_interface:unveil_black_shroud("shroud_map_1_2")
			game_interface:set_map_bounds(-567, 281, -533, 257)
		end,
		["Disable"] = function()	end
		},
		
	["show_shroud_1_3"] = {
		["Enable"] = function()
			game_interface:remove_barrier("shroud_map_1_2")
			game_interface:unveil_black_shroud("shroud_map_1_3")
			game_interface:set_map_bounds(-564, 294, -528, 256)
			game_interface:disable_shopping_for_ai_under_shroud(false)
		end,
		["Disable"] = function()	end
		},
		
	["show_shroud_2_1"] = {
		["Enable"] = function()
			game_interface:unveil_black_shroud("shroud_map_2_1")
			game_interface:set_map_bounds(-579, 306, -533, 259)
			game_interface:disable_shopping_for_ai_under_shroud(true)
		end,
		["Disable"] = function()
			ShowHUD(false)
		end,
		},
		
	["show_shroud_2_2"] = {
		["Enable"] = function()
			game_interface:remove_barrier("shroud_map_2_1")
			game_interface:unveil_black_shroud("shroud_map_2_2")
			game_interface:set_map_bounds(-579, 409, -351, 257)
		end,
		["Disable"] = function()	end
		},
		
	["show_shroud_2_3"] = {
		["Enable"] = function()
			game_interface:remove_barrier("shroud_map_2_2")
			game_interface:unveil_black_shroud("shroud_map_2_3")
			game_interface:set_map_bounds(-614, 409, -353, 257)
			game_interface:disable_shopping_for_ai_under_shroud(false)
		end,
		["Disable"] = function()	end
		},

	["start_of_ep5"] = {
		["Enable"] = function()		end,
		["Disable"] = function()
			ShowHUD(false)
			game_interface:set_zoom_limit(1.08, 0.02)
			CampaignUI.SetCameraZoom(1.04)
			CampaignUI.SetCameraTarget(-513.123, 301.675)
			game_interface:set_map_bounds(-779, 481, -323, -21) 
			game_interface:show_shroud(false)
			game_interface:enable_auto_generated_missions(true)
		end,
		},

	["government"] = {
		["Enable"] = function()
			RevealComponent("button_government")
			RevealComponent("ornate back")
			RevealComponent("faction_hud_flags")
		end,
		["Disable"] = function()	end
		},
		
	["list"] = {
		["Enable"] = function()
			RevealComponent("button_lists")
		end,
		["Disable"] = function()	end
		},

	["Hide_excess_on_government_screen"] = {
		["Enable"] = function()
			-- use visible flag instead of HideComponent to keep the uicomponent in the heirarchy
			-- scripts are called when switching tabs, the components in that script can only be hidden
			UIComponent(m_root:Find("tab_ministers")):SetVisible(false)
			UIComponent(m_root:Find("administration")):SetVisible(false)
			HideComponent("victory")
			HideComponent("arrow R")
			HideComponent("arrow L")
		end,
		["Disable"] = function()	end
		},

	["Hide_taxes_and_ministers_on_government_screen"] = {
		["Enable"] = function()
			UIComponent(m_root:Find("tab_taxes")):SetVisible(false)
			UIComponent(m_root:Find("tab_ministers")):SetVisible(false)
		end,
		["Disable"] = function()	end
		},

	["Hide_arrows_on_government_screen"] = {
		["Enable"] = function()
			UIComponent(m_root:Find("info_box")):SetVisible(false)
			HideComponent("arrow R")
			HideComponent("arrow L")
		end,
		["Disable"] = function()	end
		},

	["Hide_excess_on_region_details"] = {
		["Enable"] = function()
			-- again set invisible instead of Hide
			UIComponent(m_root:Find("Public order panel layout")):SetVisible(false)
			UIComponent(m_root:Find("tax_panel")):SetVisible(false)
			UIComponent(m_root:Find("tx_turns_until...")):SetVisible(false)
		end,
		["Disable"] = function()	end
		},
		
	["Hide_tax_on_region_details"] = {
		["Enable"] = function()
			HideComponent("taxes_checkbox")
			HideComponent("button_taxes")
		end,
		["Disable"] = function()	end
		},
		
	["Hide_pop_on_region_details"] = {
		["Enable"] = function()
			UIComponent(m_root:Find("tx_turns_until...")):SetVisible(false)
		end,
		["Disable"] = function()	end
		},
		
	["Hide_excess_on_review_panel"] = {
		["Enable"] = function()
			local tab = m_root:Find("infrastructure_tab", false)
			if tab ~= nil then
				UIComponent(tab):SetVisible(false)
			end
			out.ting("build_demolish")
			UIComponent(m_root:Find("build_demolish")):SetVisible(false)
			UIComponent(m_root:Find("build_demolish")):SetDisabled(true)
		end,
		["Disable"] = function()	end
		},
		
	["Hide_infrastructure_tab_review_panel"] = {
		["Enable"] = function()
			local tab = m_root:Find("infrastructure_tab", false)
			if tab ~= nil then
				UIComponent(tab):SetVisible(false)
			end
		end,
		["Disable"] = function()	end
		},

	["Hide_excess_on_mission_panel"] = {
		["Enable"] = function()
			UIComponent(m_root:Find("tab_victory_conditions")):SetVisible(false)
			UIComponent(m_root:Find("tab_victory_conditions")):SetDisabled(true)
			UIComponent(m_root:Find("tab_prestige")):SetVisible(false)
			UIComponent(m_root:Find("tab_prestige")):SetDisabled(true)
		end,
		["Disable"] = function()	end
		},
		
	["Hide_prestige_on_mission_panel"] = {
		["Enable"] = function()
			UIComponent(m_root:Find("tab_prestige")):SetVisible(false)
			UIComponent(m_root:Find("tab_prestige")):SetDisabled(true)
		end,
		["Disable"] = function()	end
		},

	["unlockable_natives"] = {
		["Enable"] = function()
			game_interface:remove_restricted_unit_record("episodic_2_native_american_musketeer_auxiliary")
		end,
		["Disable"] = function()
			game_interface:add_restricted_unit_record("episodic_2_native_american_musketeer_auxiliary")
		end
		},

	["spawn_port"] = {
		["Enable"] = function()
			OverrideMessageAutoShow("new_port_emerges", true)
			game_interface:spawn_town_level("virginia", 1, true)
		end,
		["Disable"] = function()
			game_interface:disable_town_spawning(true)
		end
		},
		
	["disable_end_turn"] = {
		["Enable"] = function()
			out.ting("End turn disabled")
			UIComponent(m_root:Find("button_end_turn")):SetVisible(false)
		end,
		["Disable"] = function()
			out.ting("End turn re-enabled")
			UIComponent(m_root:Find("button_end_turn")):SetVisible(true)
		end
		},
		
	["Hide_fleet_on_list_panel"] = {
		["Enable"] = function()
			UIComponent(m_root:Find("fleets")):SetVisible(false)
			UIComponent(m_root:Find("fleets")):SetDisabled(true)
		end,
		["Disable"] = function()	end
		},

	["use_regular_advice"] = {
		["Enable"] = function()		end,
		["Disable"] = function()
			effect.suspend_contextual_advice(false)
		end
		}
	}

local function OnNewSession(context)
	out.ting("creating new game interface")
	game_interface = GAME(context)
end

local function OnWorldCreated(context)
	if game_interface:is_new_game() then
		effect.rewind_scripted_advice()	
	end
end

local function InitialiseCampaign()
	if not m_saved_state then
		out.ting("No saved heirarchy")

		if m_campaign ~= nil then
			-- These are not saved and is always hidden when going into a campaign. Restore them if needed
			out.ting("Starting campaign " .. m_campaign)
			-- Hide all the components that aren't used at the start of this campaign
			for i,v in ipairs(m_starting_configuration[m_campaign].Hidden) do
				HideComponent(v)
			end
			-- Disable all components marked as inactive at the start of this campaign
			for i,v in ipairs(m_starting_configuration[m_campaign].Disabled) do
				EnableComponent(v, false)
			end
			if game_interface:is_new_game() then
				effect.suspend_contextual_advice(true)
				-- features are can be complex, initize them only on new games.
				-- Call the function used to disable all the features at the start of this campaign
				for i,v in ipairs(m_starting_configuration[m_campaign].Features) do
					InitFeature(v)
				end
				-- these are saved automatically, activate them once only.
				-- Disable all the building listed
				for i,v in ipairs(m_starting_configuration[m_campaign].Building) do
					game_interface:add_restricted_building_level_record(v)
				end
				for i,v in ipairs(m_starting_configuration[m_campaign].Unit) do
					game_interface:add_restricted_unit_record(v)
				end
				for i,v in ipairs(m_starting_configuration[m_campaign].Exclusion_zone) do
					game_interface:add_exclusion_zone(	v[1], v[2], v[3], v[4], v[5], v[6], v[7], v[8]	)
				end

				for i,v in ipairs(m_starting_configuration[m_campaign].Visibility_trigger) do
					game_interface:add_visibility_trigger(	v[1], v[2], v[3]	)
				end
				for i,v in ipairs(m_starting_configuration[m_campaign].Location_trigger) do
					game_interface:add_location_trigger(	v[1], v[2], v[3], v[4]	)
				end
				game_interface:register_movies(m_starting_configuration[m_campaign].Intro_movie)
			end
			for i,v in ipairs(m_starting_configuration[m_campaign].Battlefield) do
				game_interface:add_custom_battlefield(	v[1], v[2], v[3], v[4], v[5]	)
			end
			for i,v in ipairs(m_starting_configuration[m_campaign].Settlement_override) do
				game_interface:add_settlement_model_override(	v[1], v[2]	)
			end
			for i,v in ipairs(m_starting_configuration[m_campaign].Building_override) do
				game_interface:add_building_model_override(	v[1], v[2], v[3]	)
			end
		end
	else
		m_hidden_components = m_root:RestoreUIHeirarchy(m_saved_state)
		m_saved_state = nil
		
		out.ting("Restoring old heirarchy")
		for k, v in pairs(m_hidden_components) do
			out.ting(k)
		end

	end

	if m_campaign ~= nil then
		OverrideMessageAutoShow("internal_mission_successful", true)
		OverrideMessageAutoShow("disaster_earthquake",false)
		OverrideMessageAutoShow("disaster_eruption",false)
		OverrideMessageAutoShow("disaster_fire",false)
		OverrideMessageAutoShow("disaster_flood",false)
		OverrideMessageAutoShow("disaster_hurricane",false)
		OverrideMessageAutoShow("disease_cholera",false)
		OverrideMessageAutoShow("disease_dengue_fever",false)
		OverrideMessageAutoShow("disease_gripe",false)
		OverrideMessageAutoShow("disease_malaria",false)
		OverrideMessageAutoShow("disease_plague",false)
		OverrideMessageAutoShow("disease_small_pox",false)
		OverrideMessageAutoShow("disease_typhoid_fever",false)
		OverrideMessageAutoShow("disease_typhus",false)
		OverrideMessageAutoShow("disease_yellow_fever",false)
		OverrideMessageAutoShow("faction_leader_dies_male_monarch",false)
		OverrideMessageAutoShow("faction_leader_dies_president",false)
		OverrideMessageAutoShow("faction_leader_dies_queen",false)
		OverrideMessageAutoShow("faction_leader_executed_revolution",false)
		OverrideMessageAutoShow("faction_neutral_friendly",false)
		OverrideMessageAutoShow("faction_neutral_hostile",false)
		OverrideMessageAutoShow("governor_minister_dies_in_office",false)
		OverrideMessageAutoShow("new_faction_leader_king",false)
		OverrideMessageAutoShow("new_faction_leader_president",false)
		OverrideMessageAutoShow("new_faction_leader_queen",false)
		OverrideMessageAutoShow("royal_birth_not_heir",false)
		OverrideMessageAutoShow("royal_death_female",false)
		OverrideMessageAutoShow("royal_death_male",false)
		OverrideMessageAutoShow("royal_heir_born_female",false)
		OverrideMessageAutoShow("royal_heir_born_male",false)
		OverrideMessageAutoShow("royal_heir_female_new_not_birth",false)
		OverrideMessageAutoShow("royal_heir_male_new_not_birth",false)
		OverrideMessageAutoShow("royal_marriage_celebrations",false)
		OverrideMessageAutoShow("royal_retires_unmarried",false)
		OverrideMessageAutoShow("royal_suitor_available_daughter",false)
		OverrideMessageAutoShow("royal_suitor_available_son",false)
		OverrideMessageAutoShow("your_government_change_cabinet_monarchy",false)
		OverrideMessageAutoShow("your_government_change_cabinet_republic",false)
		OverrideMessageAutoShow("your_government_change_type_monarchy",false)
		OverrideMessageAutoShow("your_government_change_type_to_republic",false)
		OverrideMessageAutoShow("your_new_faction_leader_king",false)
		OverrideMessageAutoShow("your_new_faction_leader_president",false)
		OverrideMessageAutoShow("your_new_faction_leader_queen",false)
		OverrideMessageAutoShow("your_throne_disputed",false)
		OverrideMessageAutoShow("campaign_won",true)
	end
end

function ClearEventCallbacks()
	for i,v in ipairs(m_user_defined_event_callbacks) do
		local new_event_table = {}
		--out.tom("Total callbacks for event "..v.event.." pre removal", #events[v.event])
		for ei, ev in ipairs(events[v.event]) do
			if ev ~= v.func then
				new_event_table[#new_event_table+1] = ev
			else
				out.tom("Removed "..tostring(v.func).." from event "..v.event)
			end
		end
		events[v.event] = new_event_table
		--out.tom("Total callbacks for event "..v.event.." post removal", #events[v.event])
	end
	
	m_user_defined_event_callbacks = {}
end

--------------------------------------------------------------------------------------------------------------------
-- Global functions that will get exported
--------------------------------------------------------------------------------------------------------------------
function IsOnCampaignMap()
	return m_in_campaign
end

function SetCampaign(campaign)
	out.ting("Playing episodic campaign: "..campaign)
	m_campaign = campaign
end

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
	
	out.tom("Adding "..tostring(func).." to event "..event)
end

function EnableFeature(feature)
	assert(m_features[feature] ~= nil, "Attempting to enable an unknown feature ("..feature..")")
	out.ting("Enabling "..feature)

	-- Call the feature function
	m_features[feature].Enable()
end

function InitFeature(feature)
	assert(m_features[feature] ~= nil, "Attempting to disable an unknown feature ("..feature..")")

	out.ting("Init "..feature)
	-- Call the feature function
	m_features[feature].Disable()
end

-- Override the database defined AutoShow property for a given message type.  
-- The msg parameter should be a key from the message_event_strings table, or the value "HistoricEvent"
-- If "override" is true, then messages that don't normal autoshow will do so, setting it false will mean that messages that normally
-- autoshow will not do so, and setting it to "nil" will use the default behaviour (and should thus be used to tidy up)
function OverrideMessageAutoShow(msg, override)
	out.ting("message override:" .. msg)
	message_handler.OverrideAutoShow(msg, override)
end

function ClearMessageAutoShowOverrides()
	message_handler.ClearOverrides()
end

function OnUICreated(context)
	m_highlighted_components = {}
	m_root = UIComponent(context.component)
	if context.string == "Campaign UI" then
		InitialiseCampaign()
		m_in_campaign = true
	else
		m_in_campaign = false
	end
end

--------------------------------------------------------------------------------------------------------------------
-- One time setup
--------------------------------------------------------------------------------------------------------------------

-- These event callbacks shouldn't be removed as they won't get re-added, so 
AddEventCallBack("UICreated",		OnUICreated, false)
AddEventCallBack("WorldCreated",	OnWorldCreated, false)
AddEventCallBack("NewSession",		OnNewSession, false)
AddEventCallBack("UIDestroyed",		OnDestroyed,  false)
