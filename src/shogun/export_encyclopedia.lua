--[[
Automatically generated via export from C:/Users/chris_g\branches/shogun2/boshin/shogun2/raw_data/db
Edit manually at your own risk
--]]

module(..., package.seeall)

events = require "data.events"
-- Encyclopedia Declarations

--[[ CharacterInfoPopup_Full ]]--

events.EncylopediaEntryRequested[#events.EncylopediaEntryRequested+1] =
function (context)
	if conditions.IsComponentType("CharacterInfoPopup_Full", context) then
		effect.OpenBrowser("how_to_play/045b_enc_manual_ui_character.html", context)
		return true
	end
	return false
end

--[[ UnitInfoPopup_Full ]]--

events.EncylopediaEntryRequested[#events.EncylopediaEntryRequested+1] =
function (context)
	if conditions.IsComponentType("UnitInfoPopup_Full", context) then
		effect.OpenBrowser("how_to_play/034_enc_manual_ui_units.html", context)
		return true
	end
	return false
end

--[[ character_skills ]]--

events.EncylopediaEntryRequested[#events.EncylopediaEntryRequested+1] =
function (context)
	if conditions.IsComponentType("character_skills", context) then
		effect.OpenBrowser("how_to_play/042_enc_manual_skills.html", context)
		return true
	end
	return false
end

--[[ clan ]]--

events.EncylopediaEntryRequested[#events.EncylopediaEntryRequested+1] =
function (context)
	if conditions.IsComponentType("clan", context) then
		effect.OpenBrowser("how_to_play/016_enc_manual_hud_management.html", context)
		return true
	end
	return false
end

--[[ diplomacy_panel ]]--

events.EncylopediaEntryRequested[#events.EncylopediaEntryRequested+1] =
function (context)
	if conditions.IsComponentType("diplomacy_panel", context) then
		effect.OpenBrowser("how_to_play/015_enc_manual_hud_diplomacy.html", context)
		return true
	end
	return false
end

--[[ events ]]--

events.EncylopediaEntryRequested[#events.EncylopediaEntryRequested+1] =
function (context)
	if conditions.IsComponentType("events", context) then
		effect.OpenBrowser("how_to_play/012_enc_manual_hud_events.html", context)
		return true
	end
	return false
end

--[[ finance_screen ]]--

events.EncylopediaEntryRequested[#events.EncylopediaEntryRequested+1] =
function (context)
	if conditions.IsComponentType("finance_screen", context) then
		effect.OpenBrowser("how_to_play/013_enc_manual_hud_finances.html", context)
		return true
	end
	return false
end

--[[ railroad_panel ]]--

events.EncylopediaEntryRequested[#events.EncylopediaEntryRequested+1] =
function (context)
	if conditions.IsComponentType("railroad_panel", context) then
		effect.OpenBrowser("how_to_play/bosh_enc_railways.html", context)
		return true
	end
	return false
end

--[[ region_info ]]--

events.EncylopediaEntryRequested[#events.EncylopediaEntryRequested+1] =
function (context)
	if conditions.IsComponentType("region_info", context) then
		effect.OpenBrowser("how_to_play/021_enc_manual_ui_province.html", context)
		return true
	end
	return false
end

--[[ technology ]]--

events.EncylopediaEntryRequested[#events.EncylopediaEntryRequested+1] =
function (context)
	if conditions.IsComponentType("technology", context) then
		effect.OpenBrowser("how_to_play/014_enc_manual_hud_arts.html", context)
		return true
	end
	return false
end

