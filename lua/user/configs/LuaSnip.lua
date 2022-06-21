local friendly_snippets = vim.fn.stdpath("data") .. "/site/pack/packer/start/friendly-snippets"

require("luasnip.loaders.from_lua").lazy_load()
require("luasnip.loaders.from_vscode").lazy_load { paths = friendly_snippets }
require("luasnip.loaders.from_snipmate").lazy_load()

