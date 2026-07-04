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

Concord.component("move_ease", function (c, starty, endy, duration, ease)
  c.starty = starty
  c.endy = endy

  c.duration = duration
  c.time = 0

  c.ease = ease or "inOutQuad"
end)

Concord.component("offscreen_destroy", function (c, offset)
  c.offset = offset or 0
end)

Concord.component("jump", function (c, force)
  c.force = force
end)

Concord.component("gravity", function (c, force, forceAccel)
  c.force = force
  c.forceAccel = forceAccel
end)

