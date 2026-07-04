local Resources = require "src.Resources"
local Concord = require "lib.Concord"

local Death = {}

function Death:init()
  local Systems = {}
  Concord.utils.loadNamespace("src/systems", Systems)

  local gameover = Resources.manager:get("gameover")
  Concord.entity(self.world)
    :give("position", Resources.cx * 0.5 - gameover:getWidth() * 0.5, 67)
    :give("sprite", gameover)
    :give("fade", 5, false)
    :give("colour", 1,1,1,0)
    :give("move_ease", 100, 120, 0.2, "inOutQuad")
    :give("gameover")
    :give("layer", 67)
end

function Death:update(dt)
  self.world:emit("update", dt)
end

function Death:draw()
  Resources.canvas:set()
  love.graphics.clear(0, 0, 0)
  self.world:emit("draw")

  Resources.canvas:render()
end

function Death:mousepressed(x, y, button)
  self.world:emit("mousepressed", x, y, button)
end

function Death:mousereleased(x, y, button)
  self.world:emit("mousereleased", x, y, button)
end

return Death
