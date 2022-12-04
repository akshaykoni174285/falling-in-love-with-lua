-- local anim8 = require '/libraries/anim8'

function love.load()
    local anim8 = require '/libraries/anim8'
    love.graphics.setDefaultFilter("nearest","nearest")

    local sti = require "/libraries/sti"
    gamemap = sti("/maps/test_map.lua")
    player = {}
    player.x = 200
    player.y = 200
    player.speed = 3
    player.radius =50
    -- player.sprites = love.graphics.newImage("/sprites/parrot.png")
    background = love.graphics.newImage("sources/maxresdefault (1).jpg")
    player.spritesheet = love.graphics.newImage("sources/player-sheet.png")
    player.grid = anim8.newGrid(12,18,player.spritesheet:getWidth(), player.spritesheet:getHeight())
    player.animation = {}
    player.animation.down = anim8.newAnimation(player.grid('1-4',1),0.1)
    player.animation.left = anim8.newAnimation(player.grid('1-4',2),0.1)
    player.animation.right = anim8.newAnimation(player.grid('1-4',3),0.1)
    player.animation.up = anim8.newAnimation(player.grid('1-4',4),0.1)
    player.anim = player.animation.left
end

function love.update(dt)
    local ismoving = false
    -- player.x = player.x + 1
    if love.keyboard.isDown("right") then
        player.x = player.x + player.speed
        player.anim = player.animation.right
        ismoving = true
        -- player.animation.right:update(dt)
    end
    if love.keyboard.isDown("left") then
        player.x = player.x - player.speed
        player.anim = player.animation.left
        ismoving = true


        -- player.animation.left:update(dt)
    end
    if love.keyboard.isDown("up") then
        player.y = player.y - player.speed
        player.anim = player.animation.up
        ismoving = true

        -- player.animation.up:update(dt)
    end
    if love.keyboard.isDown("down") then
        player.y = player.y + player.speed
        player.anim = player.animation.down
        ismoving = true

        -- player.animation.down:update(dt)
    end
    
    if ismoving == false then
        player.anim:gotoFrame(2)
    end    

    player.anim:update(dt)

end

function love.draw()
    gamemap:draw()
    -- love.graphics.setColor(255,255,255)
    -- love.graphics.draw(player.sprites,player.x,player.y)
    -- love.graphics.circle("fill",player.x,player.y,player.radius)
    -- love.graphics.setColor(255,255,255)
    player.anim:draw(player.spritesheet,player.x,player.y,nil,5)
    
end
