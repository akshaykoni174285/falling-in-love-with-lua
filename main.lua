-- * so every love game has three main components 

function love.load()
    -- number = 0
    -- let us specify the table for the x ,y and radius 
    target = {}
    target.x = 200
    target.y = 200
    target.radius = 50
    gamefont = love.graphics.newFont(40)
    score = 0
    timer = love.timer.getTime()
end

function love.update(dt)

    
end

function love.draw()
    -- love.graphics.setColor(255,0,0)
    -- love.graphics.rectangle("fill",400,300,100,50)
    -- love.graphics.setColor(255,255,0) how you fill a color in a shape 
    -- note it will work as layers so if you put first and then another image on top then it will be drawn on top of the circle 
    love.graphics.setColor(255,0,0)
    love.graphics.circle("fill",target.x,target.y,target.radius)

    love.graphics.setFont(gamefont)
    love.graphics.setColor(255,255,255)
    love.graphics.print(score,0,0)

    -- love.graphics.print(,0,70)

    -- love.graphics.print(timer,0,70)
end

function love.mousepressed( x, y, button, istouch, presses )
    if button == 1 then
        width,height,flags = love.window.getMode()
        random_x = math.random(target.radius,width-target.radius)
        random_y = math.random(target.radius,height-target.radius)
        
        local mousetodistance = distanceBetween(x,y,target.x,target.y)
        if mousetodistance <= target.radius then
            score=score +1
        end
        target.x = random_x
        target.y = random_y    
    end
end

function distanceBetween(x1,y1,x2,y2)
    
    distance = math.sqrt( (x2-x1)^2 + (y2-y1)^2 )
    return distance
end

