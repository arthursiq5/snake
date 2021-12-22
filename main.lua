function love.load()
    love.window.setMode( 500, 500 )
    snakeSegments = {
        { x = 3, y = 1 },
        { x = 2, y = 1 },
        { x = 1, y = 1 },
    }
    timer = 0
    directionQueue = { 'right' }
    direction = 'right'
    gridXCount = 20
    gridYCount = 20
    cellSize = 25
end

function love.update(dt)
    timer = timer + dt

    if timer >= 0.15 then
        timer = 0

        if #directionQueue > 1 then
            table.remove(directionQueue, 1)
        end
        
        local nextXPosition = snakeSegments[1].x
        local nextYPosition = snakeSegments[1].y

        if directionQueue[1] == 'right' then
            nextXPosition = nextXPosition + 1
            if nextXPosition > gridXCount then
                nextXPosition = 1
            end
        elseif directionQueue[1] == 'left' then
            nextXPosition = nextXPosition - 1
            if nextXPosition < 1 then
                nextXPosition = gridXCount
            end
        elseif directionQueue[1] == 'down' then
            nextYPosition = nextYPosition + 1
            if nextYPosition > gridYCount then
                nextYPosition = 1
            end
        elseif directionQueue[1] == 'up' then
            nextYPosition = nextYPosition - 1
            if nextYPosition < 1 then
                nextYPosition = gridYCount
            end
        end

        table.insert( snakeSegments, 1, { x = nextXPosition, y = nextYPosition } )
        table.remove( snakeSegments )
    end
end

function love.draw()
    love.graphics.setColor(.28, .28, .28)
    love.graphics.rectangle(
        'fill',
        0,
        0,
        gridXCount * cellSize,
        gridYCount * cellSize
    )

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

function love.keypressed(key)
    if key == 'right' and directionQueue[#directionQueue] ~= 'left' then
        table.insert(directionQueue, 'right')

    elseif key == 'left' and directionQueue[#directionQueue] ~= 'right' then
        table.insert(directionQueue, 'left')

    elseif key == 'up' and directionQueue[#directionQueue] ~= 'down' then
        table.insert(directionQueue, 'up')

    elseif key == 'down' and directionQueue[#directionQueue] ~= 'up' then
        table.insert(directionQueue, 'down')
    end
end
