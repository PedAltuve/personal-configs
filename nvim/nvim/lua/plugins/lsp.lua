return {
  -- Mason
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = function()
      require("mason").setup()
    end,
  },
  -- Mason LSPConfig
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "ts_ls",
          "pyright",
          "intelephense",
          "html-lsp"
		}
	  })
    end,
  },
  -- LSP Config
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- on_attach function for key mappings and LSP-specific settings
      local on_attach = function(_, bufnr)
        local map = function(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
        end
        map("n", "gd", "<cmd>Lspsaga goto_definition<CR>", "Goto definition")
		map("n", "pd", "<cmd>Lspsaga peek_definition<CR>", "Peek definition")
		map("n", "<leader>fd", "<cmd>Lspsaga finder<CR>", "LSPSaga finder")
		map("n", "<leader>dn", "<cmd>Lspsaga diagnostic_jump_next<CR>", "Next code diagnostic")
		map("n", "<leader>dp", "<cmd>Lspsaga diagnostic_jump_prev<CR>", "Previous code diagnostic")
        map("n", "K", "<cmd>Lspsaga hover_doc<CR>", "Hover")
        map("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", "Code action")
        map("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", "Rename")

        -- Enable inlay hints (Neovim 0.11+)
		if vim.lsp.inlay_hint and vim.lsp.inlay_hint.enable then
			vim.lsp.inlay_hint.enable(true, {bufnr})
		end
	  end

      -- Directly setup each server
      local servers = { "lua_ls", "ts_ls", "pyright", "intelephense", "html" }
      for _, server in ipairs(servers) do
		if server == "pyright" then
			lspconfig[server].setup({
				on_attach = on_attach,
				capabilities = capabilities,
				settings = {
					python = {
						pythonPath = vim.fn.exepath("python")			
					}
				}
			})
		else
			lspconfig[server].setup({
			  on_attach = on_attach,
			  capabilities = capabilities,
			})
		end
      end
    end,
  },
  -- Lspsaga for enhanced LSP UI
  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("lspsaga").setup({})
    end,
  },
}
