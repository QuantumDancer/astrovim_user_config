return {
  { "tpope/vim-fugitive", lazy = false },
  { "tpope/vim-rhubarb", lazy = false },
  { "shumphrey/fugitive-gitlab.vim", lazy = false, 
    config = function()
      vim.g.fugitive_gitlab_domains = {"https://gitlab.cern.ch/", "https://git.bfg.privat/"}
    end
  },
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
}
