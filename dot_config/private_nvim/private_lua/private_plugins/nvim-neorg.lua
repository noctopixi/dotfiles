return {
	"nvim-neorg/neorg",
	dependencies = { "luarocks.nvim" },
	opts = {
		load = {
			["core.defaults"] = {},
			["core.concealer"] = {},
			["core.export"] = {},
			["core.keybinds"] = {
        config = {
          hook = function(keybinds)
          keybinds.map("all", "n", "<LocalLeader>ll", "<cmd>Neorg keybind all core.looking-glass.magnify-code-block<CR>")
          end,
        }
      },
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
