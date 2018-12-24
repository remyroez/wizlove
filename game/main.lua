
local maid64 = require 'maid64'

local MazeRenderer = require 'MazeRenderer'

local mazeRenderer = MazeRenderer()

local lg = love.graphics

local function resize(width, height)
    local w, h = lg.getDimensions()
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

local w, h = 320, 200

function love.load()
    lg.setDefaultFilter("nearest", "nearest")
    lg.setLineStyle('rough')

    maid64.setup(w, h)
    resize(lg.getDimensions())

    view = {
        left = {
            {
                north = {
                    wall = false,
                    door = true,
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
            },
            {
                north = {
                    wall = true,
                    door = true,
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
                    wall = false,
                    door = "default",
                },
            }
        },
        front = {
            {
                north = {
                    wall = false,
                    door = "default",
                },
                east = {
                    wall = false,
                    door = true,
                },
                south = {
                    wall = true,
                    door = "default",
                },
                west = {
                    wall = false,
                    door = true,
                },
                floor = {
                    event = 'stairs',
                },
                ceiling = {
                    event = 'stairs',
                },
            },
            {
                north = {
                    wall = true,
                    door = true,
                },
                east = {
                    wall = false,
                    door = true,
                },
                south = {
                    wall = true,
                    door = "default",
                },
                west = {
                    wall = false,
                    door = true,
                },
                floor = {
                    event = 'stairs',
                },
                ceiling = {
                    event = 'stairs',
                },
            },
            {
                north = {
                    wall = false,
                    door = false,
                },
                east = {
                    wall = true,
                    door = true,
                },
                south = {
                    wall = true,
                    door = true,
                },
                west = {
                    wall = true,
                    door = true,
                },
                floor = {
                    event = 'stairs',
                },
                ceiling = {
                    event = 'stairs',
                },
            }
        },
        right = {
            {
                north = {
                    wall = false,
                    door = true,
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
            },
            {
                north = {
                    wall = true,
                    door = true,
                },
                east = {
                    wall = false,
                    door = "default",
                },
                south = {
                    wall = true,
                    door = "default",
                },
                west = {
                    wall = false,
                    door = "default",
                },
            }
        }
    }

    mazeRenderer:resetView(view)
end

function love.update(dt)
end

function love.draw()
    lg.clear(0.5, 0.5, 0.5)

    maid64.start()
    lg.clear(0, 0, 0)

    mazeRenderer:draw(8, 8)

    lg.setColor(1, 1, 1)
    maid64.finish()
end

function love.resize(w, h)
    resize(w, h)
end

function love.keypressed(key, scancode, isrepeat)
    if key == 'escape' then
        love.event.quit()
    elseif key == 'f1' then
        local isFull, mode = love.window.getFullscreen()
        love.window.setFullscreen(not isFull)
    elseif key == 'f5' then
        love.event.quit('restart')
    else
        
    end
end
