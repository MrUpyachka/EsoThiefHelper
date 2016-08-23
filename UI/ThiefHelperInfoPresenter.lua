--[[
-- Handles displaying of ThiefHelper window.
]] --
ThiefHelperInfoPresenter = {}

-- Creates an base for presenter.
function ThiefHelperInfoPresenter:new(infoWindow, widgetFactory)
    local instance = {
        InfoWindow = infoWindow,
        WidgetFactory = widgetFactory,
        LabelsOrder = {} -- Used to sort labels in container. number -> {sourceId, label}
    }
    self.__index = self
    return setmetatable(instance, self)
end

-- Returns index of label in sorted output.
function ThiefHelperInfoPresenter:getOrderSortIndexForSourceId(sourceId)
    for number, data in pairs(self.LabelsOrder) do
        if id == data.SourceId then
            return number
        end
    end
    return nil
end

-- Returns size of specified table.
local function getTableSize(table)
    local size = 0
    for key, value in pairs(table) do
        size = size + 1
    end
    return size
end

-- Checks that labels exists for each provider and adds new if not.
function ThiefHelperInfoPresenter:checkAndUpdateLabels()
    local providers = ThiefHelper.ProvidersController
    if self.InfoWindow.LabelsList == nil then
        self.InfoWindow.LabelsList = {} -- Create if not exist
    end
    local labels = self.InfoWindow.LabelsList
    local factory = self.WidgetFactory
    local labelsMap = self.LabelsOrder
    local labelsNumber = getTableSize(labels)
    if providers.Size > labelsNumber then
        -- we need to add more labels
        local container = Up_UiTools.getContainer(self.InfoWindow)
        for sourceId, _ in pairs(providers.List) do
            if self:getOrderSortIndexForSourceId(sourceId) == nil then
                -- Provider has no uptput label. Create it
                local label = factory.createNormalLabel(sourceId .. "_label", container)
                if labelsNumber > 0 then
                    local lastLabel = labels[labelsNumber]
                    label:SetAnchor(TOPLEFT, lastLabel, BOTTOMLEFT, 0, 0)
                else
                    label:SetAnchor(TOPLEFT, container, TOPLEFT, 0, 0)
                end
                label:SetText(sourceId)
                labels[labelsNumber] = label
                labelsMap[getTableSize(labelsMap) + 1] = { SourceId = sourceId, Label = label } -- label added.
            end
        end
    end
end

-- Updates info window with new data retrieved from providers.
function ThiefHelperInfoPresenter:onUpdateRequired()
    local providers = ThiefHelper.ProvidersController
    self:checkAndUpdateLabels()
    for _, data in pairs(self.LabelsOrder) do
        local label = data.Label
        local provider = providers.List[data.SourceId]
        if provider == nil then
            label:SetHidden(true)
        else
            label:SetText(provider:getText(ThiefHelper))
            label:SetHidden(false)
        end
    end
end

-- Starts displaying of data for InfoWindow.
function ThiefHelperInfoPresenter:start()
    local presenter = self
    local function callback()
        presenter:onUpdateRequired()
    end

    EVENT_MANAGER:RegisterForUpdate(ThiefHelper.name .. "_infoPresenter", ThiefHelper.Settings.UI.Info.UpdateInterval, callback)
end
