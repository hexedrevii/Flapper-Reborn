local Concord = require "lib.Concord"

local MoverSystem = Concord.system({ pool = { "velocity", "position" } })

function MoverSystem:update(delta)
  for _, entity in ipairs(self.pool) do
    entity.position.x = entity.position.x + entity.velocity.x * delta
    entity.position.y = entity.position.y + entity.velocity.y * delta
  end
end

return MoverSystem
