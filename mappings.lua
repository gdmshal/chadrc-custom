local M = {}

M.dap = {
	plugin = true,
	n = {
		["<leader>db"] = {"<cmd> DapToggleBreakpoint <CR>"}
	}
}

M.dap_python = {
	n = {
		["<leader>dpr"] = {
			function ()
				require('dap-python').test_method()
			end
		}
	}
}

M.general = {
	n = {
		["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left" },
		["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "window down" },
		["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "window up" },
		["<C-l>"] = { "<cmd> TmuxNavigateRight", "window right" },
	}
}

return M
