local lvl = {}

function lvl:load()
    world = bump.newWorld()
    world.gravity = 900

    map = sti("assets/tilemap/theLevel.lua", { "bump" })
    map:bump_init(world)
    map.layers["collision"].visible = false

    print("loaded!")

    camera = { x = 0, y = 0 }
    CloudShader = lg.newShader("shaders/cloud.glsl")

    local p = require("class/player")
    player = p(20, 70)
    TIME = 0
end

function lvl:update(dt)
    TIME = TIME + dt
    map:update(dt)
    player:update(dt)
    camera.x = (player.x + player.w / 2) - conf.gW / 2
    camera.y = (player.y + player.h / 2) - conf.gH / 2

    camera.x = clamp(camera.x, 0, map.width * map.tilewidth - conf.gW)
    camera.y = clamp(camera.y, 0, map.height * map.tileheight - conf.gH)

    CloudShader:send("iTime", TIME)
    CloudShader:send("iResolution", { lg.getWidth(), lg.getHeight() })
end

function lvl:draw()
    beginDraw()
        lg.setBlendMode("alpha", "premultiplied")

            lg.setShader(CloudShader)
                lg.rectangle("fill", 0, 0, lg.getWidth(), lg.getHeight())
            lg.setShader()

        lg.setBlendMode("alpha")

        lg.push()
            lg.translate(-camera.x, -camera.y)
            map:draw(-camera.x, -camera.y)
            player:draw()
            lg.translate(0, 0)
        lg.pop()
    endDraw()
end

return lvl
