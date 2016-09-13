local LocaleUtils = LibStub:GetLibrary("Up_LocaleUtils")

--- Russian localization file.

-- Version for proper saving in EsoStringVersions.
local localizationVersion = 1
-- Table with localized names.
local localizedStrings = {
    SI_BINDING_NAME_VISIBILITY_TOGGLE = "Показать/скрыть",
    CONFIG_ICON_TEXTURE_PATH = "Путь к текстуре иконки",
    CONFIG_ICON_TEXTURE_PATH_TOOLTIP = "Укажите путь к текстуре иконки",
    CONFIG_ICON_SIZE = "Размер",
    CONFIG_ICON_TEXTURE_PATH_TOOLTIP = "Укажите размер иконки",
    CONFIG_INDICATOR_TOGGLE = "Включен/Выключен",
    CONFIG_INDICATOR_TOGGLE_TOOLTIP = "Позволяет включить или отключить индикатор",
}
LocaleUtils.register(localizedStrings, localizationVersion)
