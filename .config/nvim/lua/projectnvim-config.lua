vim.g.nvim_tree_respect_buf_cwd = 1

require("project_nvim").setup({
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
    "Cargo.toml"
  },
  detection_methods = { "pattern", "lsp" },
})
