Bullet = class:new()

function Bullet:init(graphics, x, y)
  self.graphics = graphics
  self.x = x
  self.y = y
  self.initial_x = x
  self.initial_y = y
  
  self.body = love.physics.newBody(world, x, y, "dynamic")
  self.shape = love.physics.newCircleShape(50)
  self.fixture = love.physics.newFixture(self.body, self.shape)
  self.fixture:setUserData("Tack")
end
