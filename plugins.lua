local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options
	{
		"mfussenegger/nvim-dap",
		config = function (_, opts)
			require("core.utils").load_mappings("dap")
		end
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = "mfussenegger/nvim-dap",
		config = function ()
			local dap = require("dap")
			local dapui = require("dapui")
			dapui.setup()
			dap.listeners.after.event_initialized["dapui_config"] = function ()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function ()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function ()
				dapui.close()
			end
		end
	},
	{
		"mfussenegger/nvim-dap-python",
		ft = "python",
		dependencies = {
			"mfussenegger/nvim-dap",
			"rcarriga/nvim-dap-ui",
		},
		config = function (_, opts)
			local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
			require("dap-python").setup(path)
			require("core.utils").load_mappings("dap_python")
		end,
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		ft = {"python"},
		opts = function ()
			return require "custom.configs.null-ls"
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
		-- format & linting
		{
			"jose-elias-alvarez/null-ls.nvim",
			config = function()
				require "custom.configs.null-ls"
        end,
		},
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    dependencies = {"nvim-lua/plenary.nvim"},
    config = function ()
      return require "custom.configs.neorg"
    end,
    lazy = false,
  },
  {
		"stevearc/oil.nvim",
		lazy = false,
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = function ()
			return require "custom.configs.oil"
		end
	},
  },
}
local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {
  -- Override plugin definition options
  {
    "mfussenegger/nvim-dap",
    config = function (_, _)
      require("core.utils").load_mappings("dap")
    end
  },
  {
    "rcarriga/nvim-dap-ui",
    requires = "mfussenegger/nvim-dap",
    config = function ()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function ()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function ()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function ()
        dapui.close()
      end
    end
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    requires = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function (_, _)
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
      require("core.utils").load_mappings("dap_python")
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = {"python"},
    config = function ()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "neovim/nvim-lspconfig",
    requires = {
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    config = overrides.mason
  },
  {
    "nvim-treesitter/nvim-treesitter",
    config = overrides.treesitter,
  },
  {
    "nvim-tree/nvim-tree.lua",
    config = overrides.nvimtree,
  },
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    requires = {"nvim-lua/plenary.nvim"},
    config = function ()
      return require "custom.configs.neorg"
    end,
    lazy = false,
  },
  {
    "stevearc/oil.nvim",
    lazy = false,
    requires = { "nvim-tree/nvim-web-devicons" },
   config = function ()
      return require "custom.configs.oil"
    end
  },
}

return plugins
