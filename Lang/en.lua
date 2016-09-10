local LocaleUtils = LibStub:GetLibrary("Up_LocaleUtils")

--- English localization file.

-- Version for proper saving in EsoStringVersions.
local localizationVersion = 1
-- Table with localized names.
local localizedStrings = {
    THIEF_HELPER_ADDON_NAME = "|cAAFF55ThiefHelper|r",
    FENCE_DATA_PROVIDER_ADDON_NAME = "|cAAFF55Fence data provider|r",
    FENCE_DATA_PROVIDER_ADDON_DESC = "Displays actual fence information.",
    FENCE_DATA_PROVIDER_CONFIG_SOLD_ICON = "Sold items count icon",
    FENCE_DATA_PROVIDER_CONFIG_STOLEN_ICON = "Stolen items in bag count icon",
    FENCE_DATA_PROVIDER_CONFIG_LIMIT_ICON = "Selling limit for stolen items icon",
    SI_BINDING_NAME_THIEF_HELPER_VISIBILITY_TOGGLE = "Show/Hide",
}
LocaleUtils.register(localizedStrings, localizationVersion)
