--Register with LibStub
local MAJOR, MINOR = "Up_FloatingWindowSettingsMenu", 2
local LIB, _ = LibStub:NewLibrary(MAJOR, MINOR)
if not LIB then return end -- avoid double loading.

--- Settings menu for floating window.
-- name of addon required by Up_AddonConfigurator.
LIB.name = "Up_FloatingWindow_SettingsMenu"

--- LibAddonMenu reference.
local LibAddonMenu = LibStub:GetLibrary("LibAddonMenu-2.0")

--- Data for LibAddonMenu.
function LIB.createSettingsPanelInformation(name)
    return {
        type = "panel",
        name = name,
        displayName = name,
        author = "logmeinplease",
        version = "2",
        registerForRefresh = true,
        registerForDefaults = true,
    }
end


--- Returns new checkbox binded to specified addon settings for indicator enabled/disabled state.
function LIB.createIndicatorToggleControl(iconSettings, defaultSettings)
    return {
        type = "checkbox",
        name = GetString(CONFIG_INDICATOR_TOGGLE),
        tooltip = GetString(CONFIG_INDICATOR_TOGGLE_TOOLTIP),
        getFunc = function() return iconSettings.Enabled end,
        setFunc = function(state) iconSettings.Enabled = state end,
        width = "full", --or "half" (optional)
        disabled = false, --or boolean (optional)
        warning = nil, --(optional)
        default = defaultSettings.Enabled, --(optional)
        reference = nil --(optional) unique global reference to control
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
        disabled = false, --or boolean (optional)
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

--- Returns default controls for any indicator with icon.
function LIB.createIndicatorWithIconControls(iconSettings, defaultSettings)
    return {
        [1] = LIB.createIndicatorToggleControl(iconSettings, defaultSettings),
        [2] = LIB.createIconPathConfigControl(iconSettings, defaultSettings),
        [3] = LIB.createIconSizeConfigControl(iconSettings, defaultSettings),
    }
end

--- Creates settings menu for fence data provider.
function LIB.createMenu(addon, optionsData, name)
    local settingsPanelInformation = LIB.createSettingsPanelInformation(name)
    local panelKey = addon.name .. "_Panel"
    addon.SettingsPanel = LibAddonMenu:RegisterAddonPanel(panelKey, settingsPanelInformation)
    LibAddonMenu:RegisterOptionControls(panelKey, optionsData)
end
