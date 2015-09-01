Tack = class:new()

function Tack:init(graphics, x, y)
  self.graphics = graphics
  self.x = x
  self.y = y
  self.initial_x = x
  self.initial_y = y
  self.hp = 4

  self.body = love.physics.newBody(world, x, y, "dynamic")
  self.shape = love.physics.newCircleShape(5)
  self.fixture = love.physics.newFixture(self.body, self.shape)
  self.fixture:setUserData("Tack")
end
