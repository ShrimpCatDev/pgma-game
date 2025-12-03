local lvl={}

function lvl:load()
    world=bump.newWorld()
    world.gravity=900

    map=sti("assets/tilemap/theLevel.lua",{"bump"})
    map:bump_init(world)
    map.layers["collision"].visible=false
    
    print("loaded!")

    local p = require("class/player")
    player = p()
end

function lvl:update(dt)
    map:update(dt)
    player:update(dt)
end

function lvl:draw()
    beginDraw()
        map:draw()
        player:draw()
    endDraw()
end

return lvl