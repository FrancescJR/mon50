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
