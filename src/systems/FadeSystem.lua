local Concord = require "lib.Concord"

local FadeSystem = Concord.system({ pool = {"fade", "colour"} })

function FadeSystem:update(delta)
  for _, entity in ipairs(self.pool) do
    local fade = entity.fade
    local colour = entity.colour

    if fade.reverse then
      if colour.a <= 0 then
        colour.a = 0
        entity:remove("fade")

        return
      end

      colour.a = colour.a - delta * fade.speed
    else
      if colour.a >= 1 then
        colour.a = 1
        entity:remove("fade")

        return
      end

      colour.a = colour.a + delta * fade.speed
    end
  end
end

return FadeSystem
