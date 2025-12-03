local entity = require("class/entity")
local player = entity:extend()

function player:new(x, y)
    player.super.new(self, x, y, 16, 16)

    -- Player Specific
    self.accel = 0
    self.maxSpeed = 120
    self.jump = false
end

function player:update(dt)
    local acceleration = 600
    local friction = 800

    self.jump = false

    if input:down("left") then
        self.accel = -acceleration
    elseif input:down("right") then
        self.accel = acceleration
    else
        if self.vx > 0 then
            self.vx = self.vx - friction * dt
            
        elseif self.vx < 0 then
            self.accel = friction
        else
            self.accel = 0
        end
    end

    self.vx = self.vx + self.accel * dt

    if self.vx > self.maxSpeed then
        self.vx = self.maxSpeed
    elseif self.vx < -self.maxSpeed then
        self.vx = -self.maxSpeed
    end

    if math.abs(self.vx) < 1 then
        self.vx = 0
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
