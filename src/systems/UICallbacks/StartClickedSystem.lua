local Concord = require "lib.Concord"
local Resources = require "src.Resources"
local Game = require "src.worlds.Game"

local StartClickedSystem = Concord.system({ pool = { "play", "clicked" } })

function StartClickedSystem:update(delta)
  for _, entity in ipairs(self.pool) do
    Concord.entity(self:getWorld())
      :give("position", 0, 0)
      :give("colour", 0,0,0,0)
      :give("transition", Game)
      :give("sprite", Resources.manager:get("blank"))
      :give("layer", 99)
      :give("fade", 3, false)

    entity:remove("clicked")
  end
end

return StartClickedSystem
