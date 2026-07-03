local Concord = require "lib.Concord"

RectangleSystem = Concord.system({ pool = { 'rectangle', 'position', 'colour', 'fill' } })

function RectangleSystem:draw()
  for _, entity in ipairs(self.pool) do
    local pos = entity.position
    local rect = entity.rectangle
    local colour = entity.colour
    local fill = entity.fill

    love.graphics.setColor(colour.r, colour.g, colour.b, colour.a)

    local drawX = pos.x + rect.ox
    local drawY = pos.y + rect.oy

    love.graphics.rectangle(fill.mode, drawX, drawY, rect.width, rect.height)

    love.graphics.setColor(1,1,1,1)
  end
end

return RectangleSystem
