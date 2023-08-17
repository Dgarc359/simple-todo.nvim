local popup = require("plenary.popup")

local M = { }

Todo_win_id = nil
Todo_win_bufh = nil

local function create_ui()

    local bufnr = vim.api.nvim_create_buf(false, false)

    local Todo_win_id, win= popup.create(bufnr, {
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" }
    })

    return {
        bufnr = bufnr,
        win_id = Todo_win_id
    }
end

local function close_menu()
    vim.api.nvim_win_close(Todo_win_id, true)
    Todo_win_id = nil
    Todo_win_bufh = nil
end

function M.toggle_ui()
    if Todo_win_id ~= nil and vim.api.nvim_win_is_valid(Todo_win_id) then
        close_menu()
        return
    end

    local win_info = create_ui()
    Todo_win_id = win_info.win_id
    Todo_win_bufh = win_info.bufnr

    -- vim.api.nvim_buf_set_option(Todo_win_id, "number", true)
    vim.api.nvim_buf_set_name(Todo_win_bufh, "simple-todo-menu")
    -- vim.api.nvim_buf_set_lines(Todo_win_bufh, 0, #{"menu-item 1"}, false, {"menu-item 1"})
    vim.api.nvim_buf_set_keymap(
        Todo_win_bufh,
        "n",
        "q",
        "<Cmd>lua require('simple-todo.popup').toggle_ui()<CR>",
        { silent = true }
    )

end

return M
