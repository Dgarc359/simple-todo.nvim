local popup = require("plenary.popup")
local _, sqlite = pcall(require, "sqlite")
local util = require("lua.simple-nvim-todo.util")

local M = { }

function M.todos()
    -- local db = sqlite.open("todo.db")
    local db = sqlite:open("todo.db")

    local items = db:select("todo_list", {where = { completed = 'No' }})
    -- local items = sqlite:with_open("todo.db", function(db)
    --   return db:eval("SELECT * FROM todo_list WHERE completed == 'No';")
    -- end)
    -- util.pretty_print(items, "")


   -- local win_id = popup.create({ "menu item 1"}, {})
   local win_id = popup.create({ "menu item 1", items[1].description }, {})

end

return M
