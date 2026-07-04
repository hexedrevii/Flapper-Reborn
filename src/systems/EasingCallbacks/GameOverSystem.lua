local Concord = require "lib.Concord"
local Resources = require "src.Resources"

local GameOverSystem = Concord.system({ pool = { "gameover", "ease_complete" }, player = { "player", "score" } })

function GameOverSystem:update(delta)
  local player = self.player[1]
  if not player then return end

  for _,entity in ipairs(self.pool) do
    local world = self:getWorld()

    local panel = Resources.manager:get("scoreboard")
    Concord.entity(world)
      :give("position", Resources.cx * 0.5 - panel:getWidth() * 0.5, 600)
      :give("sprite", panel)
      :give("move_ease", 600, 200, 0.5, "inOutQuad")
      :give("layer", 67)
      :give("scoreboard")

    -- Player Score
    Concord.entity(world)
      :give("position", 235, 600)
      :give("move_ease", 600, 231, 0.5, "inOutQuad")
      :give("scorenum", 0)
      :give("playerscore")

    if player.score.score > Resources.highscore then
      Resources.highscore = player.score.score

      -- Save the highscore
      love.filesystem.write("score.txt", tostring(Resources.highscore))

      -- New highscore tag
      Concord.entity(world)
        :give("position", 165, 600)
        :give("move_ease", 600, 258, 0.5, "inOutQuad")
        :give("sprite", Resources.manager:get("new"))
        :give("layer", 69)
    end

    -- High Score
    Concord.entity(world)
      :give("position", 235, 600)
      :give("move_ease", 600, 273, 0.5, "inOutQuad")
      :give("scorenum", Resources.highscore)

    entity:remove("ease_complete")
  end
end

return GameOverSystem
