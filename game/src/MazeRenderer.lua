
local class = require 'middleclass'

local MazeRenderer = class 'MazeRenderer'

local lg = love.graphics

function MazeRenderer.static:getWall(edge)
    return (edge or {}).wall
end

function MazeRenderer.static:getDoor(edge)
    return (edge or {}).door
end

function MazeRenderer.static:getEvent(face)
    return (face or {}).event
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
    
    -- draw floor event
    if MazeRenderer:getEvent(square.floor) == 'stairs' then
        local x = 96
        local y = 176
        local w = 128
        local o = 8
        lg.setColor(1, 1, 1)
        lg.line(x, y, x + o, y - o)
        lg.line(x + w, y, x + w - o, y - o)
        local h = 0
        for i = 1, w, 2 do
            lg.line(x + i, y, x + i, y - h)
            if i < o then
                h = h + 2
            elseif i > (w - o) then
                h = h - 2
            end
        end
    end
    
    -- draw ceiling event
    if MazeRenderer:getEvent(square.ceiling) == 'stairs' then
        local x = 96
        local y = 16
        local w = 128
        local o = 8
        lg.setColor(1, 1, 1)
        lg.line(x, y, x + o, y + o)
        lg.line(x + w, y, x + w - o, y + o)
        local h = 0
        for i = 1, w, 2 do
            lg.line(x + i, y, x + i, y + h)
            if i < o then
                h = h + 2
            elseif i > (w - o) then
                h = h - 2
            end
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
    
    -- draw floor event
    if MazeRenderer:getEvent(square.floor) == 'stairs' then
        local x = 120
        local y = 152
        local w = 80
        local o = 16
        lg.setColor(1, 1, 1)
        lg.line(x, y, x + o, y - o)
        lg.line(x + w, y, x + w - o, y - o)
        local h = 0
        for i = 1, w, 2 do
            lg.line(x + i, y, x + i, y - h)
            if i < o then
                h = h + 2
            elseif i > (w - o) then
                h = h - 2
            end
        end
    end
    
    -- draw ceiling event
    if MazeRenderer:getEvent(square.ceiling) == 'stairs' then
        local x = 120
        local y = 40
        local w = 80
        local o = 16
        lg.setColor(1, 1, 1)
        lg.line(x, y, x + o, y + o)
        lg.line(x + w, y, x + w - o, y + o)
        local h = 0
        for i = 1, w, 2 do
            lg.line(x + i, y, x + i, y + h)
            if i < o then
                h = h + 2
            elseif i > (w - o) then
                h = h - 2
            end
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

function MazeRenderer.static:drawFrame()
    lg.setColor(0, 0, 0)
    lg.rectangle('fill', 0, 0, 320, 8 * 2)
    lg.rectangle('fill', 0, 200 - 8 * 3, 320, 8 * 3)
    lg.rectangle('fill', 0, 0, 8 * 2, 200)
    lg.rectangle('fill', 320 - 8 * 2, 0, 8 * 2, 200)
    
    lg.setColor(1, 1, 1)
    lg.rectangle('line', 8 + 2, 8 + 2, 304 - 3, 176 - 3)
    do
        local pos = { 8 + 2, 8 + 1 }
        pos[3] = pos[1] + 300
        pos[4] = pos[2]
        pos[5] = pos[3]
        pos[6] = pos[4] + 2
        pos[7] = pos[5] + 2
        pos[8] = pos[6]

        pos[9]  = pos[7]
        pos[10] = pos[8] + 171
        pos[11] = pos[9] - 2
        pos[12] = pos[10]
        pos[13] = pos[11]
        pos[14] = pos[12] + 2
        pos[15] = pos[1] + 1
        pos[16] = pos[14]
        pos[17] = pos[15]
        pos[18] = pos[16] - 2
        pos[19] = pos[17] - 2
        pos[20] = pos[18]
        pos[21] = pos[19]
        pos[22] = pos[8]
        pos[23] = pos[21] + 2
        pos[24] = pos[22]
        pos[25] = pos[23]
        pos[26] = pos[24] - 2
        lg.setColor(1, 1, 1)
        lg.line(pos)
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
    
    MazeRenderer:drawFrame()
end

return MazeRenderer
