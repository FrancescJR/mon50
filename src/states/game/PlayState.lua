--[[
    GD50
    Pokemon

    Author: Colton Ogden
    cogden@cs50.harvard.edu
]]

PlayState = Class{__includes = BaseState}

function PlayState:init()
    self.level = Level()

    gSounds['field-music']:setLooping(true)
    gSounds['field-music']:play()

    --self.dialogueOpened = false
end

function PlayState:update(dt)
    if love.keyboard.wasPressed('p') then

        -- heal player pokemon
        gSounds['heal']:play()
        self.level.player.party.pokemon[1].currentHP = self.level.player.party.pokemon[1].HP

        -- show a dialogue for it, allowing us to do so again when closed
        gStateStack:push(DialogueState('Your Pokemon has been healed!',

        function()
            -- why do you need this, if the point of the lecture os that with the stack gStateStack
            -- you dont need to control stuff in teh update, since the update will only affect
            -- the active state, which at this point is not this play state...

            --self.dialogueOpened = false

            -- confirm, comenting and deleting this dialogueOpened does not affect the game....
        end))
    end

    self.level:update(dt)
end

function PlayState:render()
    self.level:render()
end
