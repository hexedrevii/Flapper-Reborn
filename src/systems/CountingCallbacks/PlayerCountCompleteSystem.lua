local Concord = require "lib.Concord"
local Resources = require "src.Resources"

local PlayerCountCompleteSystem = Concord.system({ pool = { "playerscore", "count_complete" }, player = { "player", "score" } })

function PlayerCountCompleteSystem:update(delta)
  local player = self.player[1]
  if not player then return end

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

    -- Calculate medal
    local points = player.score
    local medal = nil
    if points.score >= 40 then
      medal = Resources.manager:get("platinum")
    elseif points.score >= 30 then
      medal = Resources.manager:get("gold")
    elseif points.score >= 20 then
      medal = Resources.manager:get("silver")
    elseif points.score >= 10 then
      medal = Resources.manager:get("bronze")
    end

    if medal then
      Concord.entity(self:getWorld())
        :give("position", 56, 243)
        :give("layer", 68)
        :give("sprite", medal)

      local sx = love.math.random(56, 56 + medal:getWidth())
      local sy = love.math.random(243, 243 + medal:getHeight())
      Concord.entity(self:getWorld())
        :give("position", sx, sy)
        :give("layer", 69)
        :give("sprite", Resources.manager:get("sparkle-1"))
        :give("slideshow",
          { Resources.manager:get("sparkle-1"), Resources.manager:get("sparkle-2"), Resources.manager:get("sparkle-3") },
          0.25
        )
        :give("sparkle")
    end

    entity:remove("count_complete")
    break
  end
end

return PlayerCountCompleteSystem
