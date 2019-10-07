
local Map = require 'core/map'
local Util = require 'core/util'
local gamera = require 'core/gamera'
love.graphics.setDefaultFilter('nearest', 'nearest')
cc(x1, y1, w1, h1, x2, y2, w2, h2)
function love.load()
  cam = gamera.new(0, 0, 1000, 1000)
  playerImg = love.graphics.newImage('assets-1/monster/human.png')
  x = 400
  y = 550
  enemy = love.graphics.newImage('assets-1/monster/ironheart_preserver.png')
  a = 560
  i = 550
  enemy2 = love.graphics.newImage('assets-1/monster/ironbrand_convoker.png')
  c = 600
  d = 600
  enemy3 = love.graphics.newImage('assets-1/monster/ironbrand_convoker.png')
  e = 600
  f = 500
  questItem = love.graphics.newImage('assets-1/item/amulet/artefact/urand_vitality.png')
  g = 675
  b = 550
  tile = love.graphics.newImage('assets-1/dungeon/floor/sand_6.png')
  path = love.graphics.newImage('assets-1/dungeon/wall/lab-stone_0.png')
  w = 64   -- The player's width is 64
  h = 64   -- The player's height is 64
  hp = 100 -- Set the player's HP to 100 at the start of the game


  template = { --a 3 x 3 map with the altar texture in the middle
                 {tile, tile, tile, tile, path, tile, tile, tile, tile},
                 {tile, tile, tile, tile, path, tile, tile, tile, tile},
                 {tile, tile, tile, tile, path, tile, tile, tile, tile},
                 {tile, tile, tile, tile, path, tile, tile, tile, tile},
                 {tile, tile, tile, tile, path, tile, tile, tile, tile},
                 {tile, tile, tile, tile, path, tile, tile, tile, tile},
                 {tile, tile, tile, tile, path, tile, tile, tile, tile},
                 {tile, tile, tile, tile, path, tile, tile, tile, tile},
                 {tile, tile, tile, tile, path, tile, tile, tile, tile},
                 {tile, tile, tile, tile, path, tile, tile, tile, tile},
                 {tile, tile, tile, tile, path, tile, tile, tile, tile},
               }
  map = Map:new(template)
  map:changeScale(2)

end

function love.update(dt)
  if love.keyboard.isDown('right') then
    x = x + 1
  end
  if love.keyboard.isDown('left') then
    x = x - 1
  end
  if love.keyboard.isDown('down') then
    y = y + 1
  end
  if love.keyboard.isDown('up') then
    y = y - 1
  end
  if love.keyboard.isDown('d') then
    a = a + 1
  end
  if love.keyboard.isDown('a') then
    a = a - 1
  end
  if love.keyboard.isDown('s') then
    i = i + 1
  end
  if love.keyboard.isDown('w') then
    i = i - 1
  end
  cam:setPosition(x, y)
  -- x, y, w, h all represent the player's rectangle. The other values are a rectangle in the upper corner
  if cc(x, y, w, h,   0, 0, 64, 64) then
    -- if true, decrease HP:
    hp = hp - 1
  end
end

function love.draw()
  cam:draw(function(l, t, w, h)
  map:draw()
  love.graphics.print('AD 117, the peak of the Roman Empires might.', 0, 0)
  love.graphics.draw(playerImg, x, y)
  love.graphics.draw(enemy, a, b)
  love.graphics.draw(enemy2, c, d)
  love.graphics.draw(enemy3, e, f)
  love.graphics.draw(questItem, g, b)
  -- Draw the rectangle in the upper left corner
  love.graphics.rectangle('line', 0, 0, 64, 64)
  -- Print the player's HP in the top left corner
  love.graphics.print(hp, 0, 0)
    --Draw everything here. For example:
  end)
end
