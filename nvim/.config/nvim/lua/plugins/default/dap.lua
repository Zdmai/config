return {
	"mfussenegger/nvim-dap",
	dependencies = {
    "mfussenegger/nvim-dap-python",
		"rcarriga/nvim-dap-ui",
    "tpope/vim-fugitive",
	},
	config = function()
    require("dapui").setup()
		require("dap-python").setup("python")

		local dap, dapui = require("dap"), require("dapui")

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		vim.keymap.set("n", "<Leader>dt", ":DapToggleBreakpoint<CR>") -- set breakpoint 
		vim.keymap.set("n", "<Leader>dc", ":DapContinue<CR>")         -- continue in debug mode
		vim.keymap.set("n", "<Leader>dx", ":DapTerminate<CR>")        -- terminate
		vim.keymap.set("n", "<Leader>do", ":DapStepOver<CR>")
	end,
}

