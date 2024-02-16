return {
  { "tpope/vim-fugitive", lazy = false },
  { "tpope/vim-rhubarb", lazy = false },
  {
    "shumphrey/fugitive-gitlab.vim",
    lazy = false,
    config = function() vim.g.fugitive_gitlab_domains = { "https://gitlab.cern.ch/", "https://git.bfg.privat/" } end,
  },
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
      "catppuccin",
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    opts = {
      -- configurations go here
    },
  },
}
