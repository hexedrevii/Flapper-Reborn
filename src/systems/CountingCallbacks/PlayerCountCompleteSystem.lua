local Concord = require "lib.Concord"
local Resources = require "src.Resources"

local PlayerCountCompleteSystem = Concord.system({ pool = { "playerscore", "count_complete" } })

function PlayerCountCompleteSystem:update(delta)
  for _, entity in ipairs(self.pool) do
    Concord.entity(self:getWorld())
      :give("position", 55, 360)
      :give("sprite", Resources.manager:get("ok"))
      :give("layer", 67)
      :give("rectangle", 80, 28)
      :give("button", 360)
      :give("ok")

    Concord.entity(self:getWorld())
      :give("position", 160, 360)
      :give("sprite", Resources.manager:get("share"))
      :give("layer", 67)
      :give("rectangle", 80, 28)
      :give("button", 360)

    entity:remove("count_complete")
  end
end

return PlayerCountCompleteSystem
