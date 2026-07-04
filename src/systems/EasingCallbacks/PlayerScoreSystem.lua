local Concord = require "lib.Concord"

local PlayerScoreSystem = Concord.system({ pool = { "playerscore", "ease_complete" }, player = { "player", "score" } })

function PlayerScoreSystem:update(delta)
  local player = self.player[1]
  if not player then
    return
  end

  for _, entity in ipairs(self.pool) do
    entity:give("count_toward", player.score.score, 0.1)

    entity:remove("ease_complete")
  end
end

return PlayerScoreSystem
