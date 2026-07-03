local Concord = require "lib.Concord"

local Resources = require "src.Resources"

local FlashSystem = Concord.system({ pool = { "flash" } })

function FlashSystem:update(delta)
  for _, entity in ipairs(self.pool) do
    entity.flash.timer = entity.flash.timer - delta
    if entity.flash.timer <= 0 then
      entity:destroy()
    end
  end
end

function FlashSystem:draw()
  for _, entity in ipairs(self.pool) do
    local flash = entity.flash

    local alpha = math.max(0, flash.timer / flash.duration)

    love.graphics.setColor(1,1,1,alpha)
    love.graphics.rectangle("fill", 0, 0, Resources.cx, Resources.cy)

    love.graphics.setColor(1,1,1,1)
  end
end

return FlashSystem
