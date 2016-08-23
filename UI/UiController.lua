-- Used to initialize UI for ThiefHelper.
ThiefHelper.UiController = {}

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
    Up_UiTools.configureToHideTogetherWithCompass(infoWindowRoot)
end
