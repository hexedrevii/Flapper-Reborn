local Concord = require "lib.Concord"
local Resources = require "src.Resources"

local ScoreNumSystem = Concord.system({ pool = { "position", "scorenum" } })

function ScoreNumSystem:draw()
  for _, entity in ipairs(self.pool) do
    local score = entity.scorenum
    local position = entity.position

    local str = tostring(score.num)

    local gap = 2
    local width = 0
    local sprites = {}

    for i=1, #str do
      local digit = string.sub(str, i, i)
      local spr = Resources.manager:get(digit .. "-small")

      table.insert(sprites, spr)
      width = width + spr:getWidth()
    end

    if #str > 1 then
      width = width + ((#str - 1) * gap)
    end

    local cx = position.x - width
    for _, sprite in ipairs(sprites) do
      love.graphics.draw(sprite, cx, position.y)
      cx = cx + sprite:getWidth() + gap
    end
  end
end

return ScoreNumSystem
