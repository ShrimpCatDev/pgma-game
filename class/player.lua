local e=require("class/entity")
local pl=e:extend()

function pl:new(x,y)
    pl.super.new(self,x,y,16,16)
end

function pl:update(dt)
    pl.super.update(self,dt)
end

function pl:draw()
    pl.super.draw(self)
end

return pl