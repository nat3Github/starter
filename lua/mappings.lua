require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- just format using <leader> fm
-- save with autosave plugin
map("n", "<leader>s", ":wa<CR>", { desc = "save all", noremap = true, silent = true })

map("n", "<leader>qa", ":wa<CR>:qa<CR>", { desc = "quit all", noremap = true, silent = true })

-- Leader bookmarks
map("n", "<leader>1", "`1", { desc = "Jump to Mark 1", noremap = true, silent = true })
map("n", "<leader>2", "`2", { desc = "Jump to Mark 2", noremap = true, silent = true })
map("n", "<leader>3", "`3", { desc = "Jump to Mark 3", noremap = true, silent = true })
map("n", "<leader>4", "`4", { desc = "Jump to Mark 4", noremap = true, silent = true })
map("n", "<leader>5", "`5", { desc = "Jump to Mark 5", noremap = true, silent = true })

-- the ONE bookmark (bookmark M) set with mm
map("n", "mm", "m<S-m>", { desc = "set M mark", noremap = true, silent = true })

-- jump back to Mark M
map("n", "<leader>o", "`M", { desc = "Jump to Mark M", noremap = true, silent = true })

-- save before opening the terminal

map("n", "<A-i>", function()
  vim.cmd "wa"
  require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
end, { desc = "togle terminal and save", noremap = true, silent = true })

map("i", "<A-o>", "<ESC>$a;<ESC>", { desc = "Colon newline", noremap = true, silent = true })
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

--autosave
map("n", "<lfader>as", ":ASToggle<CR>", { desc = "Auto save toggle", noremap = true, silent = true })

-- github
function PushToGithub()
  local date_time = os.date "%Y-%m-%d %H:%M:%S"
  local text = "autocommit date: " .. date_time
  vim.cmd "wa"
  vim.cmd "split | terminal"
  vim.fn.chansend(vim.b.terminal_job_id, "git add * &&\n")
  local comm = " git commit -m " .. '"' .. text .. '" &&\n'
  vim.fn.chansend(vim.b.terminal_job_id, comm)
  vim.fn.chansend(vim.b.terminal_job_id, " git push\n")
end

map("n", "<leader>gp", ":lua PushToGithub()<CR><A-h>", { desc = "push to github", noremap = true })
