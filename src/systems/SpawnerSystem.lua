local Concord = require "lib.Concord"
local Resources = require "src.Resources"

local SpawnerSystem = Concord.system({ pool = { "spawner" } })

function SpawnerSystem:update(delta)
  for _, entity in ipairs(self.pool) do
    local spawner = entity.spawner

    spawner.time = spawner.time + delta
    if spawner.time >= spawner.timeout then
      spawner.time = 0

      local world = self:getWorld()
      local py = love.math.random(120, Resources.cy - 150)
      local gap = 100
      local offset = 60

      local speed = 150

      -- First pipe (down)
      Concord.entity(world)
        :give("position", Resources.cx + 30, py)
        :give("rectangle", 52, 320)
        :give("basicmover", -1, 0, speed)
        :give("sprite", Resources.manager:get("pipe"))
        :give("offscreen_destroy", offset)
        :give("layer", 1)
        :give("pipe")

      -- Scoring area
      Concord.entity(world)
        :give("position", Resources.cx + 45, py - gap)
        :give("rectangle", 20, gap - 1)
        :give("basicmover", -1, 0, speed)
        :give("offscreen_destroy", offset)
        :give("score_area")

      -- Second pipe (up)
      Concord.entity(world)
        :give("position", Resources.cx + 30, py - gap)
        :give("rectangle", 52, 320, 0, -320)
        :give("basicmover", -1, 0, speed)
        :give("sprite", Resources.manager:get("pipe"), true)
        :give("offscreen_destroy", offset)
        :give("layer", 1)
        :give("pipe")
    end
  end
end

return SpawnerSystem
