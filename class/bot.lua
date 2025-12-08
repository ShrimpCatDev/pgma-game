local entity = require("class/entity")
local bot = entity:extend()

function bot:new(x, y)
    bot.super.new(self, x, y, 16, 16)
    self.midpoint = { x = self.x + self.w / 2 ,y = self.y + self.h / 2}
end



function bot:update(dt)

    local acceleration = 0 or math.sin(love.timer.getTime())  * 2 -- Remove 0 or if u want the bot to move

    self.vx = self.vx + acceleration * dt
    bot.super.update(self, dt)

end

function bot:draw()
    lg.setColor(1, 0.5, 0.5)
    bot.super.draw(self)
    lg.setColor(1, 1, 1, 1)

end

return bot
