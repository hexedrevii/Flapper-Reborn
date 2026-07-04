local Concord = require "lib.Concord"
local Resources = require "src.Resources"

local ButtonSystem = Concord.system({ pool = {"button", "position", "rectangle"} })

local function isInside(x, y, pos, rect)
  local left = pos.x + (rect.ox or 0)
  local right = left + rect.width
  local top = pos.y + (rect.oy or 0)
  local bottom = top + rect.height

  return x >= left and x <= right and y >= top and y <= bottom
end

function ButtonSystem:mousereleased(x, y, button)
  x, y = Resources.canvas:toGame(x, y)
  for _,entity in ipairs(self.pool) do
    if entity:has("pressed") then
      if isInside(x, y, entity.position, entity.rectangle) then
        if not entity:has("clicked") then
          entity:give("clicked")
        end
      end

      entity:remove("pressed")
    end

    entity.position.y = entity.button.oy
  end
end

function ButtonSystem:mousepressed(x, y, button)
  x, y = Resources.canvas:toGame(x, y)
  for _,entity in ipairs(self.pool) do
    if isInside(x, y, entity.position, entity.rectangle) then
      entity:give("pressed")
      entity.position.y = entity.button.oy + 2
    end
  end
end

return ButtonSystem
