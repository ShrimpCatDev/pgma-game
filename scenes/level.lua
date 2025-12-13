local lvl = {}

levelStats={
    "double jump",
    "flip gravity",
    "glide",
    "sprint"
    --etc...
}

function lvl:load()
    self.bgm=music.level
    self.bgm:setLooping(true)
    self.bgm:play()
    
    self.fade = require("fade")
    self.fade:init(conf.gW, -120)

    world = bump.newWorld()
    world.gravity = 900

    map = sti("assets/tilemap/theLevel.lua", {"bump"})
    map:bump_init(world)
    map.layers["collision"].visible = false

    print("loaded!")

    camera = {
        x = 0,
        y = 0
    }

    local p = require("class/player")
    local b = require("class/bot")
    local s = require("class/spike")


    player = p(20, 70)
    bot = b(100, 70)
    -- spike = s(150, 70)

    TIME = 0

    talkies.font = font
    talkies.padding = 4
    talkies.rounding = 2
    talkies.titleBackgroundColor = color("#2745fe")
    talkies.messageBackgroundColor = color("#000000")

    
    currentStatDialouge=levelStats[level]

    self.canTalk=false
    self.bgm:play()
end

function lvl:update(dt)
    map:update(dt)
    if not talkies.isOpen() then
        
        player:update(dt, lvl)
        local mapBottom = map.height * map.tileheight
        local mapTop = 0

        if player.y > mapBottom + 50 or player.y < mapTop - 50 then
            player:kill()
        end
        -- spike:update(dt)
        bot:update(dt)

        local dx = (player.x + player.w / 2) - (bot.x + bot.w / 2)
        local dy = (player.y + player.h / 2) - (bot.y + bot.h / 2)
        local dist = math.sqrt(dx * dx + dy * dy)

        local d=15

        if dist < d and not talkies.isOpen() and not self.nearBot and input:pressed("action") then
            self.nearBot = true
            player.anim.current=player.anim.idle
            talkies.say("bot", "hey there traveler! welcome.")
            talkies.say("bot", "the world is dangerous beyond this point.")
            talkies.say("bot", "everything just seems so familiar")
            talkies.say("bot", "hmmm, anyways")
            talkies.say("bot", "use your "..currentStatDialouge.." wisely.")
        end

        if dist<d then
            self.canTalk=true
        end

        if dist >= d then
            self.nearBot = false
            self.canTalk=false
        end
        camera.x = (player.x + player.w / 2) - conf.gW / 2
        camera.y = (player.y + player.h / 2) - conf.gH / 2

        camera.x = clamp(camera.x, 0, map.width * map.tilewidth - conf.gW)
        camera.y = clamp(camera.y, 0, map.height * map.tileheight - conf.gH)
    else
        if input:pressed("action") then
            talkies.onAction()
        elseif input:pressed("up") then
            talkies.prevOption()
        elseif input:pressed("down") then
            talkies.nextOption()
        end
    end
    player.anim.current:update(dt)
    bot.anim.idle:update(dt)
    self.fade:update(dt)
end

function lvl:draw()
    beginDraw()
    lg.push()
    lg.translate(math.floor(-camera.x), math.floor(-camera.y))
    map:draw(-camera.x, -camera.y)
    bot:draw()
    -- spike:draw()
    player:draw()
    lg.setColor(1, 1, 1)
    --[[lg.print("double jump: " .. tostring(player.doubleJump) .. "\ninverted grav: " .. player.gravM,
        math.floor(player.x - 40), math.floor(player.y - 40))]]
    if self.canTalk then
        local msg="x: talk"
        lg.setColor(0,0,0,1)

        local x,y=math.ceil(player.x),math.ceil(player.y)

        lg.print(msg,x+player.w/2-(font:getWidth(msg)/2)+1,y-8)
        lg.print(msg,x+player.w/2-(font:getWidth(msg)/2)-1,y-8)
        lg.print(msg,x+player.w/2-(font:getWidth(msg)/2),y-8+1)
        lg.print(msg,x+player.w/2-(font:getWidth(msg)/2),y-8-1)
        lg.setColor(1,1,1,1)
        lg.print(msg,x+player.w/2-(font:getWidth(msg)/2),y-8)
    end
    lg.translate(0, 0)
    lg.pop()
    talkies.draw()
    self.fade:draw()
    endDraw()
end

return lvl
