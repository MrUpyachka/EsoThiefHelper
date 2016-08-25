-- Handles addon settings.
Up_SettingsController = {}

-- Loads settings from saved variables or uses default.
function Up_SettingsController.loadSettings(addon)
    addon.Settings = ZO_SavedVars:New(addon.name .. "_settings", 1, nil, addon.Default.Settings)
end
