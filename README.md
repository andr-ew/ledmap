# setup

download that library & unzip, add the `ledmap` (make sure it is named "ledmap") folder to `dust/code`

at the top of a script or anywhere outside of a `function`, add `lm = include 'ledmap/lib/ledmap' `

# 2011 (4-step brightness) grids

at the bottom of the `init` function, add add `lm:map(g, '2011')` (this is the 2011 grid preset, alternatively you can send a table with 16 ints which remap every input level)

```
function init()
    ...

    lm:map(g, '2011')
end
```

(note: by convention the grid variable is named `g`, but the author could've named it something else)

# non-varibright grid

same location for the `map` function. instead of a preset or a table, you can send a single number, i.e. `lm:map(g, 8)`. levels below this number will be low, levels above will be high.


optional: add `led:unmap(g)` to the `cleanup` function if you don't want the mapping to persist between sessions, but usually this is not a big deal
