local Concord = require "lib.Concord"
local Resources = require "src.Resources"

local JumpSystem = Concord.system({ pool = { "player", "jump", "velocity", "position" } })

function JumpSystem:update(delta)
  for _, entity in ipairs(self.pool) do
    if Resources.input:isPressed("jump") then
      entity.velocity.y = -entity.jump.force
    end

    if entity.position.y < -20 then
      -- push back by 1 pixel to not get stuck
      entity.position.y = -19

      -- stop all movement immediately
      entity.velocity.y = 0
    end
  end
end

return JumpSystem
