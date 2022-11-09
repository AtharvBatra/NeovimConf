local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1", "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer close and reopen nvim..."
    vim.cmd [[packadd packer.nvim]] end

-- Command that saves plugins whenever you edit plugins file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

--idk
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Packer window popup
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install Plugins

return packer.startup(function(use)
    -- Basic Plugins
    use "wbthomason/packer.nvim" 
    use "nvim-lua/popup.nvim" 
    use "nvim-lua/plenary.nvim"
    use "windwp/nvim-autopairs"
    use 'kyazdani42/nvim-web-devicons'
    use 'kyazdani42/nvim-tree.lua'
    use "moll/vim-bbye"
    use "akinsho/bufferline.nvim"
    use "ahmedkhalf/project.nvim"
    use 'lewis6991/impatient.nvim'
    use "lukas-reineke/indent-blankline.nvim"

    -- Vanity Plugins
    use 'nvim-lualine/lualine.nvim'
    use "navarasu/onedark.nvim"

    -- Intellisense Plugins --
    -- AutoComplete
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-cmdline"
    use "saadparwaiz1/cmp_luasnip"
    use "hrsh7th/cmp-nvim-lsp"

    -- Snippets
    use "L3MON4D3/LuaSnip"
    use "rafamadriz/friendly-snippets"

    -- LSP
    use "neovim/nvim-lspconfig"
    use "williamboman/mason.nvim"
    use "williamboman/mason-lspconfig.nvim"
    use "jose-elias-alvarez/null-ls.nvim"

    -- Telescope
    use "nvim-telescope/telescope.nvim"
    use 'nvim-telescope/telescope-media-files.nvim'

    -- Treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    }
    use "p00f/nvim-ts-rainbow"
    use "nvim-treesitter/playground"
    use "JoosepAlviste/nvim-ts-context-commentstring"

    -- Git
    use "lewis6991/gitsigns.nvim"

    -- Showoff
    use "andweeb/presence.nvim"

    -- Terminal
    use "akinsho/toggleterm.nvim"

    -- AutoSave
    use "Pocco81/auto-save.nvim"

    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
