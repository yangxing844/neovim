-------------
--  nmaps  --
-------------

-- Utility maps for repeatable quickly change/delete current word
vim.api.nvim_set_keymap('n','c*','*``cgn',{ noremap=true,silent=true })
vim.api.nvim_set_keymap('n','c#','*``cgN',{ noremap=true,silent=true })
vim.api.nvim_set_keymap('n','cg*','g*``cgn',{ noremap=true,silent=true })
vim.api.nvim_set_keymap('n','cg#','g*``cgN',{ noremap=true,silent=true })
vim.api.nvim_set_keymap('n','d*','*``dgn',{ noremap=true,silent=true })
vim.api.nvim_set_keymap('n','d#','*``dgN',{ noremap=true,silent=true })
vim.api.nvim_set_keymap('n','dg*','g*``dgn',{ noremap=true,silent=true })
vim.api.nvim_set_keymap('n','dg#','g*``dgN',{ noremap=true,silent=true })
vim.api.nvim_set_keymap('n','gV','`[V`]',{ noremap=true,silent=true })
-- Buffer navigation
vim.api.nvim_set_keymap('n',']b',':bnext<cr>',{noremap=true,silent=true})
vim.api.nvim_set_keymap('n','[b',':bprevious<cr>',{noremap=true,silent=true})
vim.api.nvim_set_keymap('n',']B',':blast<cr>',{noremap=true,silent=true})
vim.api.nvim_set_keymap('n','[B',':bfirst<cr>',{noremap=true,silent=true})
-- quick edit
vim.api.nvim_set_keymap('n','<leader>xv',':source $MYVIMRC <CR>',{noremap=true,silent=true})
vim.api.nvim_set_keymap('n','<leader>ev',':tabedit $MYVIMRC <CR>',{noremap=true,silent=true})
vim.api.nvim_set_keymap('n','U','<c-r>',{noremap=true,silent=true})
-- keep the next and previous search result centered
vim.api.nvim_set_keymap('n','n','nzzzv',{noremap=true,silent=true})
vim.api.nvim_set_keymap('n','N','Nzzzv',{noremap=true,silent=true})
vim.api.nvim_set_keymap('n','J','mzJ\'',{noremap=true,silent=true})
-- backspace to fold 
vim.api.nvim_set_keymap('n','<backspace>','za',{noremap=true,silent=true})
-- windows navigation
vim.api.nvim_set_keymap('n','<C-j>','<C-w><C-j>',{noremap=true,silent=true})
vim.api.nvim_set_keymap('n','<C-k>','<C-w><C-k>',{noremap=true,silent=true})
vim.api.nvim_set_keymap('n','<C-l>','<C-w><C-l>',{noremap=true,silent=true})
vim.api.nvim_set_keymap('n','<C-h>','<C-w><C-h>',{noremap=true,silent=true})




-------------
--  imaps  --
-------------

vim.api.nvim_set_keymap('i','<C-e>','<C-o>$',{noremap=true,silent=true})
vim.api.nvim_set_keymap('i','<C-a>','<C-o>^',{noremap=true,silent=true})


-------------
--  tmaps  --
-------------
vim.api.nvim_set_keymap('t','<C-j>','<C-\\><C-n><C-w><C-j>a',{noremap=true,silent=true})
vim.api.nvim_set_keymap('t','<Esc>','<C-\\><C-n>',{noremap=true,silent=true})
vim.api.nvim_set_keymap('t','<C-k>','<C-\\><C-n><C-w><C-k>a',{noremap=true,silent=true})