local Concord = require "lib.Concord"
local Resources = require "src.Resources"


local TransitionSystem = Concord.system({ pool = { "transition", "colour" } })

function TransitionSystem:update(delta)
  for _, entity in ipairs(self.pool) do
    local transition = entity.transition
    local colour = entity.colour

    if colour.a == 1 then
      transition.what.fromTransition = true
      Resources.worlds:set(transition.what)
    end
  end
end

return TransitionSystem
