-- Used to calculate and provide thief (fence - stolen items buyer) information.
FenceDataProvider = Up_DataProvider:new {
    StolenItemsCount = 0 -- Count of stolen items.
}

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
function Up_DataProvider:initialize()
    self:countStolenItems()
    local function handleItemSlotUpdate(bagId, slotId, isNewItem, itemSoundCategory, inventoryUpdateReason, stackCountChange)
        -- TODO is there are any other solutions with better perfomance?
        self:countStolenItems()
    end

    EVENT_MANAGER:RegisterForEvent("FenceDataProvider_slotUpdateHandler", EVENT_INVENTORY_SINGLE_SLOT_UPDATE, handleItemSlotUpdate)
end

-- Overriden method Up_DataProvider:getText(addon).
function FenceDataProvider:getText(addon)
    local limit, sold, _ = GetFenceSellTransactionInfo()
    local soldTextureString = "|t32:32:esoui\\art\\tutorial\\guildstore_sell_tabicon_up.dds|t"
    local stolenTextureString = "|t20:20:esoui\\art\\inventory\\inventory_stolenitem_icon.dds|t"
    local fenceTextureString = "|t32:32:esoui\\art\\icons\\mapkey\\mapkey_fence.dds|t"
    local text = string.format("%s%d + %s(%d) %s%d", soldTextureString, sold, stolenTextureString, self.StolenItemsCount, fenceTextureString, limit)
    return text
end
