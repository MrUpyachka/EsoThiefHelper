-- Used to create widgets.
Up_UiFactory = {}

--[[
    TODO list
    # Configure layouts in xml.
    ]] --

-- System window manager. Same as GetWindowManager(). See globalvars.lua
local windowManager = GetWindowManager()

-- Produces simple top level container.
function Up_UiFactory.createWindow(id)
    local container = windowManager:CreateTopLevelWindow(id)
    container:SetClampedToScreen(true)
    container:SetMouseEnabled(true)
    container:SetResizeToFitDescendents(true)
    container:SetAnchor(TOPLEFT, GuiRoot, TOPLEFT, 0, 0)
    container:SetHidden(false)
    return container
end

-- Produces simple container.
function Up_UiFactory.createContainer(id, parent, type)
    local backdrop = windowManager:CreateControl("$(parent)_" .. id, parent, type)
    backdrop:SetClampedToScreen(true)
    backdrop:SetResizeToFitDescendents(true)
    backdrop:SetAnchor(TOPLEFT, parent, TOPLEFT, 0, 0)
    backdrop:SetHidden(false)
    return backdrop
end

-- Produces window with shadow backdrop.
function Up_UiFactory.createShadowWindow(id, padding)
    local root = Up_UiFactory.createWindow(id)

    local backdrop = Up_UiFactory.createContainer("backdrop", root, CT_BACKDROP)
    backdrop:SetResizeToFitPadding(2 * padding, 2 * padding)
    backdrop:SetAnchor(TOPLEFT, root, TOPLEFT, 0, 0)
    Up_UiTools.addShadow(backdrop)

    local container = Up_UiFactory.createContainer("container", backdrop, CT_CONTROL)
    container:SetAnchor(TOPLEFT, backdrop, TOPLEFT, padding, padding)

    return Up_InfoContainer:new(id, root, backdrop, container)
end

-- Creates label and adds it to specified container.
function Up_UiFactory.createNormalLabel(id, parent)
    local container = Up_UiTools.getContainer(parent)
    local label = windowManager:CreateControl("$(parent)_" .. id, container, CT_LABEL)
    label:SetColor(0.8, 0.8, 0.8, 1) -- TODO custom color
    label:SetFont("ZoFontGameMedium")
    label:SetWrapMode(TEX_MODE_CLAMP)
    return label
end
