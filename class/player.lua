local e=require("class/entity")
local pl=e:extend()

function pl:new(x,y)
    pl.super.new(self,x,y,16,16)
    self.spd=120
    self.jump=false
end

function pl:update(dt)
    self.vx=0
    self.jump=false

    if input:down("left") then
        self.vx=-self.spd
    end
    if input:down("right") then
        self.vx=self.spd
    end

    pl.super.update(self,dt)

    for i=1,self.len do
        local col=self.col[i]
        if col.other.properties.platform and col.normal.y==-1 then
            self.jump=true
            self.vy=0
        end
    end

    if input:pressed("jump") and self.jump then
        self.vy=-120
    end
end

function pl:draw()
    lg.setColor(0.5,0.5,1)
    pl.super.draw(self)
    lg.setColor(1,1,1,1)
end

return pl