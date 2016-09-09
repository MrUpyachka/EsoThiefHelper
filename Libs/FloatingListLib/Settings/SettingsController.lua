--Register with LibStub
local MAJOR, MINOR = "Up_SettingsController", 1
local LIB, _ = LibStub:NewLibrary(MAJOR, MINOR)
if not LIB then return end -- avoid double loading.

---
-- Handles addon settings.

-- Loads settings from saved variables or uses default.
function LIB.loadSettings(addon)
    addon.Settings = ZO_SavedVars:New(addon.name .. "_settings", addon.version, nil, addon.Default.Settings)
end
