function love.load()
  x = 400
  y = 300
  playerImg = love.graphics.newImage('assets-1/player/base/octopode_1.png')
end


function love.update(dt)

end


function love.draw()
  love.graphics.print('Hello, world!', 0, 0)
  love.graphics.draw(playerImg, x, y)
end


function love.keypressed(key)
  if key == 'up' then
    x = x + 1
  end
end