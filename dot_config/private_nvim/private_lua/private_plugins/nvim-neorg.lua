return {
	"nvim-neorg/neorg",
	dependencies = { "luarocks.nvim" },
	opts = {
		load = {
			["core.defaults"] = {},
			["core.concealer"] = {},
			["core.export"] = {},
			["core.dirman"] = {
				config = {
					workspaces = {
						notes = "~/Notes",
						personal = "~/Personal",
					},
					default_workspace = "notes",
				},
			},
			["core.journal"] = {
				config = {
					workspace = "personal",
					-- journal_folder = "journal",
				},
			},
		},
	},
	lazy = false,
	version = "*", -- Pin Neorg to the latest stable release
	config = true,
}
