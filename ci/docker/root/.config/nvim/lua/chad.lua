local export_icons = function(export_name)
  local default_sym = vim.g.WebDevIconsUnicodeDecorateFileNodesDefaultSymbol
  local folder_open = vim.g.DevIconsDefaultFolderOpenSymbol
  local folder_close = vim.g.WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol

  local extensions = vim.g.WebDevIconsUnicodeDecorateFileNodesExtensionSymbols
  local exact = vim.g.WebDevIconsUnicodeDecorateFileNodesExactSymbols
  local glob = vim.g.WebDevIconsUnicodeDecorateFileNodesPatternSymbols

  local data = {
    extensions = extensions,
    exact = exact,
    glob = glob,
    default = default_sym,
    folder = {
      open = folder_open,
      closed = folder_close
    }
  }
  local json = vim.fn.json_encode(data)
  vim.fn.writefile({json}, export_name)
end

local export_colours = function(export_name)
  local extensions = vim.g.NERDTreeExtensionHighlightColor
  local exact = vim.g.NERDTreeExactMatchHighlightColor
  local glob = vim.g.NERDTreePatternMatchHighlightColor

  local data = {
    extensions = extensions,
    exact = exact,
    glob = glob
  }
  local json = vim.fn.json_encode(data)
  vim.fn.writefile({json}, export_name)
end

local load_rtp = function(src)
  for _, s in ipairs(src) do
    vim.o.runtimepath = vim.o.runtimepath .. "," .. "/root/" .. s
  end
end

local load_viml = function(src)
  for _, s in ipairs(src) do
    vim.api.nvim_command("source /root/" .. s)
  end
end

local v1 = {
  "vim-devicons/plugin/webdevicons.vim"
}
local v2 = {
  "vim-emoji-icon-theme/plugin/vim-emoji-icon-theme.vim"
}
local v3 = {
  "vim-nerdtree-syntax-highlight/after/syntax/nerdtree.vim"
}

load_viml(v1)
export_icons("unicode_icons.json")

load_viml(v2)
export_icons("emoji_icons.json")

load_viml(v3)
export_colours("colours.json")

os.exit(0)
