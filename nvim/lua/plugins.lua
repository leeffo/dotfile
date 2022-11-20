-- 自动安装 Packer.nvim
-- 插件安装目录
-- ~/.local/share/nvim/site/pack/packer/
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local compiled_path = vim.fn.stdpath("config") .. "plugin/packer_compiled.lua"
local packer_bootstrap
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.notify("正在安装Pakcer.nvim，请稍后...")
    packer_bootstrap = vim.fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    -- "https://gitcode.net/mirrors/wbthomason/packer.nvim",
    install_path,
    })
    vim.fn.system({ 'rm', '-rf', compiled_path })

    -- https://github.com/wbthomason/packer.nvim/issues/750
    local rtp_addition = fn.stdpath("data") .. "/site/pack/*/start/*"
    if not string.find(vim.o.runtimepath, rtp_addition) then
        vim.o.runtimepath = rtp_addition .. "," .. vim.o.runtimepath
    end
    vim.notify("Pakcer.nvim 安装完毕")
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    vim.notify("没有安装 packer.nvim")
    return
end

packer.startup({
    function(use)
        -- Packer 可以升级自己
        use { "wbthomason/packer.nvim" }

        -------------------------- plugins -------------------------------------------

        -- 中文help doc
        use { "yianwillis/vimcdoc", event = 'VimEnter' }

        -- nvim-tree
        use {
            "nvim-tree/nvim-tree.lua",
            config = "require('plugin-config/nvim-tree')",
            requires = "nvim-tree/nvim-web-devicons",
        }

        -- treesitter
        use {
            "nvim-treesitter/nvim-treesitter",
            config = "require('plugin-config/nvim-treesitter')",
            run = ":TSUpdate",
        }

        -- bufferline
        use {
            "akinsho/bufferline.nvim",
            config = "require('plugin-config/bufferline')",
            requires = "nvim-tree/nvim-web-devicons",
        }

        -- lualine
        use {
            "nvim-lualine/lualine.nvim",
            config = "require('plugin-config/nvim-lines')",
            requires = "nvim-tree/nvim-web-devicons",
        }

        -- mason-lspconfig
        use { "williamboman/mason.nvim" }
        use {
            "williamboman/mason-lspconfig.nvim",
            config = "require('plugin-config/mason-lspconfig')",
        }
        use { "neovim/nvim-lspconfig" }

        -- nvim-cmp
        use {
            "hrsh7th/nvim-cmp",
            config = "require('plugin-config/nvim-cmp')",
        }
        use { "hrsh7th/cmp-nvim-lsp" }
        use { "hrsh7th/cmp-buffer" }
        use { "hrsh7th/cmp-path" }
        use { "hrsh7th/cmp-cmdline" }
        use { "L3MON4D3/LuaSnip" }
        use { "saadparwaiz1/cmp_luasnip" }

    end,
    config = {
        -- 锁定插件版本在snapshots目录
        -- snapshot_path = require("packer.util").join_paths(vim.fn.stdpath("config"), "snapshots"),
        -- 这里锁定插件版本在v1，不会继续更新插件
        -- snapshot = "v1",

        -- 最大并发数
        max_jobs = 16,
        -- 自定义源
        git = {
            -- default_url_format = "https://hub.fastgit.xyz/%s",
            -- default_url_format = "https://mirror.ghproxy.com/https://github.com/%s",
            -- default_url_format = "https://gitcode.net/mirrors/%s",
            -- default_url_format = "https://gitclone.com/github.com/%s",
        },
        display = {
                -- 使用浮动窗口显示
                open_fn = function()
                return require("packer.util").float({ border = "rounded" })
                end,
        },
    },
})

if packer_bootstrap then
    require('packer').sync()
end

