-- local anim8 = require '/libraries/anim8'
-- we also be needing sti to draw the map for us 
-- so to use the camera we are gonna need a package called hump 

function love.load()
    local anim8 = require '/libraries/anim8'
    love.graphics.setDefaultFilter("nearest","nearest")
    Camera = require '/libraries/hump.camera'
    cam = Camera()
    local sti = require "/libraries/sti"
    gamemap = sti("/maps/titles_map.lua")
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
    cam:lookAt(player.x, player.y)

end

function love.draw()
    cam:attach()
        -- gamemap:draw()
        -- keep in mind that first ground will be drawn and then trees and then tiles 
        gamemap:drawLayer(gamemap.layers["ground"])
        gamemap:drawLayer(gamemap.layers["trees"])
        gamemap:drawLayer(gamemap.layers["tiles"])
    -- love.graphics.setColor(255,255,255)
    -- love.graphics.draw(player.sprites,player.x,player.y)
    -- love.graphics.circle("fill",player.x,player.y,player.radius)
    -- love.graphics.setColor(255,255,255)
        player.anim:draw(player.spritesheet,player.x,player.y,nil,5)
    cam:detach()
end
