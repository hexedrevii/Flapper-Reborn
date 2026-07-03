local Concord = require "lib.Concord"
local mathx = require "lib.marshmallow.mathx"

local GravitySystem = Concord.system({ pool = {'gravity', 'velocity'} })

function GravitySystem:update(delta)
  for _, entity in ipairs(self.pool) do
    local gravity = entity.gravity
    local velocity = entity.velocity

    velocity.y = mathx.moveTowards(velocity.y, gravity.force, gravity.forceAccel * delta)
  end
end

return GravitySystem
