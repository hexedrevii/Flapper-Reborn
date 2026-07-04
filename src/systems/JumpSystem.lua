local Concord = require "lib.Concord"
local Resources = require "src.Resources"

local JumpSystem = Concord.system({ pool = { "player", "jump", "velocity", "position" }, ui = { "button", "position", "rectangle" } })

local function isInside(x, y, pos, rect)
  local left = pos.x + (rect.ox or 0)
  local right = left + rect.width
  local top = pos.y + (rect.oy or 0)
  local bottom = top + rect.height

  return x >= left and x <= right and y >= top and y <= bottom
end

function JumpSystem:mousepressed(x, y, button)
  x, y = Resources.canvas:toGame(x, y)

  for _, entity in ipairs(self.pool) do
    for _, ui in ipairs(self.ui) do
      if isInside(x, y, ui.position, ui.rectangle) then
        goto skip
      end
    end

    entity.velocity.y = -entity.jump.force
    ---@type love.Source
    local jump = Resources.manager:get("jump")
    if jump:isPlaying() then
      jump:stop()
    end

    jump:play()
    ::skip::
  end
end

function JumpSystem:update(delta)
  for _, entity in ipairs(self.pool) do
    if entity.position.y < -20 then
      -- push back by 1 pixel to not get stuck
      entity.position.y = -19

      -- stop all movement immediately
      entity.velocity.y = 0
    end
  end
end

return JumpSystem
