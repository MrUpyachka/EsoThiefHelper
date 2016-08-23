--[[
-- Used as container with padding for content and backdrop for stylization.
-- <root><backdrop><container></container></backdrop></root>
]] --
Up_InfoContainer = {}

function Up_InfoContainer:new(id, root, backdrop, container)
    local instance = { ID = id, Root = root, Backdrop = backdrop, Container = container, LabelsList = {} }
    self.__index = self
    return setmetatable(instance, self)
end
