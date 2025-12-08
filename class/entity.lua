local entity = object:extend()

function entity:new(x, y, w, h)
    self.x = x or 0 --x yes
    self.y = y or 0 --y yes
    self.w = w or 16 --idk why i chose 16
    self.h = h or 16

    self.vx = 0
    self.vy = 0

    self.gravM = 1 -- gravity multiplier for entitys which have different weights

    world:add(self, self.x, self.y, self.w, self.h)

    self.filter=function(item,other)
        local p = other.properties
        if not p then
            return "slide"
        end
        if p.jumpthru and p.platform then
            if other.y>=item.y+item.h and item.vy>=0 then
                return "slide"
            else
                return nil
            end
        else
            return "slide"
        end
    end
end


function entity:update(dt)
    self.vy = self.vy + world.gravity * self.gravM * dt

    local terminalYVel = 500
    if self.vy > terminalYVel then self.vy = terminalYVel end

    local ax, ay, col, len = world:move(self, self.x + self.vx * dt, self.y + self.vy * dt,self.filter)
    self.x, self.y = ax, ay

    self.col = col
    self.len = len
end

function entity:draw()
    lg.rectangle("fill", self.x, self.y, self.w, self.h)
end

return entity
