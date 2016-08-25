--[[
-- Handles displaying of ThiefHelper window.
]] --
ThiefHelperInfoPresenter = {}

-- Creates an base for presenter.
function ThiefHelperInfoPresenter:new(infoWindow, widgetFactory)
    local instance = {
        InfoWindow = infoWindow,
        WidgetFactory = widgetFactory,
        OrderOfSources = ThiefHelper.Settings.UI.Info.OrderOfSources, -- Used to sort labels in container. number -> {sourceId, label}
        LabelsList = {} -- List of created labels.
    }
    self.__index = self
    return setmetatable(instance, self)
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
    local labels = self.LabelsList
    local factory = self.WidgetFactory
    local labelsNumber = getTableSize(labels)
    if providers.Size > labelsNumber then
        -- we need to add more labels
        local container = Up_UiTools.getContainer(self.InfoWindow)
        for sourceId, _ in pairs(providers.List) do
            if self.OrderOfSources[sourceId] == nil then
                self.OrderOfSources[sourceId] = 0 -- default order in list
            end
        end
        local labelsToAdd = providers.Size - labelsNumber
        for i = 1, labelsToAdd do
            local index = labelsNumber + 1 -- index for new label in list
            local label = factory.createNormalLabel(ThiefHelper.name .. "_label_" .. index, container)
            if labelsNumber > 0 then
                local lastLabel = labels[labelsNumber]
                label:SetAnchor(TOPLEFT, lastLabel, BOTTOMLEFT, 0, 0)
            else
                label:SetAnchor(TOPLEFT, container, TOPLEFT, 0, 0)
            end
            label:SetText(sourceId)
            labels[index] = label -- save new label
            labelsNumber = labelsNumber + 1 -- calc new number of labels
        end

        table.sort(self.OrderOfSources, function(first, second) return first > second end)
    end
end

-- Updates info window with new data retrieved from providers.
function ThiefHelperInfoPresenter:onUpdateRequired()
    local providers = ThiefHelper.ProvidersController
    local labels = self.LabelsList
    self:checkAndUpdateLabels()
    local index = 1
    for sourceId, _ in pairs(self.OrderOfSources) do
        local label = labels[index]
        local provider = providers.List[sourceId]
        if provider == nil then
            label:SetHidden(true)
        else
            local text = provider:getText(ThiefHelper)
            if text ~= nil then
                label:SetText(text)
                label:SetHidden(false)
            else
                label:SetHidden(true) -- hide label if there are no data.
            end
        end
        index = index + 1
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
