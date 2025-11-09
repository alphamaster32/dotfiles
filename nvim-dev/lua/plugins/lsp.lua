return {
    -- Main LSP Configuration
    'neovim/nvim-lspconfig',
    dependencies = {
        -- Useful status updates for LSP.
        { 'j-hui/fidget.nvim', opts = {} },
    },
    config = function()
        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
            callback = function(event)
                local map = function(keys, func, desc, mode)
                    mode = mode or 'n'
                    vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
                end

                vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { buffer = event.buf, desc = 'LSP: Open diagnostic float' })

                map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
                map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
                map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
                map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
                map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
                map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
                map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction', { 'n', 'x' })
                map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
            end,
        })

        -- LSP servers configuration
        local capabilities = vim.lsp.protocol.make_client_capabilities()

        -- Get lspconfig
        -- local lspconfig = vim.lsp.config()

        -- Configure each server using the standard approach
        vim.lsp.config('clangd', {
            capabilities = capabilities,
            root_markers = {
                'Makefile',
                'configure.ac',
                'configure.in',
                'config.h.in',
                'meson.build',
                'meson_options.txt',
                'build.ninja'
            },
            cmd = {
                'clangd',
                '--background-index',
                '--clang-tidy',
                '--header-insertion=iwyu',
                '--completion-style=detailed',
                '--fallback-style=llvm',
            },
            init_options = {
                usePlaceholders = true,
                completeUnimported = true,
                clangdFileStatus = true,
            },
        })

        vim.lsp.config('gopls', {
            capabilities = capabilities,
        })

        vim.lsp.config('rust_analyzer', {
            capabilities = capabilities,
            settings = {
                ['rust-analyzer'] = {
                    inlayHints = {
                        enable = true,
                    },
                    checkOnSave =  false
                },
            },
        })

        vim.lsp.config('zls', {
            capabilities = capabilities,
        })

        vim.lsp.config('lua_ls', {
            capabilities = capabilities,
            settings = {
                Lua = {
                    completion = {
                        callSnippet = 'Replace',
                    },
                    runtime = {
                        version = 'LuaJIT',
                        path = vim.split(package.path, ';'),
                    },
                    workspace = {
                        checkThirdParty = false,
                        library = { vim.env.VIMRUNTIME },
                    },
                    diagnostics = {
                        disable = { 'missing-fields' },
                        globals = {'vim'},
                    },
                    format = {
                        enable = false,
                    },
                },
            },
        })

        vim.lsp.config('pyright', {
            python = {
                analysis = {
                    useLibraryCodeForTypes = true,
                    diagnosticSeverityOverrides = {
                        reportUnusedVariable = "warning",
                    },
                    typeCheckingMode = "off", -- Set type-checking mode to off
                    diagnosticMode = "off", -- Disable diagnostics entirely
                },
            },
        })

        vim.lsp.enable({'clangd', 'gopls', 'rust_analyzer', 'zls', 'lua_ls', 'pyright'})
    end,
}
