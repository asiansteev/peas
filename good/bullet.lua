Bullet = class:new()

function Bullet:init(graphics, x, y)
  self.graphics = graphics
  self.x = x
  self.y = y
  self.initial_x = x
  self.initial_y = y
end
