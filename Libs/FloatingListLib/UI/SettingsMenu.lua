--Register with LibStub
local MAJOR, MINOR = "FloatingWindowSettingsMenu", 1
local LIB, _ = LibStub:NewLibrary(MAJOR, MINOR)
if not LIB then return end -- avoid double loading.

--- Settings menu for ThiefHelper.
-- name of addon required by Up_AddonConfigurator.
LIB.name = "FenceDataProvider_SettingsMenu"

--- LibAddonMenu reference.
local LibAddonMenu = LibStub:GetLibrary("LibAddonMenu-2.0")

--- Data for LibAddonMenu.
function LIB.createSettingsPanelInformation(type, name)
    return {
        type = "panel",
        name = type .. "_Settings",
        displayName = name .. " settings",
        author = "logmeinplease",
        version = "1",
        registerForRefresh = true,
        registerForDefaults = true,
    }
end

--- Returns new editbox binded to specified addon settings for icon path.
function LIB.createIconPathConfigControl(iconSettings, defaultSettings)
    return {
        type = "editbox",
        name = GetString(CONFIG_ICON_TEXTURE_PATH),
        tooltip = GetString(CONFIG_ICON_TEXTURE_PATH_TOOLTIP),
        getFunc = function() return iconSettings.TexturePath end,
        setFunc = function(text) iconSettings.TexturePath = text end,
        isMultiline = true, --boolean
        width = "full", --or "half" (optional)
        disabled = true, --or boolean (optional)
        warning = nil, --(optional)
        default = defaultSettings.TexturePath, --(optional)
        reference = nil --(optional) unique global reference to control
    }
end

--- Returns new slider binded to specified addon settings for icon size.
function LIB.createIconSizeConfigControl(iconSettings, defaultSettings)
    return {
        type = "slider",
        name = GetString(CONFIG_ICON_SIZE),
        tooltip = GetString(CONFIG_ICON_TEXTURE_PATH_TOOLTIP),
        min = 10,
        max = 50,
        step = 2,
        default = defaultSettings.Size, --(optional)
        getFunc = function() return iconSettings.Size end,
        setFunc = function(newValue) iconSettings.Size = newValue end
    }
end

--- Creates settings menu for fence data provider.
function LIB.createMenu(addon, optionsData)
    local settingsPanelInformation = LIB.createSettingsPanelInformation(addon.name, addon.name)
    addon.SettingsPanel = LibAddonMenu:RegisterAddonPanel(addon.name .. "_Panel", settingsPanelInformation)
    LibAddonMenu:RegisterOptionControls(addon.name .. "_PanelControls", optionsData)
end
