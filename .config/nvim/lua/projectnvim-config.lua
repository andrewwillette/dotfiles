vim.g.nvim_tree_respect_buf_cwd = 1

require("project").setup({
  patterns = {
    ".git",
    "_darcs",
    ".hg",
    ".bzr",
    ".svn",
    "Makefile",
    "package.json",
    "go.mod",
    "pubspec.yaml",
    "Cargo.toml",
  },
  detection_methods = { "pattern", "lsp" }, -- tried in this order
  -- use_local_cwd = true, -- uncomment if you prefer per-window cwd via :lcd
})
