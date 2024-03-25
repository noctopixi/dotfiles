local config = function()
	require("nvim-treesitter.configs").setup({
		indent = {
			enable = true,
		},
		autotag = {
			enable = true,
		},
		ensure_installed = {
			"python",
			"lua",
			"json",
			"html",
			"css",
			"javascript",
			"typescript",
			"c",
			"yaml",
			"markdown",
			"markdown_inline",
			"bash",
			"vim",
			"regex",
			"dockerfile",
			"git_config",
			"gitignore",
		},
		auto_install = true,
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = true,
		},
	})
end

return {
	"nvim-treesitter/nvim-treesitter",
  lazy = false,
  config = config
}

