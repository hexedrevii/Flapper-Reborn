local Concord = require "lib.Concord"

local SparkleCompleteSystem = Concord.system({ pool = { "sparkle", "anim_finish", "position", "sprite" } })

function SparkleCompleteSystem:update(delta)
  for _,entity in ipairs(self.pool) do
    local position = entity.position

    local sx = love.math.random(56, 100)
    local sy = love.math.random(243, 280)

    position.x = sx
    position.y = sy

    entity:remove("anim_finish")
    break
  end
end

return SparkleCompleteSystem
