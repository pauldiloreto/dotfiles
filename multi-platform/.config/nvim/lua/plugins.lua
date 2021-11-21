-- Automatically install Packer, if not already
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

vim.cmd([[packadd packer.nvim]])
local packer = require'packer'

return packer.startup(function()
  -- TODO unsure if this is worth the effort
  -- Text Navigation 
  -- use 'unblevable/quick-scope'
  -- Easymotion
  -- use 'easymotion/vim-easymotion'

  -- TODO after LSP is set up
  -- Treesitter (LSP-based syntax highlighting)
  -- use 'nvim-treesitter/nvim-treesitter'
  -- use 'p00f/nvim-ts-rainbow'

  use 'sheerun/vim-polyglot' -- Better syntax highlighing
  use 'windwp/nvim-autopairs'
  use 'suy/vim-context-commentstring' -- Useful for React commenting
  use 'tpope/vim-commentary' -- Better commenting
  use 'tpope/vim-surround' -- Surround text objects with {[()]}
  use 'AndrewRadev/tagalong.vim' -- Auto change HTML tags
  use 'moll/vim-bbye' -- Keep windows open when closing buffer
  use 'christoomey/vim-tmux-navigator' -- Tmux Integration
  use 'psliwka/vim-smoothie' -- Smooth scrolling
  use 'kyazdani42/nvim-web-devicons' -- Cool icons
  use 'romgrk/barbar.nvim' -- Better tab line
  -- Floating terminal for LF file explorer
  use {
    'voldikss/vim-floaterm',
    setup = function()
      vim.g.floaterm_opener = 'edit'
    end,
  }

  -- Git Integration
  use 'tpope/vim-fugitive'
  use 'junegunn/gv.vim'
  use 'rhysd/git-messenger.vim'
  use {
    'airblade/vim-gitgutter',
    setup = function()
      vim.g.gitgutter_highlight_linenrs = 1
    end
  }

  -- Emmet/Snippets
  use {
    'mattn/emmet-vim',
    requires = { 'mattn/webapi-vim' },
    config = function()
      vim.cmd([[
        let g:user_emmet_settings = webapi#json#decode(join(readfile(expand('~/.config/nvim/snippets.json')), "\n"))
      ]])
    end
  }
  use 'mattn/webapi-vim'

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' }
  }

  -- Nvim Tree file explorer
  use {
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons' }
  }

  -- Color hex codes
  use {
    'norcalli/nvim-colorizer.lua',
    config = function()
      vim.opt.termguicolors = true
      require'colorizer'.setup {
        '*';
        css = { css = true }
      }
    end
  }
  -- Intellisense
  use {
    'neoclide/coc.nvim',
    branch = 'release',
    config = function()
      vim.g.coc_global_extensions = {
        'coc-flow',
        'coc-tsserver',
        'coc-prettier',
        'coc-eslint',
        'coc-css',
        'coc-html',
        'coc-json',
        'coc-yaml',
        'coc-rls'
      }
    end
  }
  -- TODO
  -- use 'neovim/nvim-lspconfig'
  -- use 'hrsh7th/nvim-compe'
  -- use 'glepnir/lspaga.nvim'
  -- use 'onsails/lspkind-nvim'
  -- use 'kosayoda/nvim-lightbulb'
  -- use 'mfussenegger/nvim-jdtls'
  -- use 'mfussenegger/nvim-dap'

  -- Markdown Preview
  use {
    'iamcco/markdown-preview.nvim',
    run = 'cd app && npm install'
  }
  -- Status Line
  use {
  'nvim-lualine/lualine.nvim',
  requires = { 'kyazdani42/nvim-web-devicons' }
}
  -- Color schemes
  use {
    'arcticicestudio/nord-vim',
    config = function()
      vim.cmd('colorscheme nord') 
    end
  }

  use 'wbthomason/packer.nvim' -- Packer manages itself!
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
