-- Controller of providers. Colelcts them for future usage.
Up_ProvidersController = {}

-- Creates an base for providers controller.
function Up_ProvidersController:new()
    local instance = { Size = 0, List = {} }
    self.__index = self
    return setmetatable(instance, self)
end

-- Adds an provider to controller and maps it with source ID.
function Up_ProvidersController:registerProvider(sourceId, provider)
    self.List[sourceId] = provider
    self.Size = self.Size + 1
end
