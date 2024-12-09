local io = require"io"

local list_item_label = "├"

local function print_table_raw(tab, indent)
    if not (type(tab) == "table") then
        io.write(("\t"):rep(indent))
        print(tab)
        return
    end
    if indent > 0 then
        print()
    end
    for i, v in pairs(tab) do
        io.write(("  "):rep(indent), ("%s[%s]:\t"):format(list_item_label, i))
        print_table_raw(v, indent + 1)
    end
end

--- Print a table with it's key
--- @param tb table
--- @return nil
local function print_table(tb)
    io.write(("\x1b[4m%s\x1b[0m\n"):format(tb))
    return print_table_raw(tb, 0)
end

return print_table
