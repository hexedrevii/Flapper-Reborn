local Concord = require "lib.Concord"
local mathx   = require "lib.marshmallow.mathx"
local Resources = require "src.Resources"

local angle = 0

local RotationSystem = Concord.system({ pool = { "rotation", "player", "velocity" } })

function RotationSystem:update(delta)
  for _, entity in ipairs(self.pool) do
    local rot = entity.rotation

    rot.rotation = mathx.moveTowards(rot.rotation, angle, 8 * delta)

    if Resources.input:isDown("jump") and not entity:has("dead") then
      angle = mathx.deg2rad(-25)
    end

    if entity.velocity.y > 100 then
      angle = mathx.deg2rad(90)
    end
  end
end

return RotationSystem
