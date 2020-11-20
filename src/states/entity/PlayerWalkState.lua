--[[
    GD50
    Pokemon

    Author: Colton Ogden
    cogden@cs50.harvard.edu
]]

PlayerWalkState = Class{__includes = EntityWalkState}

function PlayerWalkState:init(entity, level)
    -- ????? you need to start the parent state? OMGosh, I understand why in /Zelda
    -- there were so many bugs... (yeah, this was not done.)
    EntityWalkState.init(self, entity, level)
    self.encounterFound = false

    -- going to test this thing about init/enter which the way the state machine is defined
    -- I believe is just redundant and confusing...
end

function PlayerWalkState:enter()
    -- OK i thisc ase it has weird behaviour were player walks in diagonal :D
    -- I tihnk its calling the funcitonjust twice in a row., well If I delete it from the entitywalk state
    -- then its ok... But undoing it.
    self:checkForEncounter()

    if not self.encounterFound then
        self:attemptMove()
    end
end

function PlayerWalkState:checkForEncounter()
    local x, y = self.entity.mapX, self.entity.mapY

    -- chance to go to battle if we're walking into a grass tile, else move as normal
    if self.level.grassLayer.tiles[y][x].id == TILE_IDS['tall-grass'] and math.random(10) == 1 then
        self.entity:changeState('idle')

        -- trigger music changes
        gSounds['field-music']:pause()
        gSounds['battle-music']:play()

        -- first, push a fade in; when that's done, push a battle state and a fade
        -- out, which will fall back to the battle state once it pushes itself off
        gStateStack:push(
            FadeInState({
                r = 1, g = 1, b = 1,
            }, 1,
            -- callback that will execute once the fade in is complete
            function()
                gStateStack:push(BattleState(self.entity))
                gStateStack:push(FadeOutState({
                    r = 1, g = 1, b = 1,
                }, 1,

                function()
                    -- nothing to do or push here once the fade out is done
                end))
            end)
        )

        self.encounterFound = true
    else
        self.encounterFound = false
    end
end
