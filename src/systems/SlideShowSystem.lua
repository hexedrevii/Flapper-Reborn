local Concord = require "lib.Concord"

local SlideShowSystem = Concord.system({ pool = { "slideshow", "sprite" } })

function SlideShowSystem:update(delta)
  for _, entity in ipairs(self.pool) do
    local slides = entity.slideshow
    local sprite = entity.sprite

    slides.time = slides.time + delta
    if slides.time >= slides.timeout then
      slides.time = 0

      if slides.reverse then
        slides.current = slides.current - 1
      else
        slides.current = slides.current + 1
      end

      if slides.current >= #slides.images or slides.current <= 1 then
        slides.reverse = not slides.reverse
      end

      sprite.image = slides.images[slides.current]
    end
  end
end

return SlideShowSystem
