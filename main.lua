local Resources = require "src.Resources"
local Game      = require "src.worlds.Game"
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

  for i=0, 9 do
    Resources.manager:add(i .. "", love.graphics.newImage("assets/Sprites/" .. i .. ".png"))
    Resources.manager:add(i .. "-small", love.graphics.newImage("assets/Sprites/" .. i .. "_small.png"))
  end

  Resources.worlds:set(Game)
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
end

function love.mousereleased(x, y, button)
  Resources.input:mousereleased(x, y, button)
end
