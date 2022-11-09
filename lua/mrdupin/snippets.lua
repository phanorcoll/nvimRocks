-- INFO: Doc https://github.com/L3MON4D3/LuaSnip/blob/master/DOC.md
-- TODO: cleanup this file
-- TODO: improve snippets for Go, add comments to packages, func, types, following https://go.dev/blog/godoc
--
local ls = require "luasnip"
-- some shorthands...
local snip = ls.snippet
local node = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node
local choice = ls.choice_node
local dynamicn = ls.dynamic_node

ls.config.set_config {
  history = true,
  -- treesitter-hl has 100, use something higher (default is 200).
  ext_base_prio = 200,
  -- minimal increase in priority.
  ext_prio_increase = 1,
  enable_autosnippets = false,
  store_selection_keys = "<c-s>",
}

local date = function()
  return { os.date "%Y-%m-%d" }
end

local filename = function()
  return { vim.fn.expand "%:p" }
end

-- Make sure to not pass an invalid command, as io.popen() may write over nvim-text.
local function bash(_, _, command)
  local file = io.popen(command, "r")
  local res = {}
  for line in file:lines() do
    table.insert(res, line)
  end
  return res
end

ls.add_snippets(nil, {
  all = {
    snip({
      trig = "date",
      namr = "Date",
      dscr = "Date in the form of YYYY-MM-DD",
    }, {
      func(date, {}),
    }),
    snip({
      trig = "pwd",
      namr = "PWD",
      dscr = "Path to current working directory",
    }, {
      func(bash, {}, { user_args = { "pwd" } }),
    }),
    snip({
      trig = "filename",
      namr = "Filename",
      dscr = "Absolute path to file",
    }, {
      func(filename, {}),
    }),
    snip({
      trig = "signature",
      namr = "Signature",
      dscr = "Name and Surname",
    }, {
      text "Phanor Coll",
      insert(0),
    }),
  },
  lua = {
    snip("req", {
      text "require('",
      insert(1, "Module-name"),
      text "')",
      insert(0),
    }),
    snip("func", {
      text "function(",
      insert(1, "Arguments"),
      text { ")", "\t" },
      insert(2),
      text { "", "end", "" },
      insert(0),
    }),
    snip("forp", {
      text "for ",
      insert(1, "k"),
      text ", ",
      insert(2, "v"),
      text " in pairs(",
      insert(3, "table"),
      text { ") do", "\t" },
      insert(4),
      text { "", "end", "" },
      insert(0),
    }),
    snip("fori", {
      text "for ",
      insert(1, "k"),
      text ", ",
      insert(2, "v"),
      text " in ipairs(",
      insert(3, "table"),
      text { ") do", "\t" },
      insert(4),
      text { "", "end", "" },
      insert(0),
    }),
    snip("if", {
      text "if ",
      insert(1),
      text { " then", "\t" },
      insert(2),
      text { "", "end", "" },
      insert(0),
    }),
    snip("M", {
      text { "local M = {}", "", "" },
      insert(0),
      text { "", "", "return M" },
    }),
  },
  go = {
    snip("test", {
      text "func ",
      insert(1, "Name"),
      text "(t *testing.T)",
      text { " {", "" },
      text "\t",
      insert(0),
      text { "", "}" },
    }),
    snip("typei", {
      text "type ",
      insert(1, "Name"),
      text { " interface {", "" },
      text "\t",
      insert(0),
      text { "", "}" },
    }),
    snip("types", {
      text "type ",
      insert(1, "Name"),
      text { " struct {", "" },
      text "\t",
      insert(0),
      text { "", "}" },
    }),
  },
})
