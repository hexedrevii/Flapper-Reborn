local Resources = require "src.Resources"
local Game      = require "src.worlds.Game"
local Menu      = require "src.worlds.Menu"
local Concord   = require "lib.Concord"

function love.load()
  love.graphics.setDefaultFilter("nearest", "nearest")

  -- Load all components
  Concord.utils.loadNamespace("src/components")

  Resources.input:pushKeymap("jump", "space", nil, 1)

  Resources.manager:add("bird-down", love.graphics.newImage("assets/Sprites/yellowbird-downflap.png"))
  Resources.manager:add("bird-mid", love.graphics.newImage("assets/Sprites/yellowbird-midflap.png"))
  Resources.manager:add("bird-up", love.graphics.newImage("assets/Sprites/yellowbird-upflap.png"))

  Resources.manager:add("background", love.graphics.newImage("assets/Sprites/background-day.png"))

  Resources.manager:add("base", love.graphics.newImage("assets/Sprites/base-old.png"))

  Resources.manager:add("pipe", love.graphics.newImage("assets/Sprites/pipe-old.png"))

  Resources.manager:add("gameover", love.graphics.newImage("assets/Sprites/gameover-old.png"))
  Resources.manager:add("scoreboard", love.graphics.newImage("assets/Sprites/panel.png"))

  Resources.manager:add("ready", love.graphics.newImage("assets/Sprites/getready.png"))
  Resources.manager:add("message", love.graphics.newImage("assets/Sprites/readysprite.png"))

  Resources.manager:add("pause", love.graphics.newImage("assets/Buttons/pause.png"))
  Resources.manager:add("resume", love.graphics.newImage("assets/Buttons/resume.png"))

  Resources.manager:add("start", love.graphics.newImage("assets/Buttons/start.png"))
  Resources.manager:add("score", love.graphics.newImage("assets/Buttons/score.png"))

  Resources.manager:add("ok", love.graphics.newImage("assets/Buttons/ok.png"))
  Resources.manager:add("share", love.graphics.newImage("assets/Buttons/share.png"))

  Resources.manager:add("new", love.graphics.newImage("assets/Sprites/new.png"))

  Resources.manager:add("logo", love.graphics.newImage("assets/Sprites/logo.png"))

  Resources.manager:add("blank", love.graphics.newImage("assets/Sprites/casablanca.png"))

  Resources.manager:add("bronze", love.graphics.newImage("assets/Sprites/bronze-medal.png"))
  Resources.manager:add("silver", love.graphics.newImage("assets/Sprites/silver-medal.png"))
  Resources.manager:add("gold", love.graphics.newImage("assets/Sprites/gold-medal.png"))
  Resources.manager:add("platinum", love.graphics.newImage("assets/Sprites/platinum-medal.png"))

  for i=1,3 do
    Resources.manager:add("sparkle-" .. i, love.graphics.newImage("assets/Sprites/sparkle-" .. i .. ".png"))
  end

  for i=0, 9 do
    Resources.manager:add(i .. "", love.graphics.newImage("assets/Sprites/" .. i .. ".png"))
    Resources.manager:add(i .. "-small", love.graphics.newImage("assets/Sprites/" .. i .. "_small.png"))
  end

  Resources.manager:add("jump", love.audio.newSource("assets/Audio/wing.wav", "static"))
  Resources.manager:add("point", love.audio.newSource("assets/Audio/point.wav", "static"))

  Resources.manager:add("hit", love.audio.newSource("assets/Audio/hit.wav", "static"))
  Resources.manager:add("fall", love.audio.newSource("assets/Audio/die.wav", "static"))

  Resources.manager:add("woosh", love.audio.newSource("assets/Audio/swoosh.wav", "static"))

  Resources.worlds:set(Menu)
end

function love.update(delta)
  Resources.worlds:update(delta)
end

function love.draw()
  Resources.worlds:draw()
end


function love.keypressed(key)
  Resources.input:keypressed(key)
end

function love.keyreleased(key)
  Resources.input:keyreleased(key)
end

function love.mousepressed(x, y, button)
  Resources.input:mousepressed(x, y, button)

  Resources.worlds:mousepressed(x, y, button)
end

function love.mousereleased(x, y, button)
  Resources.input:mousereleased(x, y, button)

  Resources.worlds:mousereleased(x, y, button)
end
