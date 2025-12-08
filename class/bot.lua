local entity = require("class/entity")
local bot = entity:extend()

function bot:new(x, y)
    bot.super.new(self, x, y, 16, 16)
end



function bot:update(dt)

    local acceleration = math.sin(love.timer.getTime())  * 2
    self.vx = self.vx + acceleration * dt
    bot.super.update(self, dt)

end

function bot:draw()
    lg.setColor(1, 0.5, 0.5)
    bot.super.draw(self)
    lg.setColor(1, 1, 1, 1)

end

return bot
