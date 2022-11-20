-- https://github.com/williamboman/mason-lspconfig.nvim
local status, mason_lspconfig = pcall(require, "mason-lspconfig")

mason_lspconfig.setup({
    ensure_installed = {
        "clangd",           -- C/C++
        "cmake",            -- CMake
        "dockerls",         -- Docker
        "golangci_lint_ls", -- Go
        "gradle_ls",        -- Grandle
        "html",             -- HTML
        "jsonls",           -- JSON
        "jdtls",            -- Java
        "quick_lint_js",    -- JavaScript
        "sumneko_lua",      -- Lua
        "marksman",         -- Markdown
        "nimls",            -- Nim
        "rnix",             -- Nix
        "intelephense",     -- PHP
        "pyright",          -- Python
        "rust_analyzer",    -- Rust
        "sqlls",            -- SQL
        "taplo",            -- TOML
        "vls",              -- V
        "volar",            -- Vue
        "wgsl_analyzer",    -- WGSL
        "lemminx",          -- XML
        "yamlls",           -- YAML
    },
    automatic_installation = true,
})

if not status then
    vim.notify("没有找到 mason-lspconfig")
end

