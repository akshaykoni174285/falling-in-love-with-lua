
-- function love.load()
--     player = {}
--     player.x = 200
--     player.y = 200
--     player.speed = 3
--     player.sprites = love.graphics.newImage("/sprites/parrot.png")
--     background = love.graphics.newImage("sprites/maxresdefault (1).jpg")
-- end

-- function love.update(dt)
--     -- player.x = player.x + 1
--     if love.keyboard.isDown("right") then
--         player.x = player.x + player.speed
--     end
--     if love.keyboard.isDown("left") then
--         player.x = player.x - player.speed
--     end
--     if love.keyboard.isDown("up") then
--         player.y = player.y - player.speed
--     end
--     if love.keyboard.isDown("down") then
--         player.y = player.y + player.speed
--     end

-- end

-- function love.draw()
--     love.graphics.draw(background)
--     love.graphics.draw(player.sprites,player.x,player.y)
--     -- love.graphics.setColor(255,255,255)
-- end



function love.load()
    -- all the initialization 
    player = {}
    profile = love.graphics.newImage("sprites/parrot.png")
    background = love.graphics.newImage("sprites/background.png")
    player.x=love.graphics.getWidth()/2 - profile:getWidth()/2
    player.y=love.graphics.getHeight()/2 - profile:getHeight()/2
    player.speed = 3

end

function love.update(dt) 
    if love.keyboard.isDown("up") then
        player.y = player.y - player.speed
    end
    if love.keyboard.isDown("down") then
        player.y = player.y + player.speed
    end
    if love.keyboard.isDown("right") then
        player.x = player.x + player.speed
    end
    if love.keyboard.isDown("left") then
        player.x = player.x - player.speed
    end



end

function love.draw()
    love.graphics.draw(background)
    love.graphics.draw(profile,player.x,player.y)
    
end