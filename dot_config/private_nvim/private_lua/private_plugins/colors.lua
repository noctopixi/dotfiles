-- NIGHTFOX / DUSKFOX / CARBONFOX
-- return {
-- 	"EdenEast/nightfox.nvim",
-- 	lazy = false,
-- 	priority = 999,
-- 	config = function()
-- 		vim.cmd("colorscheme duskfox")
-- 		-- vim.cmd('colorscheme carbonfox')
-- 	end,
-- }

-- CATPPUCCIN
-- local config = function()
--   require("catppuccin").setup({
--   integrations = {
--     ts_rainbow = true,
--     noice = true,
--   },
--   })
-- 		vim.cmd.colorscheme("catppuccin-macchiato")
-- end
-- return {
-- 	"catppuccin/nvim",
-- 	name = "catppuccin",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = config,
-- }

-- EVERFOREST

local config = function()
	require("everforest").setup({
		background = "hard",
		integrations = {
			ts_rainbow = true,
			noice = true,
		},
	})
	vim.cmd.colorscheme("everforest")
end
return {
	"neanias/everforest-nvim",
	name = "everforest",
	lazy = false,
	priority = 1000,
	config = config,
}
