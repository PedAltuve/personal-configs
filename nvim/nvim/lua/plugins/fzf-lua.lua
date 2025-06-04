return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {},
	keys = {
		{"<leader>ff", function() require("fzf-lua").files() end, desc = "Fzf files" },
		{"<leader>fw", function() require("fzf-lua").live_grep() end, desc = "Fzf live grep"},
		{ "<leader>fg", function() require("fzf-lua").git_files() end, desc = "Fzf git files" },
    { "<leader>fb", function() require("fzf-lua").buffers({ sort_lastused = true }) end, desc = "Fzf buffers" },

	}
}
