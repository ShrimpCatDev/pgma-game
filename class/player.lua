local entity = require("class/entity")
local player = entity:extend()

function player:new(x, y)
    player.super.new(self, x, y, 16, 16)
    self.speed = 120
    self.jump = false
end

function player:update(dt)
    self.vx = 0
    self.jump = false

    if input:down("left") then
        self.vx = -self.speed
    end
    if input:down("right") then
        self.vx = self.speed
    end

    player.super.update(self, dt)

    for i = 1, self.len do
        local col = self.col[i]
        if col.other.properties.platform and col.normal.y == -1 then
            self.jump = true
            self.vy = 0
        end
    end

    if input:pressed("jump") and self.jump then
        self.vy = -120
    end
end

function player:draw()
    lg.setColor(0.5, 0.5, 1)
    player.super.draw(self)
    lg.setColor(1, 1, 1, 1)
end

return player
