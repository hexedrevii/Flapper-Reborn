local Concord = require "lib.Concord"
local Resources = require "src.Resources"

local GameOverSystem = Concord.system({ pool = { "gameover", "ease_complete" } })

function GameOverSystem:update(delta)
  for _,entity in ipairs(self.pool) do
    local world = self:getWorld()

    local panel = Resources.manager:get("scoreboard")
    Concord.entity(world)
      :give("position", Resources.cx * 0.5 - panel:getWidth() * 0.5, 600)
      :give("sprite", panel)
      :give("move_ease", 600, 200, 0.5, "inOutQuad")
      :give("layer", 67)
      :give("scoreboard")

    entity:remove("ease_complete")
  end
end

return GameOverSystem
