-- Language servers
local servers = {
  "lua_ls",
  "jdtls",
  "clangd",
  "rust_analyzer",
  "gopls",
}

local function setup()
  -- Diagnostic configuration
	local signs = {
		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
		{ name = "DiagnosticSignInfo", text = "" },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

	local config = {
		virtual_text = false, -- disable virtual text
		signs = {
			active = signs, -- show signs
		},
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			focusable = true,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	}

	vim.diagnostic.config(config)

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
	})

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded",
	})

  -- Language server specific setup
  local handlers = {}
  for _, server in pairs(servers) do
	  server = vim.split(server, "@")[1]
		local handler = require("lsp.handlers." .. server)
    handlers[server] = handler
  end

  -- LSP config setup
  require("mason-lspconfig").setup {
    ensure_installed = servers,
    automatic_installation = true,
    handlers = handlers,
  }

end

return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "neovim/nvim-lspconfig",
    "RRethy/vim-illuminate",

    "mfussenegger/nvim-jdtls", -- java language server
  },
  config = setup,
}
