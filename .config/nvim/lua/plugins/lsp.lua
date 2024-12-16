
local lsp = require('lspconfig')
-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local overloads = require("lsp-overloads")

local function on_attach(client, bufnr)
    local buf_set_keymap = function(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local opts = { noremap = true, silent = true }

    -- Basic LSP keymaps
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)

    -- Only activate lsp-overloads for servers that support it
    if client.server_capabilities.signatureHelpProvider then
        overloads.setup(client, {
            keymaps = {
                next_signature = "<C-j>",
                prev_signature = "<C-k>",
            }
        })
    end
end

require'lspconfig'.gdscript.setup{}

require("mason-lspconfig").setup_handlers({
    function(server_name)
        lsp[server_name].setup {
            capabilities = capabilities
        }
    end,
    ["rust_analyzer"] = function()
        lsp.rust_analyzer.setup {
            capabilities = capabilities
        }
    end,
    ["pyright"] = function()
        lsp.pyright.setup {
            capabilities = capabilities
        }
    end,
    ["clangd"] = function()
        lsp.clangd.setup {
            capabilities = capabilities,
            on_attach = on_attach
        }
    end,
    ["cssls"] = function()
        lsp.cssls.setup {
            capabilities = capabilities
        }
    end,
})


vim.api.nvim_set_keymap('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', { noremap = true, silent = true })




