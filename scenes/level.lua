local lvl={}

function lvl:load()
    world=bump.newWorld()
    world.gravity=900

    map=sti("assets/tilemap/theLevel.lua",{"bump"})
    map:bump_init(world)
    map.layers["collision"].visible=false
    
    print("loaded!")

    camera={x=0,y=0}

    local p = require("class/player")
    player = p()
end

function lvl:update(dt)
    map:update(dt)
    player:update(dt)
    camera.x=(player.x+player.w/2)-conf.gW/2
    camera.y=(player.y+player.h/2)-conf.gH/2
end

function lvl:draw()
    beginDraw()
        lg.push()
            lg.translate(-camera.x,-camera.y)
                map:draw(-camera.x,-camera.y)
                player:draw()
            lg.translate(0,0)
        lg.pop()
    endDraw()
end

return lvl