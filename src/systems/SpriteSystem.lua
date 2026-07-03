local Concord = require "lib.Concord"

local SpriteSystem = Concord.system({ pool = { "sprite", "position" } })

function SpriteSystem:draw()
  local sorted = {}
  for _, entity in ipairs(self.pool) do
    table.insert(sorted, entity)
  end

  table.sort(sorted, function (a, b)
    local layerA = a:has("layer") and a.layer.depth or 1
    local layerB = b:has("layer") and b.layer.depth or 1

    return layerA < layerB
  end)

  for _, entity in ipairs(sorted) do
    if entity:has("colour") then
      love.graphics.setColor(entity.colour.r, entity.colour.g, entity.colour.b, entity.colour.a)
    end

    love.graphics.draw(
      entity.sprite.image,
      math.floor(entity.sprite.flipped and entity.position.x + entity.sprite.image:getWidth() or entity.position.x), math.floor(entity.position.y),
      entity:has("rotation") and entity.rotation.rotation or nil,
      entity.sprite.flipped and -1 or 1, nil,
      entity:has("offset") and entity.offset.x or nil,
      entity:has("offset") and entity.offset.y or nil
    )

    love.graphics.setColor(1,1,1,1)
  end
end

return SpriteSystem
