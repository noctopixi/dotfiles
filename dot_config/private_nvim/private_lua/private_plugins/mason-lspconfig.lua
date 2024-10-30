local opts = {
	ensure_installed = {
		"efm",
		"bashls",
		"ts_ls",
		"pyright",
		"html",
		"cssls",
		"lua_ls",
		"emmet_language_server",
		"jsonls",
		"clangd",
	},

	automatic_installation = true,
}

return {
	"williamboman/mason-lspconfig.nvim",
	opts = opts,
	event = "BufReadPre",
	dependencies = "williamboman/mason.nvim",
}
