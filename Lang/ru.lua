local LocaleUtils = LibStub:GetLibrary("Up_LocaleUtils")

--- Russian localization file.

-- Version for proper saving in EsoStringVersions.
local localizationVersion = 1
-- Table with localized names.
local localizedStrings = {
    THIEF_HELPER_ADDON_NAME = "|cAAFF55Воровской помощник|r",
    FENCE_DATA_PROVIDER_ADDON_NAME = "|cAAFF55Индикаторы скупщика краденного|r",
    FENCE_DATA_PROVIDER_ADDON_DESC = "Отображает информацию о текущих счетчиках скупщика краденного.",
    FENCE_DATA_PROVIDER_CONFIG_SOLD_ICON = "Иконка количества проданных скупщику предметов",
    FENCE_DATA_PROVIDER_CONFIG_STOLEN_ICON = "Иконка количества украденных предметов в рюкзаке",
    FENCE_DATA_PROVIDER_CONFIG_LIMIT_ICON = "Иконка предельного количества предметов для продажи скупщику за день",
    SI_BINDING_NAME_THIEF_HELPER_VISIBILITY_TOGGLE = "Показать/скрыть",
}
LocaleUtils.register(localizedStrings, localizationVersion)
