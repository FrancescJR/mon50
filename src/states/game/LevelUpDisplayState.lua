--[[
    GD50
    Pokemon

    Author: Colton Ogden
    cogden@cs50.harvard.edu
]]

LevelUpDisplayState = Class{__includes = BaseState}

function LevelUpDisplayState:init(levelStats)
print_r(levelStats);
    self.levelUpDisplay = AcknowledgeMenu {
        x = VIRTUAL_WIDTH - 64,
        y = VIRTUAL_HEIGHT - 64,
        width = 64,
        height = 64,
        items = {
            {
                text = 'HP',
            },
            {
                text = 'Attack',
            }
        }
    }
end

function LevelUpDisplayState:update(dt)
    self.levelUpDisplay:update(dt)
    if self.levelUpDisplay:isAcknowledged() then
        gStateStack:pop()
    end
end

function LevelUpDisplayState:render()
    self.levelUpDisplay:render()
end
