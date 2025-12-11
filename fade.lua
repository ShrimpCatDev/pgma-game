local fade={}
fade.timer=require("lib/hump/timer")

function fade:init(firstValue,lastValue,func)
    self.timer.clear()
    self.x=0
    self.y=0
    self.w=firstValue
    self.h=conf.gH
    self.open=true

    self.timer.tween(0.8,self,{w=lastValue},"out-cubic",function()
        self.open=false
        if func then func() end
    end)
end

function fade:update(dt)
    self.timer.update(dt)
end

function fade:draw()
    local r,g,b,a=lg.getColor()
    lg.setColor(0,0,0,1)
        lg.rectangle("fill",self.x,self.y,self.w,self.h)
    lg.setColor(r,g,b,a)
end

return fade