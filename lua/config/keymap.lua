vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Editing/Formatting
vim.keymap.set("v", "J", "<cmd>m '>+1<CR>gv=gv", { desc = "Move selection up one line and align" })
vim.keymap.set("v", "K", "<cmd>m '<-2<CR>gv=gv", { desc = "Move selection down one line and align" })
vim.keymap.set("n", "cp", "yap<S-}>p", { desc = "Copy and paste paragraph" })
vim.keymap.set("n", "<leader>a", "=ip", { desc = "Align inner paragraph" })
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete without saving to any register" })

-- Copy/Paste
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank into system clipboard register" })
vim.keymap.set({ "n", "v" }, "<leader>p", '"+p', { desc = "Put from system clipboard register" })
vim.keymap.set("x", "<leader>r", '"_dP', { desc = "Replace text without overwriting register" })

-- Search/Replace
vim.keymap.set(
  "n",
  "<leader>u",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "S[u]bstitute all word occurrences" }
)
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostics
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Op[e]n diagnostics" })
vim.keymap.set("n", "[d", function()
  vim.diagnostic.jump({ count = -1, float = true })
end, { desc = "Go to previous [d]iagnostic" })
vim.keymap.set("n", "]d", function()
  vim.diagnostic.jump({ count = 1, float = true })
end, { desc = "Go to next [d]iagnostic" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Navigation
vim.keymap.set("n", "<C-H>", "<C-W>h")
vim.keymap.set("n", "<C-J>", "<C-W>j")
vim.keymap.set("n", "<C-K>", "<C-W>k")
vim.keymap.set("n", "<C-L>", "<C-W>l")
vim.keymap.set("n", "<C-X>", "<C-W>q")
vim.keymap.set("n", "<C-RIGHT>", "<cmd>vertical resize +2 <CR>", { silent = true })
vim.keymap.set("n", "<C-LEFT>", "<cmd>vertical resize -2 <CR>", { silent = true })
vim.keymap.set("n", "<C-DOWN>", "<cmd>resize -2 <CR>", { silent = true })
vim.keymap.set("n", "<C-UP>", "<cmd>resize +2 <CR>", { silent = true })
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv", { desc = "Jump to next search match" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Jump to previous search match" })
vim.keymap.set("n", "<A-l>", "<cmd>bn<CR>", { desc = "Buffer next", silent = true })
vim.keymap.set("n", "<A-h>", "<cmd>bp<CR>", { desc = "Buffer previous", silent = true })
vim.keymap.set("n", "<A-x>", "<cmd>bd<CR>", { desc = "Buffer close", silent = true })

-- Terminal
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
vim.keymap.set("n", "<leader>vc", "<cmd>terminal<CR>", { desc = "Open terminal" })

-- Treesitter
vim.keymap.set("n", "<leader>hi", vim.cmd.Inspect, { silent = true, desc = "Show [hi]light under cursor" })

-- Git Diff
vim.keymap.set("n", "<leader>gl", function()
  vim.cmd.diffget("LOCAL")
end, { desc = "Diff [G]et [L]ocal" })

vim.keymap.set("n", "<leader>gr", function()
  vim.cmd.diffget("REMOTE")
end, { desc = "Diff [G]et [R]emote" })

-- Zellij
local function zrun(cwd, name, ...)
  if vim.env.ZELLIJ then
    vim.system({ "zellij", "run", "--cwd", cwd, "-n", name, "-d", "right", "--", ... })
  end
end

local function ztab(cwd, name, ...)
  if vim.env.ZELLIJ then
    vim.system({ "zellij", "action", "new-tab", "--cwd", cwd, "-n", name, "--", ... })
  end
end

local function z_enable_local_ui(script, tenant)
  zrun(
    "C:\\edgeteam\\tribal.edge.ui\\module\\tribal.edge.ui",
    "enable local",
    "pwsh.exe",
    "-File",
    ".\\" .. script,
    "-updateEnvironmentFile",
    "-p_subscription",
    "IS-Dev Edge - Dev AKS",
    "-p_tenant",
    tenant,
    "-region",
    "local",
    "-p_slot",
    "mrmaks",
    "-p_appConfigRegion",
    "uksouth",
    "-bff"
  )
end

local function z_nx_serve(app)
  ztab(
    "C:\\edgeteam\\tribal.edge.ui\\module\\tribal.edge.ui",
    "nx serve",
    "pwsh.exe",
    "-NoExit",
    "-Command",
    "nx serve " .. app .. " -c bfflocal --no-tui"
  )
end

vim.keymap.set("n", "<leader>zusu", function()
  z_nx_serve("srs")
end, { silent = true, desc = "Zellij nx serve srs" })

vim.keymap.set("n", "<leader>zusp", function()
  z_nx_serve("student-portal")
end, { silent = true, desc = "Zellij nx serve portal" })

vim.keymap.set("n", "<leader>zues", function()
  zrun(
    "C:\\edgeteam\\tribal.edge.ui\\module\\tribal.edge.ui",
    "i18n extract",
    "pwsh.exe",
    "-Command",
    "npm run extract-i18n:srs"
  )
end, { silent = true, desc = "Zellij i18n extract srs" })

vim.keymap.set("n", "<leader>zuts", function()
  local apiKey = vim.env.TranslatorKey
  zrun(
    "C:\\edgeteam\\tribal.edge.ui\\module\\tribal.edge.ui",
    "i18n translate",
    "pwsh.exe",
    "-Command",
    "npm run translate-i18n:srs -- --azureTranslator=mrmtranslator --apiKey=" .. apiKey
  )
end, { silent = true, desc = "Zellij i18n translate srs" })

vim.keymap.set("n", "<leader>zuep", function()
  zrun(
    "C:\\edgeteam\\tribal.edge.ui\\module\\tribal.edge.ui",
    "i18n extract",
    "pwsh.exe",
    "-Command",
    "npm run extract-i18n:student-portal"
  )
end, { silent = true, desc = "Zellij i18n extract portal" })

vim.keymap.set("n", "<leader>zutp", function()
  local apiKey = vim.env.TranslatorKey
  zrun(
    "C:\\edgeteam\\tribal.edge.ui\\module\\tribal.edge.ui",
    "i18n translate",
    "pwsh.exe",
    "-Command",
    "npm run translate-i18n:student-portal -- --azureTranslator=mrmtranslator --apiKey=" .. apiKey
  )
end, { silent = true, desc = "Zellij i18n translate portal" })

vim.keymap.set("n", "<leader>zulc", function()
  z_enable_local_ui("enable-local-ui.ps1", "caltech")
end, { silent = true, desc = "Zellij enable local UI caltech" })

vim.keymap.set("n", "<leader>zult", function()
  z_enable_local_ui("enable-local-ui.ps1", "tribal")
end, { silent = true, desc = "Zellij enable local UI tribal" })

vim.keymap.set("n", "<leader>zulpc", function()
  z_enable_local_ui("enable-local-ui-portal.ps1", "caltech")
end, { silent = true, desc = "Zellij enable local UI portal caltech" })

vim.keymap.set("n", "<leader>zulpt", function()
  z_enable_local_ui("enable-local-ui-portal.ps1", "tribal")
end, { silent = true, desc = "Zellij enable local UI portal tribal" })
