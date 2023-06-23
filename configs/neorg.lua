local config
require("neorg").setup {
  load = {
    ["core.defaults"] = {},
    ["core.concealer"] = {},
    ["core.dirman"] = {
      config = {
        default_workspac = "notes",
        open_last_workspace = true,
        workspaces = {
          dr = "~/Projects/dirt_rally/doc",
          notes = "~/Documents/notes/",
        },
      },
    },
  },
}
return config
