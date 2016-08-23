-- This module initializes mandatory attributes.
-- Addon root. Used to configure all parts. Only calls to other parts.
ThiefHelper = {}
-- name of addon reuired by Up_AddonConfigurator.
ThiefHelper.name = "ThiefHelper"
-- version of plugin. Required by Up_SettingsController.
ThiefHelper.version = 1
-- Any default data placed here.
ThiefHelper.Default = {}
-- default settings for addon. Required by Up_SettingsController.
ThiefHelper.Default.Settings = {
    UI = {
        Info = {
            Window = {
                Padding = 11, -- Padding for window content.
                Position = { OffsetX = 33, OffsetY = 33 } -- Point on screen to align TOPLEFT point of floating window.
            },
            UpdateInterval = 200 -- Interval for displayed update.
        }
    }
}
