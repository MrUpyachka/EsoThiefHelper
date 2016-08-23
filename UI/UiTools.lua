-- Used to help with configuration of UI.
Up_UiTools = {}

-- Default size of shadows.
Up_UiTools.DEFAULT_INSET_SIZE = 16

-- Returns content wrapper for any window
function Up_UiTools.getContainer(widget)
    local container = widget.Container
    -- Check inner container/backdrop and use it as parent if its exists
    if container == nil then container = widget.Backdrop end
    if container == nil then container = widget.Root end
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
    return widget
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

-- Sets widget to switch visibility depends on compass visibility.
function Up_UiTools.configureToHideTogetherWithCompass(widget)
    -- Check that compass visible and follows by its state.
    local function hideWithCompass()
        if ZO_CompassFrame then
            widget:SetHidden(ZO_CompassFrame:IsHidden())
        end
    end
    EVENT_MANAGER:RegisterForUpdate(widget:GetName() .. "VisibilityHandler", 100, hideWithCompass)
end
