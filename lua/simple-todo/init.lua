local read = require("simple-todo.read")
local popup = require("simple-todo.popup")
local M = { }

M.read_todos = read.todos
M.toggle_ui = popup.toggle_ui

return M
