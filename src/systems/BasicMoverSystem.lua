local Concord = require "lib.Concord"

local BasicMoverSystem = Concord.system({ pool = { "position", "basicmover" } })

function BasicMoverSystem:update(delta)
  for _, entity in ipairs(self.pool) do
    entity.position.x = entity.position.x + entity.basicmover.dx * entity.basicmover.speed * delta
    entity.position.y = entity.position.y + entity.basicmover.dy * entity.basicmover.speed * delta
  end
end

return BasicMoverSystem
