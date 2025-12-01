local lvl={}

function lvl:load()
    map=sti("assets/tilemap/theLevel.lua")
    print("loaded!")
end

function lvl:update(dt)
    map:update(dt)
end

function lvl:draw()
    beginDraw()
        map:draw()
    endDraw()
end

return lvl