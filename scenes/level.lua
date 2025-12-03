local lvl={}

function lvl:load()
    world=bump.newWorld()
    world.gravity=240

    map=sti("assets/tilemap/theLevel.lua",{"bump"})
    map:bump_init(world)
    map.layers["collision"].visible=false
    
    print("loaded!")

    local p=require("class/entity")
    pl=p()
end

function lvl:update(dt)
    map:update(dt)
    pl:update(dt)
end

function lvl:draw()
    beginDraw()
        map:draw()
        pl:draw()
    endDraw()
end

return lvl