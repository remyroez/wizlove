
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
        local pos = { 24, -40 }
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
            local pos = { 24 + 16, -40 + 32 }
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
        local pos = { 320 - 40 + 1, -40 - 1 }
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
            local pos = { 320 - 40 + 1 - 16, -40 - 1 + 32 }
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
        local pos = { 88, 24 }
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
            local pos = { 88 + 16, 24 + 16 }
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
        local x = 88
        local y = 168
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
        local x = 88
        local y = 8
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
        local pos = { 88 - 128 - 1, 24 }
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
            local pos = { 88 - 128 - 1 + 16, 24 + 16 }
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
        local pos = { 88 + 128 + 1, 24 }
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
            local pos = { 88 + 128 + 1 + 16, 24 + 16 }
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
        local x = 88
        local y = 24
        local pos = { x, y }
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
            local pos = { x + 8, y + 16 }
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
        local x = 320 - 104
        local y = 24
        local pos = { x + 1, y - 1 }
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
            local pos = { x - 8, y + 16 }
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
        local x = 120
        local y = 56
        local pos = { x, y }
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
            local pos = { x + 8, y + 8 }
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
        local x = 112
        local y = 144
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
        local x = 112
        local y = 32
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

    -- draw west wall front 2
    if MazeRenderer:getWall(square.west) then
        local x = 88
        local y = 24
        local pos = { x + offset, y }
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
            local pos = { x + offset + 8, y + 16 }
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

    -- draw north wall front 2
    if MazeRenderer:getWall(square.north) then
        local x = 120
        local y = 56
        local pos = { x + offset, y }
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
            local pos = { x + offset + 8, y + 8 }
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

    -- draw east wall front 2
    if MazeRenderer:getWall(square.east) then
        local x = 320 - 104
        local y = 24
        local pos = { x + offset + 1, y - 1 }
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
            local pos = { x + offset - 8, y + 16 }
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
        local x = 120
        local y = 56
        local pos = { x + offset, y }
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
            local pos = { x + offset + 8, y + 8 }
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

function MazeRenderer.static:drawWall_front_3(square)
    if true then return end

    square = square or {}

    -- draw west wall front 3
    if MazeRenderer:getWall(square.west) then
        local pos = { 128, 64 }
        pos[3] = pos[1] + 16
        pos[4] = pos[2] + 16
        pos[5] = pos[3]
        pos[6] = pos[4] + 32
        pos[7] = pos[1]
        pos[8] = pos[6] + 16
        pos[9] = pos[1]
        pos[10] = pos[2]

        lg.setColor(0, 0, 0)
        lg.rectangle('fill', pos[1], pos[2] - 1, pos[5] - pos[1], pos[8] - pos[2] + 2)

        lg.setColor(1, 1, 1)
        lg.line(pos)

        -- door
        if MazeRenderer:getDoor(square.west) then
            local pos = { 128 + 4, 64 + 8 }
            pos[3] = pos[1] + 8
            pos[4] = pos[2] + 8
            pos[5] = pos[3]
            pos[6] = pos[4] + 32 + 4
            pos[7] = pos[1]
            pos[8] = pos[6] + 16 - 8
            pos[9] = pos[1]
            pos[10] = pos[2]
            lg.line(pos)
        end
    end

    -- draw east wall front 3
    if MazeRenderer:getWall(square.east) then
        local pos = { 320 - 128 + 1, 64 - 1 }
        pos[3] = pos[1] - 16
        pos[4] = pos[2] + 16
        pos[5] = pos[3]
        pos[6] = pos[4] + 32 + 2
        pos[7] = pos[1]
        pos[8] = pos[6] + 16
        pos[9] = pos[1]
        pos[10] = pos[2]

        lg.setColor(0.5, 0.5, 0.5)
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

function MazeRenderer.static:drawWall_left_3(square)
end

function MazeRenderer.static:drawWall_right_3(square)
end

function MazeRenderer.static:drawWall_front_4(square)
end

function MazeRenderer.static:drawWall_left_4(square)
end

function MazeRenderer.static:drawWall_right_4(square)
end

function MazeRenderer:drawFrame()
    lg.setColor(0, 0, 0)
    lg.rectangle('fill', 0, 0, self.width, 8)
    lg.rectangle('fill', 0, self.height - 8, self.width, 8)
    lg.rectangle('fill', 0, 0, 8, self.height)
    lg.rectangle('fill', self.width - 8, 0, 8, self.height)

    lg.setColor(1, 1, 1)
    lg.rectangle('line', 2, 2, 304 - 3, 176 - 3)
    do
        local pos = { 2, 1 }
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
    self.width = 8 * 38
    self.height = 8 * 22
    self.dirty = false
    self:setupCanvas()
    self:setupPattern()
    self:resetView()
end

function MazeRenderer:setupCanvas()
    self.canvas = lg.newCanvas(self.width, self.height)
end

function MazeRenderer:setupPattern()
    self.pattern = lg.newCanvas(8, 8)
    self.pattern:setFilter("nearest")
    self.pattern:setWrap("repeat")

    lg.setLineStyle('rough')

    lg.setCanvas(self.pattern)
    lg.clear(0, 0, 0)

    lg.setColor(1, 1, 1)
    for i = 0, 8, 2 do
        lg.line(i, 0, i + 8, 8)
        lg.line(0, i, 8, i + 8)
    end

    lg.setCanvas()
    
    self.quad = lg.newQuad(0, 0, 8 * 38, 8 * 22, self.pattern:getDimensions())
end

function MazeRenderer:resetView(view)
    self.view = view or {}
    self.view.front = self.view.front or {}
    self.view.left = self.view.left or {}
    self.view.right = self.view.right or {}

    self.dirty = true
end

function MazeRenderer:renderView()
    local canvas = lg.getCanvas()

    lg.setCanvas(self.canvas)
    lg.clear(0, 0, 0)

    MazeRenderer:drawWall_left_4(self.view.left[4])
    MazeRenderer:drawWall_right_4(self.view.right[4])
    MazeRenderer:drawWall_front_4(self.view.front[4])

    MazeRenderer:drawWall_left_3(self.view.left[3])
    MazeRenderer:drawWall_right_3(self.view.right[3])
    MazeRenderer:drawWall_front_3(self.view.front[3])

    MazeRenderer:drawWall_left_2(self.view.left[2])
    MazeRenderer:drawWall_right_2(self.view.right[2])
    MazeRenderer:drawWall_front_2(self.view.front[2])

    MazeRenderer:drawWall_left_1(self.view.left[1])
    MazeRenderer:drawWall_right_1(self.view.right[1])
    MazeRenderer:drawWall_front_1(self.view.front[1])
    
    self:drawFrame()

    lg.setCanvas(canvas)
end

function MazeRenderer:draw(...)

    if self.dirty then self:renderView() end

    lg.setColor(1, 1, 1)
    lg.draw(self.canvas, ...)
end

return MazeRenderer
