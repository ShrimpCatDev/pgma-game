local chatbox = object:extend()

function chatbox:new(x, y, texts, interactKey)
    self.x = x
    self.y = y
    self.w = 16
    self.h = 16
    self.index = 1
    self.texts = texts or { "Hello!", "This is a chatbox.", "Goodbye!" }
    self.displayText = ""
    self.active = false
    self.interactKey = interactKey or input:pressed("interact")
end

function chatbox:update(dt)
    if self.active then
    end
end