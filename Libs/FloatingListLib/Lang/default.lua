local LocaleUtils = LibStub:GetLibrary("Up_LocaleUtils")

--- Default localization file.

-- Version for proper saving in EsoStringVersions.
local localizationVersion = 1 -- Use greater version in othe localizations.
-- Table with localized names.
local localizedStrings = {
    SI_BINDING_NAME_VISIBILITY_TOGGLE = "Show/Hide",
    CONFIG_ICON_TEXTURE_PATH = "Path to icon texture",
    CONFIG_ICON_TEXTURE_PATH_TOOLTIP = "Specify icon location (its texture)",
    CONFIG_ICON_SIZE = "Size",
    CONFIG_ICON_TEXTURE_PATH_TOOLTIP = "Specify icon size",
    CONFIG_ENABLED_STATE_TOGGLE = "Enabled/Disabled",
    CONFIG_ENABLED_STATE_TOGGLE_TOOLTIP = "Allows to enable/disable element",
    CONFIG_WINDOW_BACKDROP_STATE = "Background state",
    CONFIG_UI_RELOAD_REQUIREMENT = "Will need to reload the UI",
}
LocaleUtils.register(localizedStrings, localizationVersion)
