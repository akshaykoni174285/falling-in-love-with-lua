local image,animation



function love.load()

local anim8 = require "/libraries/anim8"

image = love.graphics.newImage("sources/player-sheet.png")
local g = anim8.newGrid(12,18,image:getWidth(),image:getHeight())
player.animation = {}
player.animation.down = anim8.newAnimation(g('1-4',1),0.1)
player.animation.left = anim8.newAnimation(g('1-4',2),0.1)
player.animation.right = anim8.newAnimation(g('1-4',3),0.1)
player.animation.up = anim8.newAnimation(g('1-4',4),0.1)
player.anim = player.animation.left

player.speed = 3
background = love.graphics.newImage("sources/maxresdefault (1).jpg")
player = {}
player.x = love.graphics.getWidth()/2 
player.y =love.graphics.getHeight()/2 



end


function love.update(dt)
    if love.keyboard.isDown("up") then
        player.y = player.y-player.speed
        player.anim = player.animation.up
    end
    if love.keyboard.isDown("down") then
        player.y = player.y+player.speed
        player.anim = player.animation.up
    end
    if love.keyboard.isDown("left") then
        player.x = player.x-player.speed
        player.anim = player.animation.up
    end
    if love.keyboard.isDown("right") then
        player.x = player.x+player.speed
        player.anim = player.animation.up
    end



player.anim:update(dt)

end

function love.draw()
    love.graphics.draw(background)
    -- animation.draw(image,player.x,player.y)
    player.anim:draw(image,player.x,player.y,nil,5)

end