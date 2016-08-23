-- Used to configure common logic and values for any addon.
Up_AddonConfigurator = {}

function Up_AddonConfigurator.configureOnLoadedCallback(addon)
    local function onAddonLoaded(event, addonName)
        -- Filter addon's by name.
        if addonName == addon.name then
            addon.onLoaded(event)
            -- addon initialized. No more needs to listen event.
            EVENT_MANAGER:UnregisterForEvent(addon.name .. "_addonLoadingHandler", EVENT_ADD_ON_LOADED)
        end
    end
    EVENT_MANAGER:RegisterForEvent(addon.name .. "_addonLoadingHandler", EVENT_ADD_ON_LOADED, onAddonLoaded)
end
