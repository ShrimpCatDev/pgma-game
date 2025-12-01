require("init")

function love.load()
    lg=love.graphics
    local sceneryInit=require("lib/scenery")
    scenery=sceneryInit("level","scenes")
    scenery:hook(love)
    font = require("assets/font/skull")
    lg.setFont(font)
    shove.createLayer("game")
end

function love.update(dt)
    input:update()
end 

function love.draw()
    
end
