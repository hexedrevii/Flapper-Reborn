local Easings = {}

---@param t number [0, 1]
function Easings.inOutQuad(t)
  if t < 0.5 then
    return 2 * t * t
  else
    return 1 - math.pow(-2 * t + 2, 2) / 2
  end
end

return Easings
