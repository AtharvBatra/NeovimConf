local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
    return
end

require "main.lsp.mason"
require("main.lsp.handlers").setup()
require "main.lsp.null-ls"
