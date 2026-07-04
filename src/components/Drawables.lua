local Concord = require "lib.Concord"

Concord.component("layer", function (c, depth)
  c.depth = depth
end)

Concord.component("sprite", function (c, image, flip)
  c.image = image
  c.flipped = flip
end)

Concord.component("scorenum", function (c, num)
  c.num = num
end)

Concord.component("count_toward", function (c, num, timeout)
  c.num = num
  c.timeout = timeout
  c.time = 0
  c.current = 0
end)

Concord.component("offset", function (c, x, y)
  c.x = x
  c.y = y
end)

Concord.component("rotation", function (c, r)
  c.rotation = r
end)

Concord.component("slideshow", function (c, images, timeout)
  c.images = images
  c.current = 1
  c.timeout = timeout
  c.time = 0

  c.reversing = false
end)

Concord.component("fade", function (c, speed, reverse)
  c.speed = speed
  c.reverse = reverse
end)

Concord.component("rectangle", function(c, width, height, offsetX, offsetY)
  c.width = width
  c.height = height
  c.ox = offsetX or 0
  c.oy = offsetY or 0
end)

Concord.component("colour", function (c, r, g, b, a)
  c.a = a or 1
  c.r = r
  c.g = g
  c.b = b
end)

Concord.component("fill", function (c, mode)
  c.mode = mode
end)

Concord.component("flash", function (c, duration)
  c.duration = duration
  c.timer = duration
end)
