function love.load()
    love.window.setMode( 500, 500 )
end

function love.update(dt)
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
end
