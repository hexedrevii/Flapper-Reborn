local Concord = require "lib.Concord"
local Resources = require "src.Resources"

local ToggleableSystems = {
  require "src.systems.SpawnerSystem",
  require "src.systems.MoverSystem",
  require "src.systems.BasicMoverSystem",
  require "src.systems.RotationSystem",
  require "src.systems.JumpSystem",
  require "src.systems.CycleSpeedSystem",
  require "src.systems.GravitySystem",
  require "src.systems.SlideShowSystem"
}

local PauseClickedSystem = Concord.system({ pool = {"pause", "clicked"} })

function PauseClickedSystem:update(delta)
  for _, entity in ipairs(self.pool) do
    entity.pause.running = not entity.pause.running
    for _, system in ipairs(ToggleableSystems) do
      self:getWorld():getSystem(system):setEnabled(entity.pause.running)
    end

    if entity.pause.running then
      entity.sprite.image = Resources.manager:get("pause")
    else
      entity.sprite.image = Resources.manager:get("resume")
    end

    entity:remove("clicked")
  end
end


return PauseClickedSystem
