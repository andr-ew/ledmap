-- demo (maps 2011 4-lvl grid)

lm = include 'ledmap/lib/ledmap'
g = grid.connect()
lm:map(g, '2011')  

function init()
    grid_redraw()
end

function grid_redraw()
    for i = 0, 15 do
        g:led(i + 1, 1, i)
    end
    g:refresh()
end

g.key = function() grid_redraw() end

function cleanup()
    lm:unmap(g)
end
