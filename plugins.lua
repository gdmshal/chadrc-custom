local plugins = {
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    dependencies = {"nvim-lua/plenary.nvim"},
    config = function ()
      return require "custom.configs.neorg"
    end,
    lazy = false,
  }
}
return plugins
