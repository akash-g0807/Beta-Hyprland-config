return {
	"honza/vim-snippets",

	-- ultisnips
	"SirVer/ultisnips",

	-- cmp nvim ultisnips

	"quangnguyen30192/cmp-nvim-ultisnips",

	config = function()
		-- base config for ultisnips

		-- set trigger key
		vim.g.UltiSnipsExpandTrigger = "<tab>"
		vim.g.UltiSnipsJumpForwardTrigger = "<tab>"
		vim.g.UltiSnipsJumpBackwardTrigger = "<s-tab>"

		-- load snippets directory
		vim.g.UltiSnipsSnippetDirectories = { "UltiSnips", "my_snippets" }
	end,
}
