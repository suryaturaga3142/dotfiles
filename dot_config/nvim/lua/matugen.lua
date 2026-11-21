 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#1a2023',
    base01 = '#222b2f',
    base02 = '#2a363c',
    base03 = '#606b70',
    base04 = '#afb4b6',
    base05 = '#f2f2f3',
    base06 = '#f2f2f3',
    base07 = '#f2f2f3',
    base08 = '#fd4663',
    base09 = '#ab97d3',
    base0A = '#949fd6',
    base0B = '#90c2da',
    base0C = '#b7a5d9',
    base0D = '#a1cade',
    base0E = '#a3acdc',
    base0F = '#c8cdea',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  -- telescope.nvim
  hi('TelescopeNormal',         { fg = '#f2f2f3',          bg = '#1a2023' })
  hi('TelescopeBorder',         { fg = '#606b70',             bg = '#1a2023' })
  hi('TelescopePromptNormal',   { fg = '#f2f2f3',          bg = '#1a2023' })
  hi('TelescopePromptBorder',   { fg = '#606b70',             bg = '#1a2023' })
  hi('TelescopePromptPrefix',   { fg = '#90c2da',             bg = '#1a2023' })
  hi('TelescopePromptCounter',  { fg = '#afb4b6',  bg = '#1a2023' })
  hi('TelescopePromptTitle',    { fg = '#1a2023',             bg = '#90c2da' })
  hi('TelescopePreviewTitle',   { fg = '#1a2023',             bg = '#949fd6' })
  hi('TelescopeResultsTitle',   { fg = '#1a2023',             bg = '#ab97d3' })
  hi('TelescopeSelection',      { fg = '#f2f2f3',          bg = '#2a363c' })
  hi('TelescopeSelectionCaret', { fg = '#90c2da',             bg = '#2a363c' })
  hi('TelescopeMatching',       { fg = '#90c2da',             bold = true })

  -- mini.pick
  hi('MiniPickNormal',         { fg = '#f2f2f3',          bg = '#1a2023' })
  hi('MiniPickBorder',         { fg = '#606b70',             bg = '#1a2023' })
  hi('MiniPickPrompt',   { fg = '#f2f2f3',          bg = '#1a2023' })
  hi('MiniPickPromptPrefix',   { fg = '#90c2da',             bg = '#1a2023' })
  hi('MiniPickBorderText',    { fg = '#1a2023',             bg = '#90c2da' })
  hi('MiniPickMatchCurrent',      { fg = '#f2f2f3',          bg = '#2a363c' })
  hi('MiniPickPromptCaret', { fg = '#90c2da',             bg = '#2a363c' })
  hi('MiniPickMatchRanges',       { fg = '#90c2da',             bold = true })
end

-- Register a signal handler for SIGUSR1 (matugen updates).
-- The handler re-requires this module, which re-runs the code below, so the
-- previous handle is stopped first; otherwise handlers double on every signal.
if _G.__matugen_signal then
  _G.__matugen_signal:stop()
  _G.__matugen_signal:close()
end

local signal = vim.uv.new_signal()
_G.__matugen_signal = signal
signal:start(
  'sigusr1',
  vim.schedule_wrap(function()
    package.loaded['matugen'] = nil
    require('matugen').setup()
  end)
)

return M
