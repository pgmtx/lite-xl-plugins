-- mod-version:3 --lite-xl 2.1
local syntax = require "core.syntax"

syntax.add {
  name = "PKGBUILD",
  files = "/*PKGBUILD$",
  comment = "#",
  patterns = {
    -- Don't colorize number of arguments expression as comment
    { pattern = "$#",                          type = "keyword2" },
    { pattern = "#.*\n",                       type = "comment"  },
    -- Strings
    { pattern = { '"', '"', '\\' },            type = "string"   },
    { pattern = { "'", "'", '\\' },            type = "string"   },
    { pattern = { '`', '`', '\\' },            type = "string"   },
    -- Ignore numbers that start with dots or slashes
    { pattern = "%f[%w_%.%/]%d[%d%.]*%f[^%w_%.]", type = "number"   },
    -- Custom keyword matches
    { pattern = "source%f[=]",                 type = "literal"  },
    { pattern = "[ \t]source ",                type = "keyword"  },
    { pattern = "install%f[=]",                type = "literal"  },
    { pattern = "[ \t]tar ",                   type = "keyword"  },
    { pattern = "[ \t]install ",               type = "keyword"  },
    { pattern = "[ \t]arch%-meson ",           type = "keyword"  },
    { pattern = "[ \t]patch ",                 type = "keyword"  },
    { pattern = "[ \t]git ",                   type = "keyword"  },
    { pattern = "[ \t]svn ",                   type = "keyword"  },
    { pattern = "[ \t]fossil ",                type = "keyword"  },
    { pattern = "[ \t]meson ",                 type = "keyword"  },
    { pattern = "[ \t]ninja ",                 type = "keyword"  },
    { pattern = "[ \t]cmake ",                 type = "keyword"  },
    { pattern = "[ \t]waf ",                   type = "keyword"  },
    { pattern = "[ \t]%./configure[%s%c]+",    type = "keyword"  },
    -- Operators
    { pattern = "[!<>|&%[%]:=*]",              type = "operator" },
    -- Match parameters
    { pattern = "%f[%S][%+%-][%w%-_:]+",       type = "function" },
    { pattern = "%f[%S][%+%-][%w%-_]+%f[=]",   type = "function" },
    -- Prevent parameters with assignments from been matched as variables
    {
      pattern = "%s%-%a[%w_%-]*%s+()%d[%d%.]+",
      type = { "function", "number" }
    },
    {
      pattern = "%s%-%a[%w_%-]*%s+()%a[%a%-_:=]+",
      type = { "function", "symbol" }
    },
    -- Match variable assignments
    { pattern = "[_%a][%w_]+%f[%+=]",          type = "keyword2" },
    -- Match variable expansions
    { pattern = "${.-}",                       type = "keyword2" },
    { pattern = "$[%d$%a_@*][%w_]*",           type = "keyword2" },
    -- Functions
    { pattern = "[%a_%-][%w_%-]*[%s]*%f[(]",   type = "function" },
    -- Everything else
    { pattern = "[%a_][%w_]*",                 type = "symbol"   },
  },
  symbols = {
    -- Bash keywords
    ["true"]                 = "literal",
    ["false"]                = "literal",
    ["case"]                 = "keyword",
    ["in"]                   = "keyword",
    ["esac"]                 = "keyword",
    ["if"]                   = "keyword",
    ["then"]                 = "keyword",
    ["elif"]                 = "keyword",
    ["else"]                 = "keyword",
    ["fi"]                   = "keyword",
    ["until"]                = "keyword",
    ["while"]                = "keyword",
    ["do"]                   = "keyword",
    ["done"]                 = "keyword",
    ["for"]                  = "keyword",
    ["break"]                = "keyword",
    ["continue"]             = "keyword",
    ["shift"]                = "keyword",
    ["function"]             = "keyword",
    ["local"]                = "keyword",
    ["echo"]                 = "keyword",
    ["return"]               = "keyword",
    ["exit"]                 = "keyword",
    ["alias"]                = "keyword",
    ["test"]                 = "keyword",
    ["select"]               = "keyword",
    ["type"]                 = "keyword",
    ["declare"]              = "keyword",
    ["set"]                  = "keyword",
    ["unalias"]              = "keyword",
    ["unset"]                = "keyword",
    ["enable"]               = "keyword",
    ["eval"]                 = "keyword",
    ["exec"]                 = "keyword",
    ["export"]               = "keyword",
    ["getopts"]              = "keyword",
    ["hash"]                 = "keyword",
    ["history"]              = "keyword",
    ["help"]                 = "keyword",
    ["jobs"]                 = "keyword",
    ["kill"]                 = "keyword",
    ["let"]                  = "keyword",
    ["mapfile"]              = "keyword",
    ["readarray"]            = "keyword",
    -- Commands
    ["printf"]               = "keyword",
    ["read"]                 = "keyword",
    ["pwd"]                  = "keyword",
    ["time"]                 = "keyword",
    ["cd"]                   = "keyword",
    ["cp"]                   = "keyword",
    ["mv"]                   = "keyword",
    ["mkdir"]                = "keyword",
    ["rm"]                   = "keyword",
    ["rmdir"]                = "keyword",
    ["chown"]                = "keyword",
    ["chmod"]                = "keyword",
    ["touch"]                = "keyword",
    ["ln"]                   = "keyword",
    ["cat"]                  = "keyword",
    ["sed"]                  = "keyword",
    ["awk"]                  = "keyword",
    ["find"]                 = "keyword",
    ["grep"]                 = "keyword",
    ["head"]                 = "keyword",
    ["less"]                 = "keyword",
    ["gcc"]                  = "keyword",
    ["gpp"]                  = "keyword",
    ["make"]                 = "keyword",
    ["qmake"]                = "keyword",
    -- PKGBUILD keywords
    ["pkgbase"]              = "literal",
    ["pkgname"]              = "literal",
    ["pkgver"]               = "literal",
    ["pkgrel"]               = "literal",
    ["epoch"]                = "literal",
    ["pkgdesc"]              = "literal",
    ["arch"]                 = "literal",
    ["url"]                  = "literal",
    ["license"]              = "literal",
    ["groups"]               = "literal",
    ["depends"]              = "literal",
    ["depends_arm"]          = "literal",
    ["depends_armv6h"]       = "literal",
    ["depends_armv7h"]       = "literal",
    ["depends_aarch64"]      = "literal",
    ["depends_i686"]         = "literal",
    ["depends_x86_64"]       = "literal",
    ["makedepends"]          = "literal",
    ["makedepends_arm"]      = "literal",
    ["makedepends_armv6h"]   = "literal",
    ["makedepends_armv7h"]   = "literal",
    ["makedepends_aarch64"]  = "literal",
    ["makedepends_i686"]     = "literal",
    ["makedepends_x86_64"]   = "literal",
    ["checkdepends"]         = "literal",
    ["checkdepends_arm"]     = "literal",
    ["checkdepends_armv6h"]  = "literal",
    ["checkdepends_armv7h"]  = "literal",
    ["checkdepends_aarch64"] = "literal",
    ["checkdepends_i686"]    = "literal",
    ["checkdepends_x86_64"]  = "literal",
    ["optdepends"]           = "literal",
    ["optdepends_arm"]       = "literal",
    ["optdepends_armv6h"]    = "literal",
    ["optdepends_armv7h"]    = "literal",
    ["optdepends_aarch64"]   = "literal",
    ["optdepends_i686"]      = "literal",
    ["optdepends_x86_64"]    = "literal",
    ["provides"]             = "literal",
    ["provides_arm"]         = "literal",
    ["provides_armv6h"]      = "literal",
    ["provides_armv7h"]      = "literal",
    ["provides_aarch64"]     = "literal",
    ["provides_i686"]        = "literal",
    ["provides_x86_64"]      = "literal",
    ["conflicts"]            = "literal",
    ["conflicts_arm"]        = "literal",
    ["conflicts_armv6h"]     = "literal",
    ["conflicts_armv7h"]     = "literal",
    ["conflicts_aarch64"]    = "literal",
    ["conflicts_i686"]       = "literal",
    ["conflicts_x86_64"]     = "literal",
    ["replaces"]             = "literal",
    ["replaces_arm"]         = "literal",
    ["replaces_armv6h"]      = "literal",
    ["replaces_armv7h"]      = "literal",
    ["replaces_aarch64"]     = "literal",
    ["replaces_i686"]        = "literal",
    ["replaces_x86_64"]      = "literal",
    ["backup"]               = "literal",
    ["options"]              = "literal",
    ["changelog"]            = "literal",
    ["source_arm"]           = "literal",
    ["source_armv6h"]        = "literal",
    ["source_armv7h"]        = "literal",
    ["source_aarch64"]       = "literal",
    ["source_i686"]          = "literal",
    ["source_x86_64"]        = "literal",
    ["noextract"]            = "literal",
    ["validpgpkeys"]         = "literal",
    ["md5sums"]              = "literal",
    ["md5sums_arm"]          = "literal",
    ["md5sums_armv6h"]       = "literal",
    ["md5sums_armv7h"]       = "literal",
    ["md5sums_aarch64"]      = "literal",
    ["md5sums_i686"]         = "literal",
    ["md5sums_x86_64"]       = "literal",
    ["sha1sums"]             = "literal",
    ["sha1sums_arm"]         = "literal",
    ["sha1sums_armv6h"]      = "literal",
    ["sha1sums_armv7h"]      = "literal",
    ["sha1sums_aarch64"]     = "literal",
    ["sha1sums_i686"]        = "literal",
    ["sha1sums_x86_64"]      = "literal",
    ["sha256sums"]           = "literal",
    ["sha256sums_arm"]       = "literal",
    ["sha256sums_armv6h"]    = "literal",
    ["sha256sums_armv7h"]    = "literal",
    ["sha256sums_aarch64"]   = "literal",
    ["sha256sums_i686"]      = "literal",
    ["sha256sums_x86_64"]    = "literal",
    ["sha224sums"]           = "literal",
    ["sha224sums_arm"]       = "literal",
    ["sha224sums_armv6h"]    = "literal",
    ["sha224sums_armv7h"]    = "literal",
    ["sha224sums_aarch64"]   = "literal",
    ["sha224sums_i686"]      = "literal",
    ["sha224sums_x86_64"]    = "literal",
    ["sha384sums"]           = "literal",
    ["sha384sums_arm"]       = "literal",
    ["sha384sums_armv6h"]    = "literal",
    ["sha384sums_armv7h"]    = "literal",
    ["sha384sums_aarch64"]   = "literal",
    ["sha384sums_i686"]      = "literal",
    ["sha384sums_x86_64"]    = "literal",
    ["sha512sums"]           = "literal",
    ["sha512sums_arm"]       = "literal",
    ["sha512sums_armv6h"]    = "literal",
    ["sha512sums_armv7h"]    = "literal",
    ["sha512sums_aarch64"]   = "literal",
    ["sha512sums_i686"]      = "literal",
    ["sha512sums_x86_64"]    = "literal",
    ["b2sums"]               = "literal",
    ["b2sums_arm"]           = "literal",
    ["b2sums_armv6h"]        = "literal",
    ["b2sums_armv7h"]        = "literal",
    ["b2sums_aarch64"]       = "literal",
    ["b2sums_i686"]          = "literal",
    ["b2sums_x86_64"]        = "literal",
  },
}
