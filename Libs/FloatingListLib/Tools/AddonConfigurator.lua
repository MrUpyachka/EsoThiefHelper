--Register with LibStub
local MAJOR, MINOR = "Up_AddonConfigurator", 1
local LIB, _ = LibStub:NewLibrary(MAJOR, MINOR)
if not LIB then return end -- avoid double loading.

---
-- Used to configure common logic and values for any addon.

-- Requires addon.onLoaded method and addon.name field.
function LIB.configureOnLoadedCallback(addon)
    local function onAddonLoaded(event, addonName)
        -- Filter addon's by name.
        if addonName == addon.name then
            -- zo_callLater(function() d(addonName .. " loaded") end, 10000)
            addon.onLoaded(event)
            -- addon initialized. No more needs to listen event.
            EVENT_MANAGER:UnregisterForEvent(addon.name .. "_addonLoadingHandler", EVENT_ADD_ON_LOADED)
        end
    end

    EVENT_MANAGER:RegisterForEvent(addon.name .. "_addonLoadingHandler", EVENT_ADD_ON_LOADED, onAddonLoaded)
end
