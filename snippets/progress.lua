local ls = require("luasnip") --{{{
local s = ls.s
local i = ls.i
local t = ls.t

local d = ls.dynamic_node
local c = ls.choice_node
local f = ls.function_node
local sn = ls.snippet_node

local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

local snippets, autosnippets = {}, {} --}}}

local group = vim.api.nvim_create_augroup("Lua Snippets", { clear = true })
local file_pattern = "*.p"

local function cs(trigger, nodes, opts) --{{{
	local snippet = s(trigger, nodes)
	local target_table = snippets

	local pattern = file_pattern
	local keymaps = {}

	if opts ~= nil then
		-- check for custom pattern
		if opts.pattern then
			pattern = opts.pattern
		end

		-- if opts is a string
		if type(opts) == "string" then
			if opts == "auto" then
				target_table = autosnippets
			else
				table.insert(keymaps, { "i", opts })
			end
		end

		-- if opts is a table
		if opts ~= nil and type(opts) == "table" then
			for _, keymap in ipairs(opts) do
				if type(keymap) == "string" then
					table.insert(keymaps, { "i", keymap })
				else
					table.insert(keymaps, keymap)
				end
			end
		end

		-- set autocmd for each keymap
		if opts ~= "auto" then
			for _, keymap in ipairs(keymaps) do
				vim.api.nvim_create_autocmd("BufEnter", {
					pattern = pattern,
					group = group,
					callback = function()
						vim.keymap.set(keymap[1], keymap[2], function()
							ls.snip_expand(snippet)
						end, { noremap = true, silent = true, buffer = true })
					end,
				})
			end
		end
	end

	table.insert(target_table, snippet) -- insert snippet into appropriate table
end --}}}

-- Start Refactoring --

local defbuf = s(
    "defbuf",
    fmt(
        [[
define buffer b_{1} for {2}.
        ]],
    {
        i(1, "tablename"),
        rep(1),
    }
    )
)
table.insert(snippets, defbuf)

local defvar = s(
    "defvar",
    fmt(
        [[
define variable {1} as {2} no-undo.
        ]],
    {
        i(1, "varname"),
        c(2, {t("integer"), t("decimal"), t("logical"), t("character")}),
    }
    )
)
table.insert(snippets, defvar)

local ff = s(
    "ff",
    fmt(
        [[
find first {1} {2} where
{4}.{3}
        ]],
    {
        i(1, "buffername"),
        i(2, "no-lock"),
        i(3, "fieldname"),
        rep(1),
    }
    )
)
table.insert(snippets, ff)

local fl = s(
    "fl",
    fmt(
        [[
find last {1} {2} where
{4}.{3} no-error
        ]],
    {
        i(1, "buffername"),
        i(2, "no-lock"),
        i(3, "fieldname"),
        rep(1),
    }
    )
)
table.insert(snippets, fl)

local proc = s(
    "proc",
    fmt(
[[
procedure {1}:
    define  input parameter {2} as {3}.
    define output parameter {4} as {5} initial {6} no-undo.
    define output parameter {7} as {8} initial {9} no-undo.

end procedure. /* {10} */
]],
    {
        i(1, "procname"),
        i(2, "s_inp_par1"),
        i(3, "character"),
        i(4, "s_out_par1"),
        i(5, "logical"),
        i(6, "no"),
        i(7, "s_out_par2"),
        i(8, "character"),
        i(9, "''"),
        rep(1),
    }
    )
)
table.insert(snippets, proc)
-- End Refactoring --

return snippets, autosnippets
