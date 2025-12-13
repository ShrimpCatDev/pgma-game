local entity = require("class/entity")
local bot = entity:extend()

function bot:new(x, y)
    bot.super.new(self, x, y, 16, 16)
    self.midpoint = { x = self.x + self.w / 2 ,y = self.y + self.h / 2}
    self.sheet=lg.newImage("assets/sprite/bot.png")
    local g = anim8.newGrid(16, 16, self.sheet:getWidth(), self.sheet:getHeight())
    self.anim={
        idle=anim8.newAnimation(g("1-17",1),0.1)
    }
end

function bot:update(dt)

    local acceleration = 0 or math.sin(love.timer.getTime())  * 2 -- Remove 0 or if u want the bot to move

    self.vx = self.vx + acceleration * dt
    bot.super.update(self, dt)
end

function bot:draw()
    lg.setColor(1, 1, 1, 1)
    local d=-1
    if self.x+self.w/2<=player.x then
        d=1
    end
    self.anim.idle:draw(self.sheet,self.x+self.w/2,self.y+self.h/2,0,d,1,self.w/2,self.h/2)
end

return bot
