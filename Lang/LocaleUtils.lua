--- Used to configure locale storage for addon.
LocaleUtils = {}

function LocaleUtils.register(localizedStrings, localizationVersion)
    -- Register localized strings in ESO storage.
    for key, locale in pairs(localizedStrings) do
        ZO_CreateStringId(key, locale) -- Use in code: GetString( key )
        SafeAddVersion(key, localizationVersion) -- See EsoStringVersions.
    end
end
