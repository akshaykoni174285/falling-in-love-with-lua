function love.load()
    wf = require "libraries/windfield/windfield"
    world = wf.newWorld(0,500)
    -- player = world:newRectangleCollider(love.graphics.getWidth()/2-50-2, love.graphics.getHeight()/2-50/2,50,50)
    player = world:newRectangleCollider(love.graphics.getWidth()/2-50/2, love.graphics.getHeight()/2-50/2,50,50)
    platform = world:newRectangleCollider(0,love.graphics.getHeight()-100,love.graphics.getWidth(),100)
    platform:setType("static")
    -- player_1 = world:newRectangleCollider(400,300,50,50)
    -- player_1:setType("ghost")
    
    -- player::setRestitution(0.8)
--     world = love.physics.newWorld(0,9.18)


--     objects = {}
--     --let's create the ground
--     objects.ground = {}
--     objects.ground.body = love.physics.newBody(world, 650/2, 650-50/2) --remember, the shape (the rectangle we create next) anchors to the body from its center, so we have to move it to (650/2, 650-50/2)
--     objects.ground.shape = love.physics.newRectangleShape(650, 50) --make a rectangle with a width of 650 and a height of 50
--     objects.ground.fixture = love.physics.newFixture(objects.ground.body, objects.ground.shape) --attach shape to body
  
--   --let's create a ball
--     objects.ball = {}
--     objects.ball.body = love.physics.newBody(world, 650/2, 650/2, "dynamic") --place the body in the center of the world and make it dynamic, so it can move around
--     objects.ball.shape = love.physics.newCircleShape( 20) --the ball's shape has a radius of 20
--     objects.ball.fixture = love.physics.newFixture(objects.ball.body, objects.ball.shape, 1) -- Attach fixture to body and give it a density of 1.
--     objects.ball.fixture:setRestitution(0.9) --let the ball bounce
    
end

function love.update(dt)
    if love.keyboard.isDown('left') then
        player:applyForce(-5000,0)
    end
    
    if love.keyboard.isDown('right') then
        player:applyForce(5000,0)
    end
    
    world:update(dt)
--     if player:enter('solid') then 
--         player:applyLinearImpulse(5000,0)
--         -- player:applyAngularImpulse(2000)
-- --     world:update(dt) --this puts the world into motion
--     end
--   --here we are going to create some keyboard events
--   if love.keyboard.isDown("right") then --press the right arrow key to push the ball to the right
--     objects.ball.body:applyForce(400, 0)
--   elseif love.keyboard.isDown("left") then --press the left arrow key to push the ball to the left
--     objects.ball.body:applyForce(-400, 0)
--   elseif love.keyboard.isDown("up") then --press the up arrow key to set the ball in the air
--     objects.ball.body:setPosition(650/2, 650/2)
--     objects.ball.body:setLinearVelocity(0, 0) --we must set the velocity to zero to prevent a potentially large velocity generated by the change in position
--   end
    
end

function love.draw()

    world:draw()
    -- love.graphics.setColor(0.28, 0.63, 0.05) -- set the drawing color to green for the ground
    -- love.graphics.polygon("fill", objects.ground.body:getWorldPoints(objects.ground.shape:getPoints())) -- draw a "filled in" polygon using the ground's coordinates
    -- love.graphics.setColor(0.76, 0.18, 0.05) --set the drawing color to red for the ball
    -- love.graphics.circle("fill", objects.ball.body:getX(), objects.ball.body:getY(), objects.ball.shape:getRadius())
  

end

function love.keypressed(key)
    if key == "up" then
        player:applyLinearImpulse(0,-2500)
    end
end