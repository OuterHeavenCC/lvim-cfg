-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.format_on_save = true
lvim.lint_on_save = true
lvim.colorscheme = "nord"

-- keymappings
lvim.leader = "space"
-- overwrite the key-mappings provided by LunarVim for any mode, or leave it empty to keep them
-- lvim.keys.normal_mode = {
--   Page down/up
--   {'[d', '<PageUp>'},
--   {']d', '<PageDown>'},
--
--   Navigate buffers
--   {'<Tab>', ':bnext<CR>'},
--   {'<S-Tab>', ':bprevious<CR>'},
-- }
-- if you just want to augment the existing ones then use the utility function
-- require("utils").add_keymap_insert_mode({ silent = true }, {
-- { "<C-s>", ":w<cr>" },
-- { "<C-c>", "<ESC>" },
-- })
-- you can also use the native vim way directly
-- vim.api.nvim_set_keymap("i", "<C-Space>", "compe#complete()", { noremap = true, silent = true, expr = true })

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {}
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings
-- you can set a custom on_attach function that will be used for all the language servers
-- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- Additional Plugins
lvim.plugins = {
    {
        "ray-x/lsp_signature.nvim",
        config = function() require"lsp_signature".on_attach() end,
        event = "InsertEnter"
    },
    {
      "vimwiki/vimwiki"
    },
    {
      "folke/trouble.nvim"
    },
    {
      "tpope/vim-surround"
    },
    {
      "norcalli/nvim-colorizer.lua"
    },
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
lvim.autocommands.custom_groups = {
  { "BufWinLeave", "/home/corentin/.local/src/dmenu/config.h", "!doas make install" },
  { "BufWinLeave", "/home/corentin/.local/src/dwm/config.h", "!doas make install" },
  { "BufWinLeave", "/home/corentin/.local/src/dwmblocks/config.h", "!doas make install" },
  { "BufWinLeave", "/home/corentin/.local/src/sent/config.h", "!doas make install" },
  { "BufWinLeave", "/home/corentin/.local/src/st/config.h", "!doas make install" },
}

-- Dashboard configuration

lvim.builtin.dashboard.custom_header = { " Nord  "}
lvim.builtin.dashboard.footer = { " Corentin. " }
lvim.builtin.dashboard.custom_section = {
        a = {
        description = { "  Rechercher         " },
        command = "Telescope find_files",
      },
      b = {
        description = { "  Fichiers récents   " },
        command = "Telescope oldfiles",
      },
      c = {
        description = { "  Rechercher un mot  " },
        command = "Telescope live_grep",
      },
      d = {
        description = { "  Options            " },
        -- command = ":e " .. CONFIG_PATH .. "/lv-config.lua",
        command = ":e ~/.config/lvim/lv-config.lua",
      },
      e = {
        description = { "﬜  Wiki               " },
        command = ":VimwikiIndex"
      }
}

-- Vimscript commands

vim.cmd "set spelllang=fr"
vim.cmd "let g:vimwiki_list = [{'path': '~/.Wiki', 'syntax': 'markdown', 'ext': '.md'}]"
