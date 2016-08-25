-- Used to initialize UI for ThiefHelper.
ThiefHelper.UiController = {}

-- Check that compass visible and follows by its state. Only if Info enabled.
function ThiefHelper.UiController.hideInfoWithCompass()
    local visible
    if ZO_CompassFrame then
        visible = ThiefHelper.Settings.UI.Info.Enabled and not ZO_CompassFrame:IsHidden()
    else
        visible = ThiefHelper.Settings.UI.Info.Enabled
    end
    ThiefHelper.UI.Info.Window.Root:SetHidden(not visible)
end

-- Creates UI and configures it with settings. Requires loaded settings.
function ThiefHelper.UiController.initializeUI()
    ThiefHelper.UI = {}
    ThiefHelper.UI.Info = {}
    local infoWindowPadding = ThiefHelper.Settings.UI.Info.Window.Padding
    ThiefHelper.UI.Info.Window = Up_UiFactory.createShadowWindow(ThiefHelper.name .. "_infoWindow", infoWindowPadding)
    local infoWindowRoot = ThiefHelper.UI.Info.Window.Root
    local position = ThiefHelper.Settings.UI.Info.Window.Position
    infoWindowRoot:SetAnchor(TOPLEFT, GuiRoot, TOPLEFT, position.OffsetX, position.OffsetY)
    Up_UiTools.configureAsFloat(infoWindowRoot, position)
    ThiefHelper.Settings.UI.Info.Enabled = true

    -- Sets widget to switch visibility depends on compass visibility.
    EVENT_MANAGER:RegisterForUpdate(infoWindowRoot:GetName() .. "VisibilityHandler", 100, ThiefHelper.UiController.hideInfoWithCompass)
end

-- Toggles visibility of Info window.
function ThiefHelper.UiController.toggleInfoWindow()
    ThiefHelper.Settings.UI.Info.Enabled = not ThiefHelper.Settings.UI.Info.Enabled;
    local infoWindowRoot = ThiefHelper.UI.Info.Window.Root
    ThiefHelper.UiController.hideInfoWithCompass()
end
