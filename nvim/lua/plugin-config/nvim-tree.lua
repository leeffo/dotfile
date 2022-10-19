-- https://github.com/nvim-tree/nvim-tree.lua
local status, nvim_tree = pcall(require, "nvim-tree")

local map = vim.api.nvim_set_keymap
map( "n", "<A-m>", ":NvimTreeToggle<CR>", {noremap = true, silent = true } )
map( "n", "<leader>m", ":NvimTreeToggle<CR>", {noremap = true, silent = true } )

nvim_tree.setup({
    view = {
        adaptive_size = true,
        -- 自定义列表中快捷键
        mappings = {
            -- 只用内置快捷键
            custom_only = true,
            list = {
                -- 打开文件或文件夹
                { key = { "o", "<2-LeftMouse>" }, action = "edit" },
                { key = { "<CR>" }, action = "system_open" },
                -- v分屏打开文件
                { key = { "v" }, action = "vsplit" },
                -- h分屏打开文件
                { key = { "h" }, action = "split" },
                -- Ignore (node_modules)
                { key = { "i" }, action = "toggle_ignore" },
                -- Hide (dotfile)
                { key = { "." }, action = "toggle_dotfile" },
                { key = { "R" }, action = "refresh" },
                -- 文件操作
                { key = { "a" }, action = "create" },
                { key = { "d" }, action = "remove" },
                { key = { "r" }, action = "rename" },
                { key = { "x" }, action = "cut" },
                { key = { "c" }, action = "copy" },
                { key = { "p" }, action = "paste" },
                { key = { "y" }, action = "copy_name" },
                { key = { "Y" }, action = "copy_path" },
                { key = { "gy" }, action = "copy_absolute_path" },
                { key = { "I" }, action = "toggle_file_info" },
                { key = { "n" }, action = "tabnew" },
                -- 进入下一级
                { key  = "]", action = "cd" },
                -- 进入上一级
                { key  = "[", action = "dir_up" },
            }
        },
        -- 宽度
        width = 30,
        -- 也可以 'right'
        side = "left",
        -- 隐藏根目录
        hide_root_folder = false,
        -- 不显示行数
        number = false,
        relativenumber = false,
        -- 显示图标
        signcolumn = "yes",
        -- 浮动文件管理器
        float = {
            enable = false,
            open_win_config = {
                border = "rounded",
                width = 30,
                height = 20,
                row = 0,
                col = 999,
            },
        },
    },
    -- project plugin 需要这样设置
    sync_root_with_cwd = true,
    update_focused_file = {
        enable = true,
        update_root = true,
        ignore_list = {},
    },
    -- 完全禁止内置netrw
    disable_netrw = true,
    -- 显示 git 状态图标
    git = {
        enable = true,
    },
    filters = {
      -- 隐藏 .文件
      dotfiles = false,
      -- 隐藏 node_modules 文件夹
      -- custom = { "node_modules" },
    },
    actions = {
        open_file = {
            -- 首次打开大小适配
            resize_window = true,
            -- 打开文件时关闭 tree
            quit_on_open = false,
        },
    },
    -- wsl install -g wsl-open
    -- https://github.com/4U6U57/wsl-open/
    system_open = {
        -- mac
        cmd = "open",
        -- windows
        -- cmd = "wsl-open",
    },
})

if not status then
    vim.notify("没有找到 nvim-tree")
    return
end

