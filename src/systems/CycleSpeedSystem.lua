local Concord = require "lib.Concord"
local Resources = require "src.Resources"

local CycleSpeedSystem = Concord.system({ pool = { "player", "slideshow", "velocity" } })

function CycleSpeedSystem:update(delta)
  for _, entity in ipairs(self.pool) do
    if entity:has("begin") then
      goto _
    end

    if Resources.input:isDown("jump") then
      entity.slideshow.timeout = 0.05
    end

    if entity.velocity.y > 50 then
      entity.slideshow.timeout = 0.1
    end

    ::_::
  end
end

return CycleSpeedSystem
