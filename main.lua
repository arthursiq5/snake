function love.load()
    love.window.setMode( 500, 500 )
    timer = 0
end

function love.update(dt)
    timer = timer + dt
    if timer >= 0.15 then
        timer = 0
        print('tick')
    end
end

function love.draw()
    local gridXCount = 20
    local gridYCount = 20
    local cellSize = 25

    love.graphics.setColor(.28, .28, .28)
    love.graphics.rectangle(
        'fill',
        0,
        0,
        gridXCount * cellSize,
        gridYCount * cellSize
    )

    local snakeSegments = {
        { x = 3, y = 1 },
        { x = 2, y = 1 },
        { x = 1, y = 1 },
    }

    for index, segment in ipairs(snakeSegments) do
        love.graphics.setColor( .6, 1, .32 )
        love.graphics.rectangle(
            'fill',
            (segment.x -1) * cellSize,
            (segment.y -1) * cellSize,
            cellSize - 1,
            cellSize - 1
        )
    end
end
