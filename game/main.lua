
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

local view

function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest")
    love.graphics.setLineStyle('rough')

    local w, h = 320, 200

    maid64.setup(w, h)
    resize(love.graphics.getDimensions())

    view = {
        left = {
            {
                north = {
                    wall = true,
                    door = "default",
                },
                east = {
                    wall = true,
                    door = "default",
                },
                south = {
                    wall = true,
                    door = "default",
                },
                west = {
                    wall = true,
                    door = "default",
                },
            }
        },
        front = {

        },
        right = {

        }
    }
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

    -- draw west wall
    if true then
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

        -- door
        if true then
            local pos = { 32 + 16, -32 + 32 }
            pos[3] = pos[1] + 32
            pos[4] = pos[2] + 32
            pos[5] = pos[3]
            pos[6] = pos[4] + 128 + 16
            pos[7] = pos[1]
            pos[8] = pos[6] + 32
            pos[9] = pos[1]
            pos[10] = pos[2]
            love.graphics.line(pos)
        end
    end
    -- draw east wall
    if true then
        local pos = { 320 - 32 + 1, -32 - 1 }
        pos[3] = pos[1] - 64
        pos[4] = pos[2] + 64
        pos[5] = pos[3]
        pos[6] = pos[4] + 128 + 2
        pos[7] = pos[1]
        pos[8] = pos[6] + 64
        pos[9] = pos[1]
        pos[10] = pos[2]
        love.graphics.line(pos)

        -- door
        if true then
            local pos = { 320 - 32 + 1 - 16, -32 - 1 + 32 }
            pos[3] = pos[1] - 32
            pos[4] = pos[2] + 32
            pos[5] = pos[3]
            pos[6] = pos[4] + 128 + 16 + 2
            pos[7] = pos[1]
            pos[8] = pos[6] + 32
            pos[9] = pos[1]
            pos[10] = pos[2]
            love.graphics.line(pos)
        end
    end

    -- draw west wall front 1
    if false then
        local pos = { 96, 32 }
        pos[3] = pos[1] + 32
        pos[4] = pos[2] + 32
        pos[5] = pos[3]
        pos[6] = pos[4] + 64
        pos[7] = pos[5] - 32
        pos[8] = pos[6] + 32
        pos[9] = pos[1]
        pos[10] = pos[2]
        love.graphics.line(pos)
    end

    -- draw east wall front 1
    if false then
        local pos = { 320 - 96 + 1, 32 - 1 }
        pos[3] = pos[1] - 32
        pos[4] = pos[2] + 32
        pos[5] = pos[3]
        pos[6] = pos[4] + 64 + 2
        pos[7] = pos[5] + 32
        pos[8] = pos[6] + 32
        pos[9] = pos[1]
        pos[10] = pos[2]
        love.graphics.line(pos)
    end
    
    -- draw north wall front 1
    if false then
        local pos = { 96, 32 }
        pos[3] = pos[1] + 128 + 1
        pos[4] = pos[2]
        pos[5] = pos[3]
        pos[6] = pos[4] + 128 + 1
        pos[7] = pos[5] - 128 - 1
        pos[8] = pos[6]
        pos[9] = pos[1]
        pos[10] = pos[2]
        love.graphics.line(pos)

        -- door
        if true then
            local pos = { 96 + 16, 32 + 16 }
            pos[3] = pos[1] + 96 + 1
            pos[4] = pos[2]
            pos[5] = pos[3]
            pos[6] = pos[4] + 112 + 1
            pos[7] = pos[5] - 96 - 1
            pos[8] = pos[6]
            pos[9] = pos[1]
            pos[10] = pos[2]
            love.graphics.line(pos[1], pos[2], pos[3] - 1, pos[4])
            love.graphics.line(pos[1], pos[2], pos[7], pos[8])
            love.graphics.line(pos[3], pos[4], pos[5], pos[6])
            --love.graphics.line(pos)
            --love.graphics.line(pos)
        end
    end
    
    -- draw north wall left 1
    if false then
        local pos = { 96 - 128 - 1, 32 }
        pos[3] = pos[1] + 128 + 1
        pos[4] = pos[2]
        pos[5] = pos[3]
        pos[6] = pos[4] + 128 + 1
        pos[7] = pos[5] - 128 - 1
        pos[8] = pos[6]
        pos[9] = pos[1]
        pos[10] = pos[2]
        love.graphics.line(pos)

        -- door
        if true then
            local pos = { 96 - 128 - 1 + 16, 32 + 16 }
            pos[3] = pos[1] + 96 + 1
            pos[4] = pos[2]
            pos[5] = pos[3]
            pos[6] = pos[4] + 112 + 1
            pos[7] = pos[5] - 96 - 1
            pos[8] = pos[6]
            pos[9] = pos[1]
            pos[10] = pos[2]
            love.graphics.line(pos[1], pos[2], pos[3] - 1, pos[4])
            love.graphics.line(pos[1], pos[2], pos[7], pos[8])
            love.graphics.line(pos[3], pos[4], pos[5], pos[6])
            --love.graphics.line(pos)
            --love.graphics.line(pos)
        end
    end
    
    -- draw north wall right 1
    if false then
        local pos = { 96 + 128 + 1, 32 }
        pos[3] = pos[1] + 128 + 1
        pos[4] = pos[2]
        pos[5] = pos[3]
        pos[6] = pos[4] + 128 + 1
        pos[7] = pos[5] - 128 - 1
        pos[8] = pos[6]
        pos[9] = pos[1]
        pos[10] = pos[2]
        love.graphics.line(pos)

        -- door
        if true then
            local pos = { 96 + 128 + 1 + 16, 32 + 16 }
            pos[3] = pos[1] + 96 + 1
            pos[4] = pos[2]
            pos[5] = pos[3]
            pos[6] = pos[4] + 112 + 1
            pos[7] = pos[5] - 96 - 1
            pos[8] = pos[6]
            pos[9] = pos[1]
            pos[10] = pos[2]
            love.graphics.line(pos[1], pos[2], pos[3] - 1, pos[4])
            love.graphics.line(pos[1], pos[2], pos[7], pos[8])
            love.graphics.line(pos[3], pos[4], pos[5], pos[6])
            --love.graphics.line(pos)
            --love.graphics.line(pos)
        end
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
