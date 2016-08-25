-- Other addons can add their custom providers.
ThiefHelper.ProvidersController = Up_ProvidersController:new()

-- function callback to initialize addon on first loading. Required by Up_AddonConfigurator
function ThiefHelper.onLoaded(event)
    Up_SettingsController.loadSettings(ThiefHelper)
    ThiefHelper.UiController.initializeUI()
    local presenter = ThiefHelperInfoPresenter:new(ThiefHelper.UI.Info.Window, Up_UiFactory)
    ThiefHelper.ProvidersController:registerProvider("FenceInfo", FenceDataProvider:new())
    ThiefHelper.ProvidersController:registerProvider("RecallCooldownDataProvider", RecallCooldownDataProvider:new())
    presenter:start()
end

-- Invokation of Up_AddonConfigurator to bind onLoaded as callback for first time of addon loading.
Up_AddonConfigurator.configureOnLoadedCallback(ThiefHelper)
