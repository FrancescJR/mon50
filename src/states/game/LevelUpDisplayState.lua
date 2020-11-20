LevelUpDisplayState = Class{__includes = BaseState}

function LevelUpDisplayState:init(pokemon, hpIncrease, attackIncrease, defenseIncrease, speedIncrease)
print_r(pokemon)
    self.levelUpDisplay = AcknowledgeMenu {
        x = VIRTUAL_WIDTH / 2 - 64,
        y = 32,
        width = 64 * 2,
        height = 150,
        items = {
            {
                text = "New stats:"
            },
            {
                text = LevelUpDisplayState:generateStatIncreaseText('HP', pokemon.HP, hpIncrease)
            },
            {
                text = LevelUpDisplayState:generateStatIncreaseText('Attack', pokemon.attack, attackIncrease)
            },
            {
                text = LevelUpDisplayState:generateStatIncreaseText('Defense', pokemon.defense, defenseIncrease)
            },
            {
                text = LevelUpDisplayState:generateStatIncreaseText('Speed', pokemon.speed, speedIncrease)
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

function LevelUpDisplayState:generateStatIncreaseText(stat, initialValue, statIncrease)
    local finalValue = initialValue + statIncrease
    return stat .. ': ' .. tostring(initialValue) .. ' + ' ..
            tostring(statIncrease) .. ' = ' .. tostring(finalValue)..".";
end
