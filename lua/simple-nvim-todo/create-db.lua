-- local _, sqlite = pcall(require, "sqlite")
local sqlite = require('sqlite')

local M = { }

function M.create_db()
    local db = sqlite.new('todo2.db'):open()
    local ok = db:create("todo", {
        id = true,
        title = "text",
    })

    local ok, data_id = db:insert('todo', {
        title = "test",
    })


    if ok then
        local todo_table = db:eval('Select * from todo')
        print(todo_table)
    end


end

return M
