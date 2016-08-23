-- Used to provide displayable data.
Up_DataProvider = {}

-- Creates an base for data provider.
function Up_DataProvider:new()
    local instance = {}
    self.__index = self
    return setmetatable(instance, self)
end

-- Override this method to provide your custom data. Must return any string for displaying. NOT nil.
function Up_DataProvider:getText(addon)
    error("Data provider has no logic to provide data")
end