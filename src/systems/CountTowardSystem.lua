local Concord = require "lib.Concord"

local CountTowardSystem = Concord.system({ pool = { "count_toward", "scorenum" } })

function CountTowardSystem:update(delta)
  for _, entity in ipairs(self.pool) do
    local count = entity.count_toward
    local score = entity.scorenum

    if count.current ~= count.num then
      count.time = count.time + delta
      if count.time >= count.timeout then
        count.time = 0

        count.current = count.current + 1
        score.num = count.current
        if count.current == count.num then
          entity:remove("count_toward")
          entity:give("count_complete")
        end
      end
    end
  end
end

return CountTowardSystem
