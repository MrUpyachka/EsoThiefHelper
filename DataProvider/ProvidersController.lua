-- Controller of providers. Colelcts them for future usage.
Up_ProvidersController = {}

-- Creates an base for providers controller.
function Up_ProvidersController:new()
    local instance = {}
    self.__index = self
    return setmetatable(instance, self)
end

-- Adds an provider to controller and maps it with source ID.
function Up_DataProvider:registerProvider(sourceId, provider)
    self[sourceId] = provider
end