local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    return
end

configs.setup {
    sync_install = false,
    ignore_intall = {""},
    autopairs = {
        enable = true,
    },
    highlight = {
        enable = true,
        disable = {""},
        additional_vim_regex_highlighting = true,
    },
    indent = { enable = true, disable = { "yaml" } },
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    },
}
