local Concord = require "lib.Concord"
local Death   = require "src.worlds.Death"
local Resources = require "src.Resources"

local BasicMoverSystem = require "src.systems.BasicMoverSystem"
local SpawnerSystem = require "src.systems.SpawnerSystem"
local ScoreDrawSystem = require "src.systems.ScoreDrawSystem"

local function rects(posA, rectA, posB, rectB)
  local leftA = posA.x + rectA.ox
  local rightA = leftA + rectA.width
  local topA = posA.y + rectA.oy
  local bottomA = topA + rectA.height

  local leftB = posB.x + rectB.ox
  local rightB = leftB + rectB.width
  local topB = posB.y + rectB.oy
  local bottomB = topB + rectB.height

  return leftA < rightB and
          rightA > leftB and
          topA < bottomB and
          bottomA > topB
end

local function kill(self, player, buttons)
  if player:has("dead") then return end

  Resources.manager:get("hit"):play()

  player:give("dead")
  player:remove("jump")

  local world = self:getWorld()

  Concord.entity(world):give("flash", 0.5)

  world:getSystem(BasicMoverSystem):setEnabled(false)
  world:getSystem(SpawnerSystem):setEnabled(false)
  world:getSystem(ScoreDrawSystem):setEnabled(false)

  for _, entity in ipairs(buttons) do
    entity:destroy()
  end
end

local CollisionSystem = Concord.system(
  {
    player  = { "player", "position", "rectangle", "score" },
    pipes   = { "pipe", "position", "rectangle" },
    scores  = { "score_area", "position", "rectangle" },
    grounds = { "ground", "rectangle", "position" },
    ui      = { "button" }
  }
)

function CollisionSystem:update(delta)
  local player = self.player[1]

  for _, entity in ipairs(self.scores) do
    if rects(
      player.position, player.rectangle,
      entity.position, entity.rectangle
    ) then
      player.score.score = player.score.score + 1
      entity:destroy()
      Resources.manager:get("point"):play()
    end
  end

  for _, entity in ipairs(self.pipes) do
    if rects(
      player.position, player.rectangle,
      entity.position, entity.rectangle
    ) then
      kill(self, player, self.ui)
      entity:remove("rectangle")
      Resources.manager:get("fall"):play()
    end
  end

  for _, ground in ipairs(self.grounds) do
    if rects(
      player.position, player.rectangle,
      ground.position, ground.rectangle
    ) then
      kill(self, player, self.ui)

      player.velocity.y = 0

      player:remove("gravity")
      player:remove("slideshow")

      ground:remove("rectangle")

      Death.world = self:getWorld()
      Resources.worlds:set(Death)

      break
    end
  end
end

return CollisionSystem
