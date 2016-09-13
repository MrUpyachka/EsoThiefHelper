
--- Local imports:
local ProvidersController = LibStub:GetLibrary("Up_ProvidersController")
local SettingsController = LibStub:GetLibrary("Up_SettingsController")
local UiFactory = LibStub:GetLibrary("Up_UiFactory")
local UiController = LibStub:GetLibrary("Up_UiController")
local FloatingWindowPresenter = LibStub:GetLibrary("Up_FloatingWindowPresenter")
local AddonConfigurator = LibStub:GetLibrary("Up_AddonConfigurator")

local self = ThiefHelper

-- Other addons can add their custom providers.
self.ProvidersController = ProvidersController:new()

-- function callback to initialize addon on first loading. Required by Up_AddonConfigurator
function self.onLoaded(event)
    SettingsController.loadSettings(self)
    self.UiController = UiController:new(self.Settings, self)
    self.UiController:initializeUI()

    local presenter = FloatingWindowPresenter:new(self, self.UI.Window, UiFactory, "general", self.Settings)
    self.ProvidersController:registerProvider("FenceDataProvider", FenceDataProvider:new())
    self.ProvidersController:registerProvider("ThiefBagDataProvider", ThiefBagDataProvider:new())
    self.ProvidersController:registerProvider("RecallCooldownDataProvider", RecallCooldownDataProvider:new())
    presenter:start()

end

-- Invocation of Up_AddonConfigurator to bind onLoaded as callback for first time of addon loading.
AddonConfigurator.configureOnLoadedCallback(self)
