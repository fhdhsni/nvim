local present, treesitter = pcall(require, "nvim-treesitter.configs")

if not present then
  return
end

require("base46").load_highlight "treesitter"

local options = {
  ensure_installed = {
    "lua",
    "html",
    "css",
    "tsx",
    "typescript",
    "javascript",
    "json",
    "elixir",
    "rust",
  },

  highlight = {
    enable = true,
    use_languagetree = true,
  },

  indent = {
    enable = true,
  },

  autotag = {
    enable = true,
  },

  matchup = {
    enable = true, -- mandatory, false will disable the whole extension
    disable = { "c", "ruby" }, -- optional, list of language that will be disabled
    -- [options]
  },
}

-- check for any override
options = require("core.utils").load_override(options, "nvim-treesitter/nvim-treesitter")

treesitter.setup(options)
