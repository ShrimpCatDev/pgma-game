local entity = require("class/entity")
local player = entity:extend()

local function sign(n)
    if n < 0 then
        return -1
    elseif n > 0 then
        return 1
    else
        return 0
    end
end

function player:new(x, y)
    player.super.new(self, x, y, 12, 16)

    self.spawnX = x
    self.spawnY = y

    -- Player Specific
    self.maxSpeed = 70

    self.walkSpeed = 70
    self.runSpeed = 100

    self.maxJumps = 3
    self.trail = {
        enabled = false,
        points = {},
        maxPoints = 10,
    }
    self.jumps = self.maxJumps
    self.doubleJump = false
    self.isGrounded = false

    self.sheet = lg.newImage("assets/sprite/player.png")
    local g = anim8.newGrid(16, 16, self.sheet:getWidth(), self.sheet:getHeight())
    self.anim = {
        run = anim8.newAnimation(g('1-12', 1), 0.05),
        idle = anim8.newAnimation(g('1-6', 2), 0.1)
    }
    self.anim.current = self.anim.idle
    self.direction = 1
end

local function round(num)
    return math.floor(num)
end

function player:kill()
    self.gravM = 1
    self.direction = 1
    self.x = self.spawnX
    self.y = self.spawnY
    self.vx = 0
    self.vy = 0

    if world.update then
        world:update(self, self.x, self.y, self.w, self.h)
    else
        world:remove(self)
        world:add(self, self.x, self.y, self.w, self.h)
    end

    self.col = {}
    self.len = 0
end

function player:update(dt,scene)
    part.update(dt)
    self.isGrounded = false


    local acceleration = 1000
    local friction = 2000

    local moved=false
    if input:down("left") then
        self.vx = self.vx - acceleration * dt
        self.direction = -1
        moved=true
    elseif input:down("right") then
        self.vx = self.vx + acceleration * dt
        self.direction = 1
        moved=true
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

    if input:pressed("djump") then
        self.doubleJump = not self.doubleJump
    end

    if input:pressed("kill") then
        self:kill()
    end

    local max = self.maxSpeed

    if input:down("run") then
        max = self.runSpeed
    end

    if input:down("glide") and not self.isGrounded then
        if self.gravM > 0 then
            self.gravM = 0.2
        else
            self.gravM = -0.2
        end
        self.trail.enabled = true
    else
        if self.gravM > 0 then
            self.gravM = 1
        else
            self.gravM = -1
        end
        self.trail.enabled = false
    end

    if self.trail.enabled then
        table.insert(self.trail.points, self.x + self.w / 2)
        table.insert(self.trail.points, self.y + self.h / 2)
        if #self.trail.points > self.trail.maxPoints * 2 then
            table.remove(self.trail.points, 1)
            table.remove(self.trail.points, 1)
        end
    else
        self.trail.points = {}
    end

    if self.vx > max then self.vx = max end
    if self.vx < -max then self.vx = -max end


    player.super.update(self, dt)

    for i = 1, self.len do
        local col = self.col[i]
        if col.other.properties and col.other.properties.platform and col.normal.y == -self.gravM then
            if math.abs(self.vy) < 50 then
                self.vy = 0
                self.isGrounded = true
                self.jumps = self.doubleJump and self.maxJumps or 1
            else
                self.vy = self.vy * 0.1
            end
            local velocityHeight = 20 -- Change to 30
            if not self.jump and self.vy > velocityHeight then
                self:spawnShockwave(self.x + self.w / 2, self.y + self.h, true)
            end
        end
        if col.other.properties and col.other.properties.platform and col.normal.y == sign(self.gravM) then
            self.vy = 0
        end
    end
    for i = 1, self.len do
        local col = self.col[i]

        if col.other.isSpike then
            self:kill()
        end
    end
    if input:pressed("jump") and self.jumps > 0 then
        self.vy = -250 * self.gravM
        if not self.isGrounded then
            self:spawnShockwave(self.x + self.w / 2, self.y + self.h, false)
        end
        self.jumps = self.jumps - 1
    end
    print(self.isGrounded)

    if moved then
        self.anim.current=self.anim.run
    else
        self.anim.current=self.anim.idle
    end
    self.anim.current:update(dt)
end

function player:draw()
    lg.setColor(0.5, 0.5, 1, 0)
    player.super.draw(self)
    lg.setColor(1, 1, 1, 1)
    if #self.trail.points > 2 then
        lg.line(self.trail.points)
    end
    if self.gravM > 0 then
        self.anim.current:draw(self.sheet, round(self.x + 7), round(self.y + 8), 0, self.direction, 1, 8, 8)
    else
        self.anim.current:draw(self.sheet, round(self.x + 7), round(self.y + 8), 0, self.direction, -1, 8, 8)
    end
    part.draw()
end

function player:spawnShockwave(x, y, vDep)
    local amt = 35 * (vDep and self.vy / 20 or 1)
    -- @param vDep - Velocity Dependent
    local function drawDust(x, y, life, data)
        local t = math.max(life, 0)
        local a = t * 2.5
        local r = data.size * t
        lg.setColor(1, 1, 1, a)
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
