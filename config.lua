local conf = {}

conf.gW = 160
conf.gH = 144

conf.wW = conf.gW*5
conf.wH = conf.gH*5

conf.textureFilter = "nearest"
conf.fit = "pixel"
conf.render="layer"
conf.vsync=true

conf.input={
    controls={
        left={"key:left", "key:a"},
        right={"key:right", "key:d"},
        jump={"key:z", "key:up", "key:space"},
        gravity={"key:e"}, -- For testing
        
    },
    pairs={

    },
    joystick = love.joystick.getJoysticks()[1],
}

return conf