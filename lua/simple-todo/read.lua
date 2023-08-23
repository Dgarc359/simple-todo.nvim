local popup = require("plenary.popup")
local _, sqlite = pcall(require, "sqlite")

local M = { }

function M.todos()
    -- local db = sqlite.open("todo.db")
    local db = sqlite:open("todo.db")

    local items = db:select("todo_list", {where = { completed = 'No' }})
    local mapped_items = {}
    table.foreach(items, function(k, v)
       table.insert(mapped_items, string.format("%s", v.description))
    end)

    return mapped_items
end

return M
