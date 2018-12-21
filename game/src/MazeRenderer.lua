
local class = require 'middleclass'

local MazeRenderer = class 'MazeRenderer'

local lg = love.graphics

function MazeRenderer.static:getWall(edge)
    return (edge or {}).wall
end

function MazeRenderer.static:getDoor(edge)
    return (edge or {}).door
end

function MazeRenderer.static:drawWall_front_1(square)
    square = square or {}

    -- draw west wall
    if MazeRenderer:getWall(square.west) then
        local pos = { 32, -32 }
        pos[3] = pos[1] + 64
        pos[4] = pos[2] + 64
        pos[5] = pos[3]
        pos[6] = pos[4] + 128
        pos[7] = pos[5] - 64
        pos[8] = pos[6] + 64
        pos[9] = pos[1]
        pos[10] = pos[2]

        lg.setColor(0, 0, 0)
        lg.rectangle('fill', pos[1], pos[2], pos[5] - pos[1], pos[8] - pos[2])

        lg.setColor(1, 1, 1)
        lg.line(pos)

        -- door
        if MazeRenderer:getDoor(square.west) then
            local pos = { 32 + 16, -32 + 32 }
            pos[3] = pos[1] + 32
            pos[4] = pos[2] + 32
            pos[5] = pos[3]
            pos[6] = pos[4] + 128 + 16
            pos[7] = pos[1]
            pos[8] = pos[6] + 32
            pos[9] = pos[1]
            pos[10] = pos[2]
            lg.line(pos)
        end
    end
    
    -- draw east wall
    if MazeRenderer:getWall(square.east) then
        local pos = { 320 - 32 + 1, -32 - 1 }
        pos[3] = pos[1] - 64
        pos[4] = pos[2] + 64
        pos[5] = pos[3]
        pos[6] = pos[4] + 128 + 2
        pos[7] = pos[1]
        pos[8] = pos[6] + 64
        pos[9] = pos[1]
        pos[10] = pos[2]

        lg.setColor(0, 0, 0)
        lg.rectangle('fill', pos[1], pos[2], pos[5] - pos[1], pos[8] - pos[2])

        lg.setColor(1, 1, 1)
        lg.line(pos)

        -- door
        if MazeRenderer:getDoor(square.east) then
            local pos = { 320 - 32 + 1 - 16, -32 - 1 + 32 }
            pos[3] = pos[1] - 32
            pos[4] = pos[2] + 32
            pos[5] = pos[3]
            pos[6] = pos[4] + 128 + 16 + 2
            pos[7] = pos[1]
            pos[8] = pos[6] + 32
            pos[9] = pos[1]
            pos[10] = pos[2]
            lg.line(pos)
        end
    end
    
    -- draw north wall
    if MazeRenderer:getWall(square.north) then
        local pos = { 96, 32 }
        pos[3] = pos[1] + 128 + 1
        pos[4] = pos[2]
        pos[5] = pos[3]
        pos[6] = pos[4] + 128 + 1
        pos[7] = pos[5] - 128 - 1
        pos[8] = pos[6]
        pos[9] = pos[1]
        pos[10] = pos[2]

        lg.setColor(0, 0, 0)
        lg.rectangle('fill', pos[1], pos[2], pos[5] - pos[1], pos[8] - pos[2])

        lg.setColor(1, 1, 1)
        lg.line(pos)

        -- door
        if MazeRenderer:getDoor(square.north) then
            local pos = { 96 + 16, 32 + 16 }
            pos[3] = pos[1] + 96 + 1
            pos[4] = pos[2]
            pos[5] = pos[3]
            pos[6] = pos[4] + 112 + 1
            pos[7] = pos[5] - 96 - 1
            pos[8] = pos[6]
            pos[9] = pos[1]
            pos[10] = pos[2]
            lg.line(pos[1], pos[2], pos[3] - 1, pos[4])
            lg.line(pos[1], pos[2], pos[7], pos[8])
            lg.line(pos[3], pos[4], pos[5], pos[6])
            --lg.line(pos)
            --lg.line(pos)
        end
    end
end

function MazeRenderer.static:drawWall_left_1(square)
    square = square or {}

    -- draw north wall left 1
    if MazeRenderer:getWall(square.north) then
        local pos = { 96 - 128 - 1, 32 }
        pos[3] = pos[1] + 128 + 1
        pos[4] = pos[2]
        pos[5] = pos[3]
        pos[6] = pos[4] + 128 + 1
        pos[7] = pos[5] - 128 - 1
        pos[8] = pos[6]
        pos[9] = pos[1]
        pos[10] = pos[2]

        lg.setColor(0, 0, 0)
        lg.rectangle('fill', pos[1], pos[2], pos[5] - pos[1], pos[8] - pos[2])

        lg.setColor(1, 1, 1)
        lg.line(pos)

        -- door
        if MazeRenderer:getDoor(square.north) then
            local pos = { 96 - 128 - 1 + 16, 32 + 16 }
            pos[3] = pos[1] + 96 + 1
            pos[4] = pos[2]
            pos[5] = pos[3]
            pos[6] = pos[4] + 112 + 1
            pos[7] = pos[5] - 96 - 1
            pos[8] = pos[6]
            pos[9] = pos[1]
            pos[10] = pos[2]
            lg.line(pos[1], pos[2], pos[3] - 1, pos[4])
            lg.line(pos[1], pos[2], pos[7], pos[8])
            lg.line(pos[3], pos[4], pos[5], pos[6])
            --lg.line(pos)
            --lg.line(pos)
        end
    end
end

function MazeRenderer.static:drawWall_right_1(square)
    square = square or {}

    -- draw north wall right 1
    if MazeRenderer:getWall(square.north) then
        local pos = { 96 + 128 + 1, 32 }
        pos[3] = pos[1] + 128 + 1
        pos[4] = pos[2]
        pos[5] = pos[3]
        pos[6] = pos[4] + 128 + 1
        pos[7] = pos[5] - 128 - 1
        pos[8] = pos[6]
        pos[9] = pos[1]
        pos[10] = pos[2]

        lg.setColor(0, 0, 0)
        lg.rectangle('fill', pos[1], pos[2], pos[5] - pos[1], pos[8] - pos[2])

        lg.setColor(1, 1, 1)
        lg.line(pos)

        -- door
        if MazeRenderer:getDoor(square.north) then
            local pos = { 96 + 128 + 1 + 16, 32 + 16 }
            pos[3] = pos[1] + 96 + 1
            pos[4] = pos[2]
            pos[5] = pos[3]
            pos[6] = pos[4] + 112 + 1
            pos[7] = pos[5] - 96 - 1
            pos[8] = pos[6]
            pos[9] = pos[1]
            pos[10] = pos[2]
            lg.line(pos[1], pos[2], pos[3] - 1, pos[4])
            lg.line(pos[1], pos[2], pos[7], pos[8])
            lg.line(pos[3], pos[4], pos[5], pos[6])
            --lg.line(pos)
            --lg.line(pos)
        end
    end
end

function MazeRenderer.static:drawWall_front_2(square)
    square = square or {}

    -- draw west wall front 1
    if MazeRenderer:getWall(square.west) then
        local pos = { 96, 32 }
        pos[3] = pos[1] + 32
        pos[4] = pos[2] + 32
        pos[5] = pos[3]
        pos[6] = pos[4] + 64
        pos[7] = pos[1]
        pos[8] = pos[6] + 32
        pos[9] = pos[1]
        pos[10] = pos[2]

        lg.setColor(0, 0, 0)
        lg.rectangle('fill', pos[1], pos[2] - 1, pos[5] - pos[1], pos[8] - pos[2] + 2)

        lg.setColor(1, 1, 1)
        lg.line(pos)

        -- door
        if MazeRenderer:getDoor(square.west) then
            local pos = { 96 + 8, 32 + 16 }
            pos[3] = pos[1] + 16
            pos[4] = pos[2] + 16
            pos[5] = pos[3]
            pos[6] = pos[4] + 64 + 8
            pos[7] = pos[1]
            pos[8] = pos[6] + 32 - 16
            pos[9] = pos[1] - 1
            pos[10] = pos[2]
            lg.line(pos)
        end
    end

    -- draw east wall front 1
    if MazeRenderer:getWall(square.east) then
        local pos = { 320 + 1 - 96, 32 - 1 }
        pos[3] = pos[1] - 32
        pos[4] = pos[2] + 32
        pos[5] = pos[3]
        pos[6] = pos[4] + 64 + 2
        pos[7] = pos[5] + 32
        pos[8] = pos[6] + 32
        pos[9] = pos[1]
        pos[10] = pos[2]

        lg.setColor(0, 0, 0)
        lg.rectangle('fill', pos[1], pos[2], pos[5] - pos[1], pos[8] - pos[2])

        lg.setColor(1, 1, 1)
        lg.line(pos)

        -- door
        if MazeRenderer:getDoor(square.east) then
            local pos = { 320 - 96 - 8, 32 + 16 }
            pos[3] = pos[1] - 16 + 1
            pos[4] = pos[2] + 16 - 1
            pos[5] = pos[3]
            pos[6] = pos[4] + 64 + 2 + 8
            pos[7] = pos[1]
            pos[8] = pos[6] + 32 - 16 - 1
            pos[9] = pos[1] + 1
            pos[10] = pos[2]
            lg.line(pos)
        end
    end

    -- draw north wall front 1
    if MazeRenderer:getWall(square.north) then
        local pos = { 128, 64 }
        pos[3] = pos[1] + 64 + 1
        pos[4] = pos[2]
        pos[5] = pos[3]
        pos[6] = pos[4] + 64 + 1
        pos[7] = pos[5] - 64 - 1
        pos[8] = pos[6]
        pos[9] = pos[1]
        pos[10] = pos[2]

        lg.setColor(0, 0, 0)
        lg.rectangle('fill', pos[1], pos[2], pos[5] - pos[1], pos[8] - pos[2])

        lg.setColor(1, 1, 1)
        lg.line(pos)

        -- door
        if MazeRenderer:getDoor(square.north) then
            local pos = { 128 + 8, 64 + 8 }
            pos[3] = pos[1] + 48 + 1
            pos[4] = pos[2]
            pos[5] = pos[3]
            pos[6] = pos[4] + 56 + 1
            pos[7] = pos[5] - 48 - 1
            pos[8] = pos[6]
            pos[9] = pos[1]
            pos[10] = pos[2]
            lg.line(pos[1], pos[2], pos[3] - 1, pos[4])
            lg.line(pos[1], pos[2], pos[7], pos[8])
            lg.line(pos[3], pos[4], pos[5], pos[6])
        end
    end
end

function MazeRenderer.static:drawWall_left_2(square)
    square = square or {}

    local offset = -64

    -- draw west wall front 1
    if MazeRenderer:getWall(square.west) then
        local pos = { 96 + offset, 32 }
        pos[3] = pos[1] + 32
        pos[4] = pos[2] + 32
        pos[5] = pos[3]
        pos[6] = pos[4] + 64
        pos[7] = pos[1]
        pos[8] = pos[6] + 32
        pos[9] = pos[1]
        pos[10] = pos[2]

        lg.setColor(0, 0, 0)
        lg.rectangle('fill', pos[1], pos[2], pos[5] - pos[1], pos[8] - pos[2])

        lg.setColor(1, 1, 1)
        lg.line(pos)

        -- door
        if MazeRenderer:getDoor(square.west) then
            local pos = { 96 + 8 + offset, 32 + 16 }
            pos[3] = pos[1] + 16
            pos[4] = pos[2] + 16
            pos[5] = pos[3]
            pos[6] = pos[4] + 64 + 8
            pos[7] = pos[1]
            pos[8] = pos[6] + 32 - 16
            pos[9] = pos[1] - 1
            pos[10] = pos[2]
            lg.line(pos)
        end
    end

    -- draw north wall front 1
    if MazeRenderer:getWall(square.north) then
        local pos = { 128 + offset, 64 }
        pos[3] = pos[1] + 64
        pos[4] = pos[2]
        pos[5] = pos[3]
        pos[6] = pos[4] + 64 + 1
        pos[7] = pos[5] - 64
        pos[8] = pos[6]
        pos[9] = pos[1]
        pos[10] = pos[2]

        lg.setColor(0, 0, 0)
        lg.rectangle('fill', pos[1], pos[2], pos[5] - pos[1], pos[8] - pos[2])

        lg.setColor(1, 1, 1)
        lg.line(pos)

        -- door
        if MazeRenderer:getDoor(square.north) then
            local pos = { 128 + 8 + offset, 64 + 8 }
            pos[3] = pos[1] + 48
            pos[4] = pos[2]
            pos[5] = pos[3]
            pos[6] = pos[4] + 56 + 1
            pos[7] = pos[5] - 48
            pos[8] = pos[6]
            pos[9] = pos[1]
            pos[10] = pos[2]
            lg.line(pos[1], pos[2], pos[3] - 1, pos[4])
            lg.line(pos[1], pos[2], pos[7], pos[8])
            lg.line(pos[3], pos[4], pos[5], pos[6])
        end
    end
end

function MazeRenderer.static:drawWall_right_2(square)
    square = square or {}

    local offset = 64 + 1

    -- draw east wall front 1
    if MazeRenderer:getWall(square.east) then
        local pos = { 320 + 1 - 96 + offset, 32 - 1 }
        pos[3] = pos[1] - 32
        pos[4] = pos[2] + 32
        pos[5] = pos[3]
        pos[6] = pos[4] + 64 + 2
        pos[7] = pos[5] + 32
        pos[8] = pos[6] + 32
        pos[9] = pos[1]
        pos[10] = pos[2]

        lg.setColor(0, 0, 0)
        lg.rectangle('fill', pos[1], pos[2], pos[5] - pos[1], pos[8] - pos[2])

        lg.setColor(1, 1, 1)
        lg.line(pos)

        -- door
        if MazeRenderer:getDoor(square.east) then
            local pos = { 320 - 96 - 8 + offset, 32 + 16 }
            pos[3] = pos[1] - 16 + 1
            pos[4] = pos[2] + 16 - 1
            pos[5] = pos[3]
            pos[6] = pos[4] + 64 + 2 + 8
            pos[7] = pos[1]
            pos[8] = pos[6] + 32 - 16 - 1
            pos[9] = pos[1] + 1
            pos[10] = pos[2]
            lg.line(pos)
        end
    end

    -- draw north wall front 1
    if MazeRenderer:getWall(square.north) then
        local pos = { 128 + offset, 64 }
        pos[3] = pos[1] + 64
        pos[4] = pos[2]
        pos[5] = pos[3]
        pos[6] = pos[4] + 64 + 1
        pos[7] = pos[5] - 64
        pos[8] = pos[6]
        pos[9] = pos[1]
        pos[10] = pos[2]

        lg.setColor(0, 0, 0)
        lg.rectangle('fill', pos[1], pos[2], pos[5] - pos[1], pos[8] - pos[2])

        lg.setColor(1, 1, 1)
        lg.line(pos)

        -- door
        if MazeRenderer:getDoor(square.north) then
            local pos = { 128 + 8 + offset, 64 + 8 }
            pos[3] = pos[1] + 48
            pos[4] = pos[2]
            pos[5] = pos[3]
            pos[6] = pos[4] + 56 + 1
            pos[7] = pos[5] - 48
            pos[8] = pos[6]
            pos[9] = pos[1]
            pos[10] = pos[2]
            lg.line(pos[1], pos[2], pos[3] - 1, pos[4])
            lg.line(pos[1], pos[2], pos[7], pos[8])
            lg.line(pos[3], pos[4], pos[5], pos[6])
        end
    end
end

function MazeRenderer:initialize()
end

function MazeRenderer:draw(view)
    view = view or {}
    view.front = view.front or {}
    view.left = view.left or {}
    view.right = view.right or {}

    lg.push()
    --lg.translate(0, -100)

    MazeRenderer:drawWall_left_2(view.left[2])
    MazeRenderer:drawWall_right_2(view.right[2])
    MazeRenderer:drawWall_front_2(view.front[2])

    MazeRenderer:drawWall_left_1(view.left[1])
    MazeRenderer:drawWall_right_1(view.right[1])
    MazeRenderer:drawWall_front_1(view.front[1])

    lg.pop()
end

return MazeRenderer
