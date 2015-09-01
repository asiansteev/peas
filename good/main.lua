function love.load()
  require "class"
  require "bullet"
  require "tack"

  love.graphics.setBackgroundColor(255, 255, 255)
  screen_x = 800
  screen_y = 600

  world = love.physics.newWorld(0, 0, true)

  love.graphics.setColor(153, 189, 75)
  
  main_pea = love.graphics.newImage("images/pea.png")
  pea_width = 39
  pea_height = 38
  x = (screen_x - pea_width) / 2
  y = screen_y - pea_height
  speed = 250

  max_bullets = 10
  bullets = {}
  time_between_bullets = 5
  bullet_timer = time_between_bullets
  bullet_width = 8
  bullet_height = 11
  bullet_speed = 13
  was_firing = false

      -- temp creating tack enemy
      t = Tack:new(
        love.graphics.newImage("images/tack.png"),
        100,
        100
      )
      love.graphics.draw(t.graphics, t.x, t.y)
end

function love.update(dt)
  if love.keyboard.isDown("right") and x < screen_x - pea_width then
    x = x + (speed * dt)
  elseif love.keyboard.isDown("left") and x > 0 then
    x = x - (speed * dt)
  end

  if love.keyboard.isDown("down") and y < screen_y - pea_height then
    y = y + (speed * dt)
  elseif love.keyboard.isDown("up") and y > 0 then
    y = y - (speed * dt)
  end

  if love.keyboard.isDown("a") then
    if bullet_timer <= 0 then
      -- create new bullet on screen
      b = Bullet:new(
        love.graphics.newImage("images/bullet.png"),
        x + pea_width/2 - bullet_width/2,
        y
      )
      love.graphics.draw(b.graphics, b.x, b.y)

      table.insert(bullets, b)
      bullet_timer = time_between_bullets
    else
      bullet_timer = bullet_timer - 1
    end
    
    -- destroy old bullets
    if # bullets > max_bullets then
      table.remove(bullets, 1)
    end
  else
    bullet_timer = 0
  end

  world:update(dt)
end

function love.draw()
  love.graphics.draw(main_pea, x, y)
  love.graphics.draw(t.graphics, t.x, t.y)

  
  for i, v in ipairs(bullets) do
    bullets[i].y = bullets[i].y - bullet_speed
    --    bullets[i].x = bullets[i].x +
    --              25 * math.cos(bullets[i].initial_y - bullets[i].y)
    love.graphics.draw(bullets[i].graphics, bullets[i].x, bullets[i].y)
  end
end
