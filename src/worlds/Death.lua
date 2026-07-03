local Resources = require "src.Resources"
local Concord = require "lib.Concord"

local Death = {}

function Death:init()
  local Systems = {}
  Concord.utils.loadNamespace("src/systems", Systems)
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

return Death
