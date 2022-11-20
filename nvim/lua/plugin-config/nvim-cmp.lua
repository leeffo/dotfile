-- https://github.com/hrsh7th/nvim-cmp
local status, nvim_cmp = pcall(require, "cmp")

local kind_icons = {
    Text = "",
    Method = "",
    Function = "",
    Constructor = "",
    Field = "",
    Variable = "",
    Class = "ﴯ",
    Interface = "",
    Module = "",
    Property = "ﰠ",
    Unit = "",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "",
    Event = "",
    Operator = "",
    TypeParameter = ""
}

nvim_cmp.setup ({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },

    window = {
        completion = nvim_cmp.config.window.bordered(),
        documentation = nvim_cmp.config.window.bordered(),
    },

    mapping = nvim_cmp.mapping.preset.insert({
        ['C-b'] = nvim_cmp.mapping.scroll_docs(-4),
        ['C-f'] = nvim_cmp.mapping.scroll_docs(4),
        ['C-Space'] = nvim_cmp.mapping.complete(),
        ['C-e'] = nvim_cmp.mapping.abort(),
        ['CR'] = nvim_cmp.mapping.confirm({ select = true }),
    }),

    sources = nvim_cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'cmp_tabline' },
        { name = 'nvim_lua' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'spell' },
        { name = 'path' },
    }),

    view = {
        entries = {
            name = 'custom',
            selection_order = 'near_cursor',
        }
    },

    formatting = {
        format = function(entry, vim_item)
            vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
            vim_item.menu = ({
                nvim_lsp = "[LSP]",
                cmp_tabline = "[TabLine]",
                nvim_lua = "[Nvim_LUA]",
                luasnip = "[LuaSnip]",
                buffer = "[Buffer]",
                spell = "[Spell]",
                path = "[Path]",
            })[entry.source.name]
            return vim_item
        end,
    },
})

nvim_cmp.setup.filetype(
    'gitcommit',
    {
        sources = nvim_cmp.config.sources({
            { name = 'cmp_git' },
        }, {
            { name = 'buffer' },
        })
    }
)

nvim_cmp.setup.cmdline(
    { '/', '?' },
    {
        mapping = nvim_cmp.mapping.preset.cmdline(),
        sources = {
            { name = 'buffer'}
        }
    }
)

nvim_cmp.setup.cmdline(
    ':', 
    {
        mapping = nvim_cmp.mapping.preset.cmdline(),
        sources = nvim_cmp.config.sources({
            { name = 'path'}
        }, {
            { name = 'cmdline' }
        })
    }
)

--local capabilitiea = requires('cmp_nvim_lsp').default_capabilities()

if not status then
    vim.notify("没有找到 nvim-cmp")
end

