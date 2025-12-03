local entity = require("class/entity")
local player = entity:extend()

function player:new(x, y)
    player.super.new(self, x, y, 16, 16)

    -- Player Specific
    self.maxSpeed = 70
    self.jump = false
end

function player:update(dt)
    local acceleration = 1000
    local friction = 2000

    self.jump = false

    if input:down("left") then
        self.vx = self.vx - acceleration * dt
    elseif input:down("right") then
        self.vx = self.vx + acceleration * dt
    else
        if self.vx > 0 then
            self.vx = self.vx - friction * dt
            if self.vx < 0 then self.vx = 0 end
        elseif self.vx < 0 then
            self.vx = self.vx + friction * dt
            if self.vx > 0 then self.vx = 0 end
        end
    end

    local max = self.maxSpeed
    if self.vx > max then self.vx = max end
    if self.vx < -max then self.vx = -max end


    player.super.update(self, dt)

    for i = 1, self.len do
        local col = self.col[i]
        if col.other.properties.platform and col.normal.y == -1 then
            self.jump = true
            if math.abs(self.vy) < 50 then
                self.vy = 0
            else
                self.vy = self.vy * 0.1
            end
        end
    end

    if input:pressed("jump") and self.jump then
        self.vy = -250
    end
end

function player:draw()
    lg.setColor(0.5, 0.5, 1)
    player.super.draw(self)
    lg.setColor(1, 1, 1, 1)
end

return player
