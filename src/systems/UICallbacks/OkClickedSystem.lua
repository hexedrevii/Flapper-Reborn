local Concord = require "lib.Concord"
local Resources = require "src.Resources"
local Menu      = require "src.worlds.Menu"

local OkClickedSystem = Concord.system({ pool = { "ok", "clicked" }, nums = { "scorenum" } })

function OkClickedSystem:update(delta)
  for _, entity in ipairs(self.pool) do
    Concord.entity(self:getWorld())
      :give("position", 0, 0)
      :give("sprite", Resources.manager:get("blank"))
      :give("layer", 99)
      :give("colour", 0,0,0,0)
      :give("fade", 3, false)
      :give("transition", Menu)

    for _, num in ipairs(self.nums) do
      num:destroy()
    end

    entity:remove("clicked")
  end
end

return OkClickedSystem
