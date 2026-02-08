local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

local M = require("keymappings")
local set_normal_mode_keymap = function(lhs, rhs_func, opts)
  vim.keymap.set("n", lhs, function() rhs_func() end, opts)
end
local scripts = require("scripts")

-- keymaps to be configured when attaching LSP server
function lsp_on_attach(client, bufnr)
  vim.lsp.completion.enable(true, client.id, bufnr, {
    autotrigger = true,
    convert = function(item)
      return { abbr = item.label:gsub("%b()", "") }
    end,
  })
end

vim.lsp.config.gopls = {
  filetypes = { "go" },
  capabilities = lsp_capabilities,
  on_attach = lsp_on_attach,
  cmd = { "gopls" },
}

local home = os.getenv('HOME')
local sumneko_root_path = home .. "/git/lua-language-server"
local sumneko_binary = home .. "/git/lua-language-server/bin/lua-language-server"

vim.lsp.config.luals = {
  filetypes = { "lua" },
  capabilities = lsp_capabilities,
  on_attach = lsp_on_attach,
  cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
  -- root_dir = require("lspconfig").util.root_pattern("init.lua", ".git"),
  -- single_file_support = true,
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      diagnostics = {
        globals = {
          "vim",
          "hs",
          -- Busted
          "describe",
          "it",
          "before_each",
          "after_each",
          "teardown",
          "pending",
          "clear",
        },
        disable = { 'lowercase-global' },
      },
    }
  }
}

vim.lsp.config.bashls = {
  cmd = { "bash-language-server", "start" },
  capabilities = lsp_capabilities,
  on_attach = lsp_on_attach,
  cmd_env = {
    GLOB_PATTERN = "*@(.sh|.inc|.bash|.command)"
  },
  filetypes = { "sh", "zsh" },
  single_file_support = true
}
vim.lsp.config.rust_analyzer = {
  capabilities = lsp_capabilities,
  on_attach = lsp_on_attach,
  settings = {
    ['rust-analyzer'] = {
      diagnostics = {
        enable = true,
      }
    }
  }
}

vim.lsp.config.clangd = {
  filetypes = { "c", "cpp", "objc", "objcpp" },
  capabilities = lsp_capabilities,
  on_attach = lsp_on_attach,
  cmd = { "clangd" },
}

local function set_python_path(command)
  local path = command.args
  local clients = vim.lsp.get_clients {
    bufnr = vim.api.nvim_get_current_buf(),
    name = 'pyright',
  }
  for _, client in ipairs(clients) do
    if client.settings then
      client.settings.python =
          vim.tbl_deep_extend('force', client.settings.python --[[@as table]], { pythonPath = path })
    else
      client.config.settings = vim.tbl_deep_extend('force', client.config.settings, { python = { pythonPath = path } })
    end
    client:notify('workspace/didChangeConfiguration', { settings = nil })
  end
end

vim.lsp.config.pyright = {
  cmd = { 'pyright-langserver', '--stdio' },
  filetypes = { 'python' },
  root_markers = {
    'pyrightconfig.json',
    'pyproject.toml',
    'setup.py',
    'setup.cfg',
    'requirements.txt',
    'Pipfile',
    '.git',
  },
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = 'openFilesOnly',
      },
    },
  },
  on_attach = function(client, bufnr)
    vim.api.nvim_buf_create_user_command(bufnr, 'LspPyrightOrganizeImports', function()
      local params = {
        command = 'pyright.organizeimports',
        arguments = { vim.uri_from_bufnr(bufnr) },
      }

      -- Using client.request() directly because "pyright.organizeimports" is private
      -- (not advertised via capabilities), which client:exec_cmd() refuses to call.
      -- https://github.com/neovim/neovim/blob/c333d64663d3b6e0dd9aa440e433d346af4a3d81/runtime/lua/vim/lsp/client.lua#L1024-L1030
      ---@diagnostic disable-next-line: param-type-mismatch
      client.request('workspace/executeCommand', params, nil, bufnr)
    end, {
      desc = 'Organize Imports',
    })
    vim.api.nvim_buf_create_user_command(bufnr, 'LspPyrightSetPythonPath', set_python_path, {
      desc = 'Reconfigure pyright with the provided python path',
      nargs = 1,
      complete = 'file',
    })
  end,
}

vim.lsp.config.vtsls = {
  cmd = { 'vtsls', '--stdio' },
  init_options = {
    hostInfo = 'neovim',
  },
  filetypes = {
    'javascript',
    'javascriptreact',
    'javascript.jsx',
    'typescript',
    'typescriptreact',
    'typescript.tsx',
  },
  root_dir = function(bufnr, on_dir)
    -- The project root is where the LSP can be started from
    -- As stated in the documentation above, this LSP supports monorepos and simple projects.
    -- We select then from the project root, which is identified by the presence of a package
    -- manager lock file.
    local root_markers = { 'package-lock.json', 'yarn.lock', 'pnpm-lock.yaml', 'bun.lockb', 'bun.lock' }
    -- Give the root markers equal priority by wrapping them in a table
    root_markers = vim.fn.has('nvim-0.11.3') == 1 and { root_markers, { '.git' } }
        or vim.list_extend(root_markers, { '.git' })

    -- exclude deno
    if vim.fs.root(bufnr, { 'deno.json', 'deno.jsonc', 'deno.lock' }) then
      return
    end

    -- We fallback to the current working directory if no project root is found
    local project_root = vim.fs.root(bufnr, root_markers) or vim.fn.getcwd()

    on_dir(project_root)
  end,
}

function restartLSP()
  for _, client in ipairs(vim.lsp.get_active_clients()) do
    vim.lsp.stop_client(client.id)
  end
  vim.cmd('edit') -- Reloads the current buffer to start the client
end

-- restartLSP()
set_normal_mode_keymap(M.keymaps["restart lsps"], restartLSP, {})

vim.lsp.enable({ "gopls", "luals", "bashls", "rust_analyzer", "clangd", "pyright", "vtsls" })

set_normal_mode_keymap(M.keymaps["lsp show details on item"], vim.lsp.buf.hover, {})
vim.api.nvim_buf_set_option(0, 'formatexpr', 'v:lua.vim.lsp.formatexpr()')
local ok, fzflua = scripts.verify_nvim_plugin("fzf-lua")
if ok and fzflua then
  vim.keymap.set(
    "n", "<Leader>a",
    fzflua.lsp_code_actions,
    {})
  set_normal_mode_keymap(M.keymaps["lsp go to definition"], fzflua.lsp_definitions, {})
  set_normal_mode_keymap(M.keymaps["lsp get references"], fzflua.lsp_references, {})
  set_normal_mode_keymap(M.keymaps["lsp get implementations"], fzflua.lsp_implementations, {})
  vim.keymap.set(
    "n", M.keymaps["lsp document symbols"],
    function()
      fzflua.lsp_document_symbols({})
    end,
    {})
  set_normal_mode_keymap(M.keymaps["lsp type definitions"], fzflua.lsp_typedefs, {})
end
set_normal_mode_keymap(M.keymaps["lsp rename variable"], vim.lsp.buf.rename, {})
set_normal_mode_keymap(M.keymaps["lsp diagnostic go to previous"], vim.diagnostic.goto_prev, {})
set_normal_mode_keymap(M.keymaps["lsp diagnostic go to next"], vim.diagnostic.goto_next, {})
local lsp_group = vim.api.nvim_create_augroup("lsp_group", { clear = true })

vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    local wd = vim.fn.getcwd()
    local tab_repo = "gp.nvim" -- Define the specific repository that uses tabs

    -- Check if the working directory matches the specific pattern
    local format_with_spaces = not string.find(wd, tab_repo)

    if format_with_spaces then
      vim.lsp.buf.format({
        formatting_options = { tabSize = 2, trimTrailingWhitespace = true, insertSpaces = true }
      })
    else
      vim.lsp.buf.format({
        formatting_options = { tabSize = 4, trimTrailingWhitespace = true, insertSpaces = false }
      })
    end
  end,
  pattern = { "*.go", "*.scala", "*.lua", "*.rs" },
  group = lsp_group
})

local filetype = vim.api.nvim_get_option_value('ft', {})
if filetype == 'c' then
  vim.opt.expandtab = true
  vim.opt.tabstop = 2
  vim.opt.shiftwidth = 2
end

vim.keymap.set("i", "<C-space>", vim.lsp.completion.get, { desc = "trigger autocompletion" })
