--=====================================================================================
-- STHLU | SonicTheHedgehogLevelUp - core.lua
-- Version: 2.0.0
-- Author: DonnieDice
-- RGX Mods Collection - RealmGX Community Project
--=====================================================================================

local RGX = assert(_G.RGXFramework, "STHLU: RGX-Framework not loaded")

STHLU = STHLU or {}

local ADDON_VERSION = "2.0.4"
local ADDON_NAME = "SonicTheHedgehogLevelUp"
local PREFIX = "|Tinterface/addons/SonicTheHedgehogLevelUp/media/icon:16:16|t - |cffffffff[|r|cff1e3ce1STHLU|r|cffffffff]|r "
local TITLE = "|Tinterface/addons/SonicTheHedgehogLevelUp/media/icon:18:18|t [|cff1e3ce1S|r|cffffffffonic The Hedgehog|r |cff1e3ce1L|r|cffffffffevel|r |cff1e3ce1U|r|cff1e3ce1p|r|cff1e3ce1!|r]"

STHLU.version = ADDON_VERSION
STHLU.addonName = ADDON_NAME

local Sound = RGX:GetSound()

local handle = Sound:Register(ADDON_NAME, {
sounds = {
high = "Interface\\Addons\\SonicTheHedgehogLevelUp\\sounds\\sonic_the_hedgehog_high.ogg",
medium = "Interface\\Addons\\SonicTheHedgehogLevelUp\\sounds\\sonic_the_hedgehog_med.ogg",
low = "Interface\\Addons\\SonicTheHedgehogLevelUp\\sounds\\sonic_the_hedgehog_low.ogg",
},
defaultSoundId = 569593,
savedVar = "STHLUSettings",
defaults = {
enabled = true,
soundVariant = "medium",
muteDefault = true,
showWelcome = true,
volume = "Master",
firstRun = true,
},
triggerEvent = "PLAYER_LEVEL_UP",
addonVersion = ADDON_VERSION,
})

STHLU.handle = handle

local L = STHLU.L or {}
local initialized = false

local function ShowHelp()
print(PREFIX .. " " .. (L["HELP_HEADER"] or ""))
print(PREFIX .. " " .. (L["HELP_TEST"] or ""))
print(PREFIX .. " " .. (L["HELP_ENABLE"] or ""))
print(PREFIX .. " " .. (L["HELP_DISABLE"] or ""))
print(PREFIX .. " |cffffffff/sthlu high|r - Use high quality sound")
print(PREFIX .. " |cffffffff/sthlu med|r - Use medium quality sound")
print(PREFIX .. " |cffffffff/sthlu low|r - Use low quality sound")
end

local function HandleSlashCommand(args)
local command = string.lower(args or "")
if command == "" or command == "help" then
ShowHelp()
elseif command == "test" then
print(PREFIX .. " " .. (L["PLAYING_TEST"] or ""))
handle:Test()
elseif command == "enable" then
handle:Enable()
print(PREFIX .. " " .. (L["ADDON_ENABLED"] or ""))
elseif command == "disable" then
handle:Disable()
print(PREFIX .. " " .. (L["ADDON_DISABLED"] or ""))
elseif command == "high" then
handle:SetVariant("high")
print(PREFIX .. " " .. string.format(L["SOUND_VARIANT_SET"] or "%s", "high"))
elseif command == "med" or command == "medium" then
handle:SetVariant("medium")
print(PREFIX .. " " .. string.format(L["SOUND_VARIANT_SET"] or "%s", "medium"))
elseif command == "low" then
handle:SetVariant("low")
print(PREFIX .. " " .. string.format(L["SOUND_VARIANT_SET"] or "%s", "low"))
else
print(PREFIX .. " " .. (L["ERROR_PREFIX"] or "") .. " " .. (L["ERROR_UNKNOWN_COMMAND"] or ""))
end
end

RGX:RegisterEvent("ADDON_LOADED", function(event, addonName)
if addonName ~= ADDON_NAME then return end
handle:SetLocale(STHLU.L)
L = STHLU.L or {}
handle:Init()
initialized = true
end, "STHLU_ADDON_LOADED")

RGX:RegisterEvent("PLAYER_LEVEL_UP", function()
if initialized then
handle:Play()
end
end, "STHLU_PLAYER_LEVEL_UP")

RGX:RegisterEvent("PLAYER_LOGIN", function()
if not initialized then
handle:SetLocale(STHLU.L)
L = STHLU.L or {}
handle:Init()
initialized = true
end
handle:ShowWelcome(PREFIX, TITLE)
end, "STHLU_PLAYER_LOGIN")

RGX:RegisterEvent("PLAYER_LOGOUT", function()
handle:Logout()
end, "STHLU_PLAYER_LOGOUT")

RGX:RegisterSlashCommand("sthlu", function(msg)
local ok, err = pcall(HandleSlashCommand, msg)
if not ok then
print(PREFIX .. " |cffff0000STHLU Error:|r " .. tostring(err))
end
end, "STHLU_SLASH")
