local lvl = {}

function lvl:load()
    self.fade=require("fade")
    self.fade:init(conf.gW,-120)

    world = bump.newWorld()
    world.gravity = 900

    map = sti("assets/tilemap/theLevel.lua", { "bump" })
    map:bump_init(world)
    map.layers["collision"].visible = false

    print("loaded!")

    camera = { x = 0, y = 0 }

    local p = require("class/player")
    local b = require("class/bot")
    local s = require("class/spike")
    player = p(20, 70)
    bot = b(100, 70)
    spike = s(150, 70)

    TIME = 0
end

function lvl:update(dt)
    if not self.fade.open then
        map:update(dt)
        player:update(dt,self)
        spike:update(dt)
        bot:update(dt)
        camera.x = (player.x + player.w / 2) - conf.gW / 2
        camera.y = (player.y + player.h / 2) - conf.gH / 2

        camera.x = clamp(camera.x, 0, map.width * map.tilewidth - conf.gW)
        camera.y = clamp(camera.y, 0, map.height * map.tileheight - conf.gH)
    end
    self.fade:update(dt)
end

function lvl:draw()
    beginDraw()
        lg.push()
            lg.translate(math.floor(-camera.x), math.floor(-camera.y))
            map:draw(-camera.x, -camera.y)
            bot:draw()
            spike:draw()
            player:draw()
            lg.setColor(1,1,1)
            lg.print("double jump: "..tostring(player.doubleJump).."\ninverted grav: "..player.gravM, math.floor(player.x - 40), math.floor(player.y - 40))
            lg.translate(0, 0)
        lg.pop()
        self.fade:draw()
    endDraw()
end

return lvl
