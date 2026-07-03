local WorldController = require 'src.worlds.Controller'
local PixelCanvas     = require 'lib.marshmallow.PixelCanvas'
local Input           = require 'lib.marshmallow.Input'
local ResourceManager = require 'src.ResourceManager'

local Resources = {
  worlds = WorldController.new(),

  cx = 288,
  cy = 512,
  canvas = PixelCanvas.new(288, 512, 'nearest'),
  input = Input.new(),
  manager = ResourceManager.new()
}

return Resources
