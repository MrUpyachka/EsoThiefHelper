-- Used to calculate and provide thief (fence - stolen items buyer) information.
FenceDataProvider = Up_DataProvider:new {
    StolenItemsCount = 0, -- Count of stolen items.
    -- name of addon required by Up_AddonConfigurator.
    name = "FenceDataProvider",
    -- version of addon required by Up_SettingsController.
    version = 1,
    -- Any default data placed here.
    Default = {
        -- default settings for addon. Required by Up_SettingsController.
        Settings = {
            Icons = {
                SoldStolenItemsNumberIcon = {
                    TexturePath = "esoui\\art\\tutorial\\guildstore_sell_tabicon_up.dds",
                    Size = 32
                },
                StolenItemsNumberInBagIcon = {
                    TexturePath = "esoui\\art\\inventory\\inventory_stolenitem_icon.dds",
                    Size = 20
                },
                StolenItemsSellingLimitIcon = {
                    TexturePath = "esoui\\art\\icons\\mapkey\\mapkey_fence.dds",
                    Size = 32
                },
            }
        }
    },

}

local SettingsController = LibStub:GetLibrary("Up_SettingsController")

-- Calculate number of stolen items in inventory.
function FenceDataProvider:countStolenItems()
    local bagCache = SHARED_INVENTORY:GenerateFullSlotData(nil, BAG_BACKPACK)
    self.StolenItemsCount = 0
    for key, data in pairs(bagCache) do
        if (data.stolen) then
            self.StolenItemsCount = self.StolenItemsCount + data.stackCount
        end
    end
end

-- Overriden method Up_DataProvider:initialize().
function FenceDataProvider:initialize()
    self:countStolenItems()
    local function handleItemSlotUpdate(bagId, slotId, isNewItem, itemSoundCategory, inventoryUpdateReason, stackCountChange)
        -- TODO is there are any other solutions with better perfomance?
        self:countStolenItems()
    end

    EVENT_MANAGER:RegisterForEvent("FenceDataProvider_slotUpdateHandler", EVENT_INVENTORY_SINGLE_SLOT_UPDATE, handleItemSlotUpdate)

    self:onLoaded()
end

-- Overriden method Up_DataProvider:getText(addon).
function FenceDataProvider:getText(addon)
    local limit, sold, _ = GetFenceSellTransactionInfo()
    local iconsSettings = self.Settings.Icons
    local soldItemsNumIconPath = iconsSettings.SoldStolenItemsNumberIcon.TexturePath
    local soldItemsNumIconSize = iconsSettings.SoldStolenItemsNumberIcon.Size

    local stolenItemsNumIconPath = iconsSettings.StolenItemsNumberInBagIcon.TexturePath
    local stolenItemsNumIconSize = iconsSettings.StolenItemsNumberInBagIcon.Size

    local sellLimitItemsNumIconPath = iconsSettings.StolenItemsSellingLimitIcon.TexturePath
    local sellLimitItemsNumIconSize = iconsSettings.StolenItemsSellingLimitIcon.Size

    local soldTextureString = zo_iconFormat(soldItemsNumIconPath, soldItemsNumIconSize, soldItemsNumIconSize)
    local stolenTextureString = zo_iconFormat(stolenItemsNumIconPath, stolenItemsNumIconSize, stolenItemsNumIconSize)
    local fenceTextureString = zo_iconFormat(sellLimitItemsNumIconPath, sellLimitItemsNumIconSize, sellLimitItemsNumIconSize)
    local text = string.format("%s%d + %s(%d) %s%d", soldTextureString, sold, stolenTextureString, self.StolenItemsCount, fenceTextureString, limit)
    return text
end

-- function callback to initialize addon on first loading. Required by Up_AddonConfigurator
function FenceDataProvider:onLoaded(event)
    SettingsController.loadSettings(self)
    FenceDataProviderSettingsMenu.createMenu(self)
end
