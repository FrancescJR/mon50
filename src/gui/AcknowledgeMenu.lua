--[[
    GD50
    Pokemon

    Author: Colton Ogden
    cogden@cs50.harvard.edu

    A Menu is simply a Selection layered onto a Panel, at least for use in this
    game. More complicated Menus may be collections of Panels and Selections that
    form a greater whole.
]]

AcknowledgeMenu = Class{}

function AcknowledgeMenu:init(def)
    self.panel = Panel(def.x, def.y, def.width, def.height)

    self.selection = DisabledSelection {
        items = def.items,
        x = def.x,
        y = def.y,
        width = def.width,
        height = def.height
    }
end

function AcknowledgeMenu:render()
    self.panel:render()
    self.selection:render()
end

function AcknowledgeMenu:isAcknowledged()
    return self.selection.acknowledged;
end

function AcknowledgeMenu:update(dt)
    self.selection:update(dt)
end
