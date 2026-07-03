local Concord = require "lib.Concord"

local GroundTeleportSystem = Concord.system({ pool = { "ground", "position" } })

function GroundTeleportSystem:update(delta)
  for _, entity in ipairs(self.pool) do
    if entity.position.x < -308 then
      entity.position.x = entity.ground.other.position.x + 308
    end
  end
end

return GroundTeleportSystem
