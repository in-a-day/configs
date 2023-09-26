return {
	"stevearc/aerial.nvim",
	keys = "go",
	-- Optional dependencies
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("aerial").setup({})
		-- You probably also want to set a keymap to toggle aerial
		vim.keymap.set("n", "go", "<cmd>AerialToggle!<CR>")
	end,
}
