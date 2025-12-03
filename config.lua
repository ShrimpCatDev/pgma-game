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
        left={"key:left"},
        right={"key:right"},
        jump={"key:z"}
    },
    pairs={

    },
    joystick = love.joystick.getJoysticks()[1],
}

return conf