return {
  -- Add the community repository of plugin specifications
  -- available plugins can be found at https://github.com/AstroNvim/astrocommunity
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.docker" },
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.toml" },
  { import = "astrocommunity.pack.yaml" },
  { import = "astrocommunity.diagnostics.trouble-nvim" },
}
