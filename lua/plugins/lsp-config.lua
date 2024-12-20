return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "pyright" },
			})
		end,
	},
	{
		--LINK: https://github.com/neovim/nvim-lspconfig/blob/master/test/minimal_init.lua (For potentially good keymaps)
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.pyright.setup({
				capabilities = capabilities,
			})

      local function toggle_lsp()
				for _, client in pairs(vim.lsp.get_active_clients()) do
					vim.lsp.stop_client(client.id)
				end
				print("LSP stopped. Reload the buffer to restart.")
			end

      -- Keymaps
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})

      --Keybindings for toggling lsp
      vim.keymap.set("n", "<leader>lt", toggle_lsp, {desc = "Toggle LSP"})

		end,
	},
}
