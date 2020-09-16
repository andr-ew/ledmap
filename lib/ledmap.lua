lm = { scale = {} }

for i=0,15 do
    lm.scale[i] = i
end

presets = {}
presets['2011'] = {}

for i=0,15 do presets['2011'][i] = (i < 4 and i > 0) and 4 or i end

function lm:map(g, config)
    if type(config) == 'table' then 
        for i,v in ipairs(config) do self.scale[i - 1] = v end -- index from 0 !
    elseif type(config) == 'number' then
        for i=0,15 do
            self.scale[i] = (i < config) and 0 or 15
        end
    elseif type(config) == 'string' and presets[config] then 
        self.scale = presets[config]
    end

    local scale = self.scale
    if g.device then g.device.led = function(self, x, y, val)
        _norns.grid_set_led(self.dev, x, y, scale[val])
    end end
end

function lm:unmap(g)
    if g.device then g.device.led = grid.led end
end

return lm
