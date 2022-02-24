return function()
    local null_ls = require("null-ls")
    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics
    local code_actions = null_ls.builtins.code_actions

    null_ls.setup({
        sources = {
            formatting.stylua,
            formatting.eslint_d, -- Faster for formatting on save
            diagnostics.eslint_d,
            code_actions.eslint_d,
            formatting.prettierd,
            formatting.stylua,
            formatting.black, -- Python formatter
        },
        on_attach = function(client)
            if client.resolved_capabilities.document_formatting then
                vim.cmd([[
            augroup LspFormatting
                autocmd! * <buffer>
                autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
            augroup END
            ]])
            end
        end,
    })
end
