--Register with LibStub
local MAJOR, MINOR = "Up_ProvidersController", 1
local LIB, _ = LibStub:NewLibrary(MAJOR, MINOR)
if not LIB then return end -- avoid double loading.

--- Controller of providers. Colelcts them for future usage.

-- Creates an base for providers controller.
function LIB:new()
    local instance = { Size = 0, List = {} }
    self.__index = self
    return setmetatable(instance, self)
end

-- Adds an provider to controller and maps it with source ID.
function LIB:registerProvider(sourceId, provider)
    self.List[sourceId] = provider
    self.Size = self.Size + 1
end
