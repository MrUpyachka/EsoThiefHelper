--- Russian localization file.

-- Version for proper saving in EsoStringVersions.
local localizationVersion = 1
-- Table with localized names.
local localizedStrings = {
    THIEF_HELPER_ADDON_NAME = "|cAAFF55Воровской помощник|r",
    SI_BINDING_NAME_THIEF_HELPER_TOGGLE = "Показать/скрыть",
    FENCE_DATA_PROVIDER_ADDON_NAME = "|cAAFF55Индикаторы скупщика краденного|r",
    FENCE_DATA_PROVIDER_ADDON_DESC = "Отображает информацию о текущих счетчиках скупщика краденного.",
    CONFIG_ICON_TEXTURE_PATH = "Путь к текстуре иконки",
    CONFIG_ICON_TEXTURE_PATH_TOOLTIP = "Укажите путь к текстуре иконки",
    CONFIG_ICON_SIZE = "Размер",
    CONFIG_ICON_TEXTURE_PATH_TOOLTIP = "Укажите размер иконки",
    FENCE_DATA_PROVIDER_CONFIG_SOLD_ICON = "Иконка количества проданных скупщику предметов",
    FENCE_DATA_PROVIDER_CONFIG_STOLEN_ICON = "Иконка количества украденных предметов в рюкзаке",
    FENCE_DATA_PROVIDER_CONFIG_LIMIT_ICON = "Иконка предельного количества предметов для продажи скупщику за день",
}
LocaleUtils.register(localizedStrings, localizationVersion)
