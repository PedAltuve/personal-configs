return {
	-- Add Mason
	{
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
		build = ":MasonUpdate",
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = {"lua_ls", "tsserver", "pyright" },
				automatic_installation = true,
			})
		end,
	},
	-- Connect Mason to LSPConfig
	{
		"nvimdev/lspsaga.nvim",
		event = "LspAttach",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("lspsaga").setup {}
		end
	},
	-- LSP Config
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			local mason_lspconfig = require("mason-lspconfig")

			local on_attach = function(_, bufnr)
				local map = function(mode, lhs, rhs, desc)
					vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
				end
				map("n", "gd", "<cmd>Lspsaga goto_definition<CR>", "Goto definition")
				map("n", "K", "<cmd>Lspsaga hover_doc<CR>", "Hover")
				map("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", "Code action")
				map("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", "Rename")
			end

			mason_lspconfig.setup_handlers({
				function(server_name)
					lspconfig[server_name].setup({
						on_attach = on_attach,
					})
				end
			})
		end
	}
}
