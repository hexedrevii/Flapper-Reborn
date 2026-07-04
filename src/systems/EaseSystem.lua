local Concord = require "lib.Concord"
local Easings = require "src.Easings"

local EaseSystem = Concord.system({ pool = { "move_ease", "position" } })

function EaseSystem:update(delta)
  for _, entity in ipairs(self.pool) do
    local position = entity.position
    local ease = entity.move_ease

    ease.time = ease.time + delta
    local t = math.min(ease.time / ease.duration, 1)

    local fn = Easings[ease.ease]
    assert(fn ~= nil, "Easing function does not exist. got: " .. ease.ease)

    position.y = ease.starty + ((ease.endy - ease.starty) * fn(t))

    if t >= 1 then
      entity:remove("move_ease")
      entity:give("ease_complete")
    end
  end
end

return EaseSystem
