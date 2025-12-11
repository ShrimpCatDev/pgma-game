local entity = require("class/entity")
local spike = entity:extend()

function spike:new(x, y)
    spike.super.new(self, x, y, 16, 16)
    self.isSpike = true
    self.filter = function(item, other)
        if other.properties and other.properties.platform then
            return "slide"
        end
        return "cross"
    end
end

function spike:update(dt)
    spike.super.update(self, dt)
end

function spike:draw()
    lg.setColor(1, 0.5, 1)
    spike.super.draw(self)
    lg.setColor(1, 1, 1, 1)
end

return spike
