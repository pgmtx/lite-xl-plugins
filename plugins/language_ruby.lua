-- mod-version:3
local syntax = require "core.syntax"

syntax.add {
  name = "Ruby",
  files = { "%.rb$", PATHSEP .. "%.gemspec$", PATHSEP .. "Gemfile$", PATHSEP .. "Gemfile%.lock$" },
  headers = "^#!.*[ /]ruby",
  comment = "#",
  patterns = {
    { pattern = { '"', '"', '\\' },     type = "string"   },
    { pattern = { "'", "'", '\\' },     type = "string"   },
    { pattern = "-?0x%x+",              type = "number"   },
    { pattern = "%#.-\n",               type = "comment"  },
    { pattern = "-?%d+[%d%.eE]*f?",     type = "number"   },
    { pattern = "-?%.?%d+f?",           type = "number"   },
    { pattern = "[%+%-=/%*%^%%<>!~|&]", type = "operator" },
    { pattern = "[%a_][%w_]*%f[(]",     type = "function" },
    { pattern = "@?@[%a_][%w_]*",       type = "keyword2" },
    { pattern = "::[%w_]*",             type = "symbol" },
    { pattern = ":[%w_]*",              type = "keyword2" },
    { pattern = "[%a_][%w_]*:[^:]",     type = "keyword2" },
    { pattern = "[%a_][%w_]*",          type = "symbol"   },
  },
  symbols = {
    ["nil"]  = "literal",
    ["true"]  = "literal",
    ["false"]  = "literal",
    ["private"]  = "keyword",
    ["extend"]  = "keyword",
    ["include"]  = "keyword",
    ["require"]  = "keyword",
    ["require_dependency"]  = "keyword",
    ["__ENCODING__"] = "keyword",
    ["__LINE__"] = "keyword",
    ["__FILE__"] = "keyword",
    ["BEGIN"] = "keyword",
    ["END"] = "keyword",
    ["alias"] = "keyword",
    ["and"] = "keyword",
    ["begin"] = "keyword",
    ["break"] = "keyword",
    ["case"] = "keyword",
    ["class"] = "keyword",
    ["def"] = "keyword",
    ["defined?"] = "keyword",
    ["do"] = "keyword",
    ["else"] = "keyword",
    ["elsif"] = "keyword",
    ["end"] = "keyword",
    ["ensure"] = "keyword",
    ["for"] = "keyword",
    ["if"] = "keyword",
    ["in"] = "keyword",
    ["module"] = "keyword",
    ["next"] = "keyword",
    ["not"] = "keyword",
    ["or"] = "keyword",
    ["redo"] = "keyword",
    ["rescue"] = "keyword",
    ["retry"] = "keyword",
    ["return"] = "keyword",
    ["self"] = "keyword",
    ["super"] = "keyword",
    ["then"] = "keyword",
    ["undef"] = "keyword",
    ["unless"] = "keyword",
    ["until"] = "keyword",
    ["when"] = "keyword",
    ["while"] = "keyword",
    ["yield"] = "keyword"
  },
}

