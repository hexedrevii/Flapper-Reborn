local Concord = require "lib.Concord"

Concord.component("score", function (c, score)
  c.score = score
end)

Concord.component("ground", function (c, other)
  c.other = other
end)

Concord.component("spawner", function (c, timeout)
  c.time = 0
  c.timeout = timeout
end)
