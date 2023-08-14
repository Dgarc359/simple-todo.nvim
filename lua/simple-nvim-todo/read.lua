--local popup = require("plenary.popup")
local _, sqlite = pcall(require, "sqlite")

local M = { }

function M.todos()
    -- local db = sqlite.open("todo.db")
    local db = sqlite:open("todo.db")

    local items = db:select("todo_list", {where = { completed = 'No' }})
    -- local items = sqlite:with_open("todo.db", function(db)
    --   return db:eval("SELECT * FROM todo_list WHERE completed == 'No';")
    -- end)
    print(items)
    for k, v in ipairs(items) do
        -- print(tostring(v))
        for k2, v2 in ipairs(v) do
            print(v2)
        end
    end


    -- local win_id = popup.create({ "menu item 1"}, {})

end

return M
