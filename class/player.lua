local entity = require("class/entity")
local player = entity:extend()

function player:new(x, y)
    player.super.new(self, x, y, 16, 16)

    -- Player Specific
    self.maxSpeed = 70
    self.jump = false
    
end

function player:update(dt)
    part.update(dt)


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

    if input:pressed("gravity") then
        self.gravM = -self.gravM
    end

    local max = self.maxSpeed
    if self.vx > max then self.vx = max end
    if self.vx < -max then self.vx = -max end


    player.super.update(self, dt)

    for i = 1, self.len do
        local col = self.col[i]
        if col.other.properties.platform and col.normal.y == -self.gravM  then
            if math.abs(self.vy) < 50 then
                self.vy = 0
                self.jump = true
            else
                self.vy = self.vy * 0.1
            end
            local velocityHeight = 20 -- Change to 30
            if not self.jump and self.vy > velocityHeight then
                self:spawnShockwave(self.x + self.w / 2, self.y + self.h)
            end
        end
    end

    if input:pressed("jump") and self.jump then
        self.vy = -250 * self.gravM
    end
end

function player:draw()
    lg.setColor(0.5, 0.5, 1)
    player.super.draw(self)
    lg.setColor(1, 1, 1, 1)
    part.draw()
end

function player:spawnShockwave(x, y)
    local amt = 40
    local function drawDust(x, y, life, data)
        local t = math.max(life, 0)
        local a = t * 2.5
        local r = data.size * t
        lg.setColor(1,1,1, a)
        lg.circle("fill", x, y, r)
    end
    local baseX = x
    local baseY = y
    local half = amt / 2
    for i = 1, amt do
        local offset = i - half
        x = baseX + offset * 0.5
        y = baseY - math.random(-2, 2)

        local size = 2
        local angle = math.rad(love.math.random(0, 180))
        local vx = math.sin(angle)
        local vy = -20 + math.cos(angle)

        part.new(
            x, y,
            vx, vy,
            -vx * 1.5, -vy * 1.5,
            0.2 + love.math.random(0.1, 0.3),
            drawDust,
            nil,
            { size = size }
        )
    end
end

return player
