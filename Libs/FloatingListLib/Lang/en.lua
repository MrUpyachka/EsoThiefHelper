local LocaleUtils = LibStub:GetLibrary("Up_LocaleUtils")

--- English localization file.

-- Version for proper saving in EsoStringVersions.
local localizationVersion = 1
-- Table with localized names.
local localizedStrings = {
    SI_BINDING_NAME_VISIBILITY_TOGGLE = "Show/Hide",
    FENCE_DATA_PROVIDER_ADDON_NAME = "|cAAFF55Fence data provider|r",
    FENCE_DATA_PROVIDER_ADDON_DESC = "Displays actual fence information.",
    CONFIG_ICON_TEXTURE_PATH = "Path to icon texture",
    CONFIG_ICON_TEXTURE_PATH_TOOLTIP = "Specify icon location (its texture)",
    CONFIG_ICON_SIZE = "Size",
    CONFIG_ICON_TEXTURE_PATH_TOOLTIP = "Specify icon size",
    FENCE_DATA_PROVIDER_CONFIG_SOLD_ICON = "Sold items count icon",
    FENCE_DATA_PROVIDER_CONFIG_STOLEN_ICON = "Stolen items in bag count icon",
    FENCE_DATA_PROVIDER_CONFIG_LIMIT_ICON = "Selling limit for stolen items icon",
}
LocaleUtils.register(localizedStrings, localizationVersion)
