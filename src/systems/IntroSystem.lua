local Concord = require "lib.Concord"
local Resources = require "src.Resources"

local IntroSystem = Concord.system({
  pool = { "begin", "wobbler" },
  starts = { "start" }
})

function IntroSystem:mousepressed(x, y, button)
  for _, entity in ipairs(self.pool) do
    for _, start in ipairs(self.starts) do
      start:give("fade", 3, true)
    end

    entity
      :remove("wobbler")
      :remove("begin")

    entity
      :give("gravity", 900, 750)
      :give("jump", 250)
      :give("rotation", 0)

    entity.velocity.y = -entity.jump.force

    Concord.entity(self:getWorld())
      :give("spawner", 1.25)
  end
end

return IntroSystem
