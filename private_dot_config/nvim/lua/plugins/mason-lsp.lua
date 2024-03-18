return {
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = function()
            require("mason").setup()
        end
    },
    {
        "neovim/nvim-lspconfig"
    },
    {
        "williamboman/mason-lspconfig.nvim",
        requires = {
            "williamboman/mason.nvim"
        },
        lazy = false,
        config = function()
            require("mason-lspconfig").setup()
        end
    },
    {
        'mfussenegger/nvim-dap'
    },
    {
        'nvimtools/none-ls.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        },
        config = function()
            require("null-ls").setup()
        end
    },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        requires = {
            "williamboman/mason.nvim"
        },
        config = function()
            require('mason-tool-installer').setup({
                ensure_installed = {
                    'lua_ls',
                    'vim-language-server',
                    'sqlls',
                    'shellcheck',
                    'ansible-language-server',
                    'bash-language-server',
                    'css-lsp',
                    'html-lsp',
                    'pyright',
                    'autopep8',
                    'flake8',
                    'isort',
                    'prettierd',
                    'eslint_d',
                    'sql-formatter',
                    'svelte-language-server',
                    'typescript-language-server'
                },
                auto_update = false,
                run_on_start = true
            })
        end
    },
}
