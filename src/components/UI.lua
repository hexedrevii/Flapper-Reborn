local Concord = require "lib.Concord"

Concord.component("button", function (c, oy)
  c.oy = oy
end)

Concord.component("clicked") -- added when the button is actually clicked
Concord.component("pressed") -- intermediary

Concord.component("pause", function (c, paused)
  c.running = true
end)

Concord.component("resume")
