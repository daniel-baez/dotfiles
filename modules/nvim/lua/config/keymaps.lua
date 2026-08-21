-- Keymaps preserved / modernized from legacy ,d* bindings

local map = vim.keymap.set

map("n", "<C-L>", "<cmd>nohlsearch<CR><C-L>", { desc = "Clear search highlight" })
map({ "n", "i", "v" }, "<C-S>", "<cmd>update<CR>", { desc = "Save" })

-- Config shortcuts (legacy ,d*)
map("n", ",dn", "<cmd>setlocal number!<CR>", { desc = "Toggle line numbers" })
map("n", ",dR", "<cmd>source $MYVIMRC<CR><cmd>echo 'config reloaded'<CR>", { desc = "Reload config" })
map("n", ",dov", "<cmd>split $MYVIMRC<CR>", { desc = "Open init.lua" })
map("n", ",doV", "<cmd>tabedit $MYVIMRC<CR>", { desc = "Open init.lua in tab" })
map("n", ",dot", "<cmd>e ~/.tmux.conf<CR>", { desc = "Open tmux.conf" })
map("n", ",dobb", "<cmd>e ~/.dotfiles.bashrc<CR>", { desc = "Open shell stub" })

-- Tabs (legacy)
map("n", "th", "<cmd>tabfirst<CR>")
map("n", "tk", "<cmd>tabnext<CR>")
map("n", "tj", "<cmd>tabprev<CR>")
map("n", "tl", "<cmd>tablast<CR>")
map("n", "tn", "<cmd>tabnew<CR>")
map("n", "td", "<cmd>tabclose<CR>")

-- Oil / file tree
map("n", ",dt", "<cmd>Oil<CR>", { desc = "Open parent dir (Oil)" })
