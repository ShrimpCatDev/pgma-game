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

    local max = self.maxSpeed
    if self.vx > max then self.vx = max end
    if self.vx < -max then self.vx = -max end


    player.super.update(self, dt)

    for i = 1, self.len do
        local col = self.col[i]
        if col.other.properties.platform and col.normal.y == -1 then
            if math.abs(self.vy) < 50 then
                self.vy = 0
                self.jump = true
            else
                self.vy = self.vy * 0.1
            end
            if not self.jump then
                self:spawnShockwave(self.x, self.y)
            end
        end
    end

    if input:pressed("jump") and self.jump then
        self.vy = -250 * self.gravM
    end
end

function player:draw()
    part.draw()
    lg.setColor(0.5, 0.5, 1)
    player.super.draw(self)
    lg.setColor(1, 1, 1, 1)
end

function player:spawnShockwave(x, y)
    local amt = 20
    local function drawDust(x, y, life, data)
        local t = math.max(life, 0)
        local a = t * 2.5
        local r = data.size * t
        lg.setColor(0.8, 0.8, 0.8, a)
        lg.circle("fill", x, y, r)
    end
    for i = 1, amt do
        local ang = (i / amt) * math.pi / 2
        local speed = 80 + math.random() * 40
        local size = 6 + math.random() * 4

        local vx = math.cos(ang) * speed
        local vy = math.cos(ang) * speed

        part.new(
            x, y,
            vx, vy,
            -vx * 1.5, -vy * 1.5,
            0.4,
            drawDust,
            nil,
            { size = size }

        )
    end
end

return player
