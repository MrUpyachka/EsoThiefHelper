-- Used to help with configuration of UI.
Up_UiTools = {}

-- Default size of shadows.
Up_UiTools.DEFAULT_INSET_SIZE = 16

-- Returns content wrapper for any window
function Up_UiTools.getContainer(widget)
    local container = widget.Container
    -- Check badrop and use it as parent if its exists
    if container == nil then container = widget end
    return container
end

-- Returns content wrapper for any window
function Up_UiTools.addShadow(widget)
    local insetSize = Up_UiTools.DEFAULT_INSET_SIZE
    widget:SetInsets(insetSize, insetSize, -insetSize, -insetSize)
    widget:SetEdgeTexture("EsoUI/Art/ChatWindow/chat_BG_edge.dds", 256, 256, insetSize)
    widget:SetCenterTexture("EsoUI/Art/ChatWindow/chat_BG_center.dds")
    widget:SetAlpha(0.7)
    widget:SetDrawLayer(0) -- TODO check better solution
    return container
end

-- Configures window as floating.
function Up_UiTools.configureAsFloat(widget, position)
    widget:SetMovable(true)
    local function onMoveStop(self)
        position.OffsetX = self:GetLeft()
        position.OffsetY = self:GetTop()
    end
    widget:SetHandler("OnMoveStop", onMoveStop)
end