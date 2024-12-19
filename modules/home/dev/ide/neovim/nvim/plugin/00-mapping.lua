-- Mostly from basics.lua
local map = vim.keymap.set

vim.g.mapleader = ' '

-- Move by visible lines. Notes:
-- - Don't map in Operator-pending mode because it severely changes behavior:
--   like `dj` on non-wrapped line will not delete it.
-- - Condition on `v:count == 0` to allow easier use of relative line numbers.
map({ 'n', 'x' }, 'j', [[v:count == 0 ? 'gj' : 'j']], { expr = true })
map({ 'n', 'x' }, 'k', [[v:count == 0 ? 'gk' : 'k']], { expr = true })


-- Copy/paste with system clipboard
map({ 'n', 'x' }, 'gy', '"+y', { desc = 'Copy to system clipboard' })
map(  'n',        'gp', '"+p', { desc = 'Paste from system clipboard' })
-- - Paste in Visual with `P` to not copy selected text (`:h v_P`)
map(  'x',        'gp', '"+P', { desc = 'Paste from system clipboard' })

-- Window navigation
map('n', '<C-H>', '<C-w>h', { desc = 'Focus on left window' })
map('n', '<C-J>', '<C-w>j', { desc = 'Focus on below window' })
map('n', '<C-K>', '<C-w>k', { desc = 'Focus on above window' })
map('n', '<C-L>', '<C-w>l', { desc = 'Focus on right window' })

-- Reselect latest changed, put, or yanked text
map('n', 'gV', '"`[" . strpart(getregtype(), 0, 1) . "`]"', { expr = true, replace_keycodes = false, desc = 'Visually select changed text' })

-- Search inside visually highlighted text. Use `silent = false` for it to
-- make effect immediately.

-- Alternative way to save and exit in Normal mode.
-- NOTE: Adding `redraw` helps with `cmdheight=0` if buffer is not modified
map(  'n',        '<C-S>', '<Cmd>silent! update | redraw<CR>',      { desc = 'Save' })
map({ 'i', 'x' }, '<C-S>', '<Esc><Cmd>silent! update | redraw<CR>', { desc = 'Save and go to Normal mode' })   map('x', 'g/', '<esc>/\\%V', { silent = false, desc = 'Search inside visual selection' })

local map_toggle = function(lhs, rhs, desc) map('n', 't' .. lhs, rhs, { desc = desc }) end
map_toggle('b', '<Cmd>lua vim.o.bg = vim.o.bg == "dark" and "light" or "dark"; print(vim.o.bg)<CR>',       "Toggle 'background'")
map_toggle('c', '<Cmd>setlocal cursorline! cursorline?<CR>',                                               "Toggle 'cursorline'")
map_toggle('C', '<Cmd>setlocal cursorcolumn! cursorcolumn?<CR>',                                           "Toggle 'cursorcolumn'")
map_toggle('d', '<Cmd>lua print(MiniBasics.toggle_diagnostic())<CR>',                                      'Toggle diagnostic')
map_toggle('h', '<Cmd>let v:hlsearch = 1 - v:hlsearch | echo (v:hlsearch ? "  " : "no") . "hlsearch"<CR>', 'Toggle search highlight')
map_toggle('i', '<Cmd>setlocal ignorecase! ignorecase?<CR>',                                               "Toggle 'ignorecase'")
map_toggle('l', '<Cmd>setlocal list! list?<CR>',                                                           "Toggle 'list'")
map_toggle('n', '<Cmd>setlocal number! number?<CR>',                                                       "Toggle 'number'")
map_toggle('r', '<Cmd>setlocal relativenumber! relativenumber?<CR>',                                       "Toggle 'relativenumber'")
map_toggle('s', '<Cmd>setlocal spell! spell?<CR>',                                                         "Toggle 'spell'")
map_toggle('w', '<Cmd>setlocal wrap! wrap?<CR>',                                                           "Toggle 'wrap'")

-- Window navigation
map('n', '<C-H>', '<C-w>h', { desc = 'Focus on left window' })
map('n', '<C-J>', '<C-w>j', { desc = 'Focus on below window' })
map('n', '<C-K>', '<C-w>k', { desc = 'Focus on above window' })
map('n', '<C-L>', '<C-w>l', { desc = 'Focus on right window' })

-- Window resize (respecting `v:count`)
map('n', '<C-Left>',  '"<Cmd>vertical resize -" . v:count1 . "<CR>"', { expr = true, replace_keycodes = false, desc = 'Decrease window width' })
map('n', '<C-Down>',  '"<Cmd>resize -"          . v:count1 . "<CR>"', { expr = true, replace_keycodes = false, desc = 'Decrease window height' })
map('n', '<C-Up>',    '"<Cmd>resize +"          . v:count1 . "<CR>"', { expr = true, replace_keycodes = false, desc = 'Increase window height' })
map('n', '<C-Right>', '"<Cmd>vertical resize +" . v:count1 . "<CR>"', { expr = true, replace_keycodes = false, desc = 'Increase window width' })

-- Move only sideways in command mode. Using `silent = false` makes movements
-- to be immediately shown.
map('c', '<M-h>', '<Left>',  { silent = false, desc = 'Left' })
map('c', '<M-l>', '<Right>', { silent = false, desc = 'Right' })

-- Don't `noremap` in insert mode to have these keybindings behave exactly
-- like arrows (crucial inside TelescopePrompt)
map('i', '<M-h>', '<Left>',  { noremap = false, desc = 'Left' })
map('i', '<M-j>', '<Down>',  { noremap = false, desc = 'Down' })
map('i', '<M-k>', '<Up>',    { noremap = false, desc = 'Up' })
map('i', '<M-l>', '<Right>', { noremap = false, desc = 'Right' })

map('t', '<M-h>', '<Left>',  { desc = 'Left' })
map('t', '<M-j>', '<Down>',  { desc = 'Down' })
map('t', '<M-k>', '<Up>',    { desc = 'Up' })
map('t', '<M-l>', '<Right>', { desc = 'Right' })
