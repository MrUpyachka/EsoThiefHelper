local LocaleUtils = LibStub:GetLibrary("Up_LocaleUtils")

--- Default localization file.

-- Version for proper saving in EsoStringVersions.
local localizationVersion = 0 -- Use greater version in othe localizations.
-- Table with localized names.
local localizedStrings = {
    SI_BINDING_NAME_VISIBILITY_TOGGLE = "Show/Hide",
    CONFIG_ICON_TEXTURE_PATH = "Path to icon texture",
    CONFIG_ICON_TEXTURE_PATH_TOOLTIP = "Specify icon location (its texture)",
    CONFIG_ICON_SIZE = "Size",
    CONFIG_ICON_TEXTURE_PATH_TOOLTIP = "Specify icon size",
    CONFIG_INDICATOR_TOGGLE = "Enabled/Disabled",
    CONFIG_INDICATOR_TOGGLE_TOOLTIP = "Allows to enable/disable indicator",
}
LocaleUtils.register(localizedStrings, localizationVersion)
