local Concord = require "lib.Concord"
local Resources = require "src.Resources"

local ScoreDrawSystem = Concord.system({ pool = { "score" } })

function ScoreDrawSystem:draw()
    for _, entity in ipairs(self.pool) do
      local display = entity.score

      local scoreStr = tostring(display.score)
      local totalWidth = 0
      local spritesToDraw = {}
      local y = 20
      local gap = 2

      for i = 1, #scoreStr do
        local digitStr = string.sub(scoreStr, i, i)
        local sprite = Resources.manager:get(digitStr .. "-small")

        table.insert(spritesToDraw, sprite)
        totalWidth = totalWidth + sprite:getWidth()
      end

      if #scoreStr > 1 then
        totalWidth = totalWidth + ((#scoreStr - 1) * gap)
      end

      local currentX = (Resources.cx * 0.5) - (totalWidth * 0.5)
      for _,sprite in ipairs(spritesToDraw) do
        love.graphics.draw(sprite, currentX, y)
        currentX = currentX + sprite:getWidth() + gap
      end
  end
end

return ScoreDrawSystem
