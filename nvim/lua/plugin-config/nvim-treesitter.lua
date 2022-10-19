-- https://github.com/nvim-treesitter/nvim-treesitter

local status, treesitter = pcall(require, "nvim-treesitter.configs")

treesitter.setup({
    -- 安装 language parser
    -- :TSInstallInfo 命令查看支持的语言
    ensure_installed = {
        "bash",
        "c",
        "cpp",
        "css",
        "cmake",
        "html",
        "json",
        "lua",
        "make",
        "markdown",
        "python",
        "rust",
        "toml",
        "vim",
        "yaml",
    },
    -- ensure_installed = "maintained",

    -- 启用代码高亮模块
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },

    -- 启用代码缩进模块 (=)
    indent = {
        enable = true,
    },

    -- 启用增量选择模块
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<CR>",
            node_incremental = "<CR>",
            node_decremental = "<BS>",
            scope_incremental = "<TAB>",
        },
    },
})

-- 开启Folding模块
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- 默认不折叠
-- https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
vim.opt.foldlevel = 99

local map = vim.api.nvim_set_keymap
map("n", "zz", ":foldclose<CR>", { noremap = true, silent = true } )
map("n", "z", ":foldopen<CR>", { noremap = true, silent = true } )

if not status then
  vim.notify("没有找到 nvim-treesitter")
  return
end

