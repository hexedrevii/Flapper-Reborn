local Concord = require "lib.Concord"

Concord.component("position", function (c, x, y)
  c.x = x
  c.y = y
end)

Concord.component("velocity", function (c, x, y)
  c.x = x
  c.y = y
end)

Concord.component("basicmover", function (c, dx, dy, speed)
  c.dx = dx
  c.dy = dy

  c.speed = speed
end)

Concord.component("wobbler", function (c, size, speed)
  c.speed = speed
  c.size = size

  c.timer = 0
end)

Concord.component("offscreen_destroy", function (c, offset)
  c.offset = offset
  if c.offset == nil then
    c.offset = 0
  end
end)

Concord.component("jump", function (c, force)
  c.force = force
end)

Concord.component("gravity", function (c, force, forceAccel)
  c.force = force
  c.forceAccel = forceAccel
end)

