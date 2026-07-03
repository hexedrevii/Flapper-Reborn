local Concord = require "lib.Concord"

local OffscreenSystem = Concord.system({ pool = { "offscreen_destroy", "position" } })

function OffscreenSystem:update(delta)
  for _, entity in ipairs(self.pool) do
    local offscreen = entity.offscreen_destroy
    local position = entity.position

    if position.x < -offscreen.offset then
      entity:destroy()
    end
  end
end

return OffscreenSystem
