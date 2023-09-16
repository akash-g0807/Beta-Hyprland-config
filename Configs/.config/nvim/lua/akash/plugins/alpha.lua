local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end

-- math.randomseed(os.time())

local function pick_color()
	local colors = { "String", "Identifier", "Keyword", "Number" }
	return colors[3]
end

local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val =
	-- {
	-- [[                                                    ]],
	-- [[ ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ]],
	-- [[ ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ]],
	-- [[ ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ]],
	-- [[ ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
	-- [[ ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
	-- [[ ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
	-- [[                                                    ]],
	-- }
	--
	{
		[[=================     ===============     ===============   ========  ========]],
		[[\\ . . . . . . .\\   //. . . . . . .\\   //. . . . . . .\\  \\. . .\\// . . //]],
		[[||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\/ . . .||]],
		[[|| . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . ||]],
		[[||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .||]],
		[[|| . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\ . . . . ||]],
		[[||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\_ . .|. .||]],
		[[|| . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\ `-_/| . ||]],
		[[||_-' ||  .|/    || ||    \|.  || `-_|| ||_-' ||  .|/    || ||   | \  / |-_.||]],
		[[||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \  / |  `||]],
		[[||    `'         || ||         `'    || ||    `'         || ||   | \  / |   ||]],
		[[||            .===' `===.         .==='.`===.         .===' /==. |  \/  |   ||]],
		[[||         .=='   \_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \/  |   ||]],
		[[||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \/  |   ||]],
		[[||   .=='    _-'          '-__\._-'         '-_./__-'         `' |. /|  |   ||]],
		[[||.=='    _-'                                                     `' |  /==.||]],
		[[=='    _-'                        N E O V I M                         \/   `==]],
		[[\   _-'                                                                `-_   /]],
		[[ `''                                                                      ``' ]],
	}

-- {
--   '          ▀████▀▄▄              ▄█ ',
--   '            █▀    ▀▀▄▄▄▄▄    ▄▄▀▀█ ',
--   '    ▄        █          ▀▀▀▀▄  ▄▀  ',
--   '   ▄▀ ▀▄      ▀▄              ▀▄▀  ',
--   '  ▄▀    █     █▀   ▄█▀▄      ▄█    ',
--   '  ▀▄     ▀▄  █     ▀██▀     ██▄█   ',
--   '   ▀▄    ▄▀ █   ▄██▄   ▄  ▄  ▀▀ █  ',
--   '    █  ▄▀  █    ▀██▀    ▀▀ ▀▀  ▄▀  ',
--   '   █   █  █      ▄▄           ▄▀   ',
-- },

dashboard.section.buttons.val = {
	dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
	-- dashboard.button("p", "  Find project", ":Telescope projects <CR>"),
	-- dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
	-- dashboard.button("d", "✗  Delete session", "<cmd>SessionsManager delete_session<CR>"),
	dashboard.button("s", "  Sessions", "<cmd>SessionManager load_session<CR>"),
	dashboard.button("r", "  Recent", ":Telescope oldfiles <CR>"),
	dashboard.button("f", "󰈞  Find File", ":Telescope find_files <CR>"),
	dashboard.button("b", "  Search Text", ":Telescope live_grep <CR>"),
	dashboard.button("c", "  Config", ":e $MYVIMRC <CR>"),
	dashboard.button("i", "  Info", "<cmd>e ~/.config/nvim/Cheat-Sheet.md<cr>"),
	dashboard.button("u", "  Update Plugins", ":PackerSync<CR>"),
	dashboard.button("q", "  Quit", ":qa<CR>"),
}

local function footer()
	local plugins_count = vim.fn.len(vim.fn.globpath("~/.local/share/nvim/site/pack/packer/start", "*", 0, 1))
	local status = "  󰂖 Loaded " .. plugins_count .. " plugins"
	local datetime = os.date(" %d-%m-%Y   %H:%M:%S")
	local version = vim.version()
	local nvim_version_info = "   v" .. version.major .. "." .. version.minor .. "." .. version.patch

	return datetime .. status .. nvim_version_info
end

dashboard.section.header.opts.hl = pick_color()
dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
-- dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
-- vim.cmd([[autocmd User AlphaReady echo 'ready']])

alpha.setup(dashboard.opts)
