Tack = class:new()

function Tack:init(graphics, x, y)
  self.graphics = graphics
  self.x = x
  self.y = y
  self.initial_x = x
  self.initial_y = y
  self.hp = 4
end
