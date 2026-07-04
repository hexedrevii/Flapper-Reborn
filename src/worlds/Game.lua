local Concord = require 'lib.Concord'
local Resources = require "src.Resources"

local Game = {}

function Game:init()
  local Systems = {}
  Concord.utils.loadNamespace("src/systems", Systems);

  self.world = Concord.world()

  self.world:addSystems(
    -- Update
    Systems.GravitySystem,
    Systems.UICallbacks.PauseClickedSystem,
    Systems.JumpSystem,
    Systems.CollisionSystem,
    Systems.MoverSystem,
    Systems.SlideShowSystem,
    Systems.CycleSpeedSystem,
    Systems.RotationSystem,
    Systems.BasicMoverSystem,
    Systems.GroundTeleportSystem,
    Systems.SpawnerSystem,
    Systems.OffscreenSystem,
    Systems.FadeSystem,
    Systems.WobblerSystem,
    Systems.IntroSystem,
    Systems.ButtonSystem,

    -- Draw
    Systems.SpriteSystem,
    Systems.RectangleSystem,
    Systems.ScoreDrawSystem,
    Systems.FlashSystem
  )

  -- Death state
  self.world:addSystems(
    Systems.EaseSystem,
    Systems.EasingCallbacks.GameOverSystem,
    Systems.EasingCallbacks.PlayerScoreSystem,
    Systems.CountTowardSystem,

    Systems.ScoreNumSystem
  )

  -- UI
  Concord.entity(self.world)
    :give("position", 20, 20)
    :give("sprite", Resources.manager:get("pause"))
    :give("layer", 5)
    :give("button", 20)
    :give("rectangle", 26, 28)
    :give("pause")

  -- Message stuff
  local ready = Resources.manager:get("ready")
  local ry = 90
  Concord.entity(self.world)
    :give("position", Resources.cx * 0.5 - ready:getWidth() * 0.5, ry)
    :give("sprite", ready)
    :give("layer", 67)
    :give("fade", 3, false)
    :give("colour", 1, 1, 1, 0)
    :give("start")

  local message = Resources.manager:get("message")
  local gap = 40
  Concord.entity(self.world)
    :give("position", Resources.cx * 0.5 - 20, (ry + ready:getHeight() + gap))
    :give("sprite", message)
    :give("layer", 67)
    :give("fade", 3, false)
    :give("colour", 1, 1, 1, 0)
    :give("start")

  -- Background
  Concord.entity(self.world)
    :give("position", 0, 0)
    :give("sprite", Resources.manager:get("background"))
    :give("layer", 0)

  -- Ground
  local first = Concord.entity(self.world)
    :give("position", 0, Resources.cy - 112)
    :give("sprite", Resources.manager:get("base"))
    :give("rectangle", 308, 112)
    :give("basicmover", -1, 0, 150)
    :give("layer", 2)

  local second = Concord.entity(self.world)
    :give("position", 308, Resources.cy - 112)
    :give("sprite", Resources.manager:get("base"))
    :give("rectangle", 308, 112)
    :give("basicmover", -1, 0, 150)
    :give("layer", 2)

  first:give("ground", second)
  second:give("ground", first)

  -- Bird
  Concord.entity(self.world)
    -- This is for the start...
    :give("wobbler", 25, 10)
    :give("begin")

    :give("player")
    :give("rectangle", 34, 24, -32 * 0.5, -24 * 0.5)
    :give("position", (Resources.cx * 0.5) - 50, Resources.cy * 0.5 - 50)
    :give("velocity", 0, 0)
    :give("sprite", Resources.manager:get("bird-mid"))
    :give("offset", 34 * 0.5, 24 * 0.5)
    :give("slideshow",
      { Resources.manager:get("bird-down"), Resources.manager:get("bird-mid"), Resources.manager:get("bird-up") },
      0.15
    )
    :give("score", 0)
    :give("layer", 3)

  -- Missing jump, gravity and rotation: Added in system substate
  --    :give("gravity", 900, 750)
  --    :give("jump", 250)
  --    :give("rotation", 0)
end

function Game:update(dt)
  self.world:emit("update", dt)
end

function Game:draw()
  Resources.canvas:set()
  love.graphics.clear(0, 0, 0)
  self.world:emit("draw")

  Resources.canvas:render()
end

function Game:mousepressed(x, y, button)
  if button ~= 1 then return end

  self.world:emit("mousepressed", x, y, button)
end

function Game:mousereleased(x, y, button)
  if button ~= 1 then return end

  self.world:emit("mousereleased", x, y, button)
end


return Game
