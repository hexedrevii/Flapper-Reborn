local Concord = require "lib.Concord"

local WobblerSystem = Concord.system({ pool = { "wobbler", "position" } })

function WobblerSystem:update(delta)
  for _, entity in ipairs(self.pool) do
    local wobbler = entity.wobbler
    local position = entity.position

    local old = wobbler.size * math.sin(wobbler.speed * wobbler.timer)
    wobbler.timer = wobbler.timer + delta
    local new = wobbler.size * math.sin(wobbler.speed * wobbler.timer)

    position.y = position.y + (new - old)
  end
end

return WobblerSystem
