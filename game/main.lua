
local maid64 = require 'maid64'

local function resize(width, height)
    local w, h = love.graphics.getDimensions()
    width = math.max(maid64.sizeX, math.floor((width or w) / maid64.sizeX) * maid64.sizeX)
    height = math.max(maid64.sizeY, math.floor((height or h) / maid64.sizeY) * maid64.sizeY)
    maid64.resize(width, height)
    if maid64.overscan then
        maid64.x = (w - (maid64.scaler * maid64.sizeX)) / 2
    else
        maid64.x = w / 2 - (maid64.scaler * (maid64.sizeX / 2))
    end
    maid64.y = h / 2 - (maid64.scaler * (maid64.sizeY / 2))

    maid64.x = math.floor(maid64.x);
    maid64.y = math.floor(maid64.y);
end

function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest")
    love.graphics.setLineStyle('rough')

    local w, h = 320, 200

    maid64.setup(w, h)
    resize(love.graphics.getDimensions())
end

function love.update(dt)
end

function love.draw()
    love.graphics.clear(0.5, 0.5, 0.5)
    maid64.start()
    love.graphics.clear(0, 0, 0)

    love.graphics.push()
    --love.graphics.translate(0, 100)

    love.graphics.setColor(1, 1, 1)
    -- draw left wall
    do
        local pos = { 32, -32 }
        pos[3] = pos[1] + 64
        pos[4] = pos[2] + 64
        pos[5] = pos[3]
        pos[6] = pos[4] + 128
        pos[7] = pos[5] - 64
        pos[8] = pos[6] + 64
        pos[9] = pos[1]
        pos[10] = pos[2]
        love.graphics.line(pos)
    end
    -- draw right wall
    do
        local pos = { 320 - 32 + 1, -32 }
        pos[3] = pos[1] - 64
        pos[4] = pos[2] + 64 - 1
        pos[5] = pos[3]
        pos[6] = pos[4] + 128 + 2
        pos[7] = pos[5] + 64
        pos[8] = pos[6] + 64 - 1
        pos[9] = pos[1]
        pos[10] = pos[2]
        love.graphics.line(pos)
    end

    love.graphics.pop()
    --love.graphics.line(0, 32 - 96, 96, 32)
---[[
    love.graphics.setColor(0, 0, 0)
    love.graphics.rectangle('fill', 0, 0, 320, 8 * 2)
    love.graphics.rectangle('fill', 0, 200 - 8 * 3, 320, 8 * 3)
    love.graphics.rectangle('fill', 0, 0, 8 * 2, 200)
    love.graphics.rectangle('fill', 320 - 8 * 2, 0, 8 * 2, 200)
    love.graphics.setColor(1, 1, 1)
--]]
    maid64.finish()
end

function love.resize(w, h)
    resize(w, h)
end

function love.keypressed(key, scancode, isrepeat)
    if key == 'escape' then
        love.event.quit()
    elseif key == 'f5' then
        love.event.quit('restart')
    else
        
    end
end
