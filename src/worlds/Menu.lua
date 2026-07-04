local Concord = require "lib.Concord"
local Resources = require "src.Resources"

local Menu = {}

function Menu:init()
  self.world = Concord.world()

  local Systems = {}
  Concord.utils.loadNamespace("src/systems", Systems)

  self.world:addSystems(
    Systems.WobblerSystem,
    Systems.SlideShowSystem,
    Systems.GroundTeleportSystem,
    Systems.BasicMoverSystem,
    Systems.ButtonSystem,
    Systems.UICallbacks.StartClickedSystem,
    Systems.TransitionSystem,

    Systems.SpriteSystem,
    Systems.FadeSystem
  )

  -- Only fade out if we come from a transition
  if self.fromTransition then
    Concord.entity(self.world)
      :give("position", 0, 0)
      :give("layer", 99)
      :give("fade", 3, true)
      :give("colour", 0,0,0,1)
      :give("sprite", Resources.manager:get("blank"))

    self.fromTransition = false
  end

  -- UI
  Concord.entity(self.world)
    :give("position", 50, 360)
    :give("sprite", Resources.manager:get("start"))
    :give("layer", 3)
    :give("button", 360)
    :give("rectangle", 80, 28)
    :give("play")

  Concord.entity(self.world)
    :give("position", 160, 360)
    :give("sprite", Resources.manager:get("score"))
    :give("layer", 3)
    :give("button", 360)
    :give("rectangle", 80, 28)

  -- Background
  Concord.entity(self.world)
    :give("position", 0, 0)
    :give("sprite", Resources.manager:get("background"))
    :give("layer", 0)

  -- Logo & Bird
  Concord.entity(self.world)
    :give("position", 20, 120)
    :give("sprite", Resources.manager:get("logo"))
    :give("layer", 1)
    :give("wobbler", 5, 8)

  Concord.entity(self.world)
    :give("position", 230, 125)
    :give("sprite", Resources.manager:get("bird-mid"))
    :give("layer", 1)
    :give("slideshow",
      { Resources.manager:get("bird-down"), Resources.manager:get("bird-mid"), Resources.manager:get("bird-up") },
      0.15
    )
    :give("wobbler", 5, 8)

  -- Ground
  local first = Concord.entity(self.world)
    :give("position", 0, Resources.cy - 112)
    :give("sprite", Resources.manager:get("base"))
    :give("basicmover", -1, 0, 150)
    :give("layer", 2)

  local second = Concord.entity(self.world)
    :give("position", 308, Resources.cy - 112)
    :give("sprite", Resources.manager:get("base"))
    :give("basicmover", -1, 0, 150)
    :give("layer", 2)

  first:give("ground", second)
  second:give("ground", first)
end

function Menu:update(dt)
  self.world:emit("update", dt)
end

function Menu:draw()
  Resources.canvas:set()
  love.graphics.clear(0, 0, 0)
  self.world:emit("draw")

  Resources.canvas:render()
end

function Menu:mousepressed(x, y, button)
  self.world:emit("mousepressed", x, y, button)
end

function Menu:mousereleased(x, y, button)
  self.world:emit("mousereleased", x, y, button)
end

return Menu
