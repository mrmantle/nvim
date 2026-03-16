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

-- Windows Terminal
-- New tab
local function wtnt(...)
  vim.system({
    "wt",
    "-w",
    "0",
    "nt",
    "-p",
    "PS7",
    "-d",
    ...,
  })
end

-- New split pane
local function wtnp(...)
  vim.system({
    "wt",
    "-w",
    "0",
    "sp",
    "-V",
    "-p",
    "PS7",
    "-d",
    ...,
  })
end

local function enable_local_ui(script, tenant)
  wtnp(
    "C:\\edgeteam\\tribal.edge.ui\\module\\tribal.edge.ui",
    "--title",
    "enable local",
    "pwsh.exe",
    "-NoExit",
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

local function nx_serve(app)
  wtnt(
    "C:\\edgeteam\\tribal.edge.ui\\module\\tribal.edge.ui",
    "--title",
    "nx serve ",
    "pwsh.exe",
    "-NoExit",
    "-Command",
    "nx serve " .. app .. " -c bfflocal --no-tui"
  )
end

vim.keymap.set("n", "<leader>zusu", function()
  nx_serve("srs")
end, { silent = true, desc = "Windows terminal nx serve" })

vim.keymap.set("n", "<leader>zusp", function()
  nx_serve("student-portal")
end, { silent = true, desc = "Windows terminal nx serve portal" })

vim.keymap.set("n", "<leader>zue", function()
  wtnp(
    "C:\\edgeteam\\tribal.edge.ui\\module\\tribal.edge.ui",
    "--title",
    "i18n extract",
    "pwsh.exe",
    "-NoExit",
    "-Command",
    "npm run extract-i18n:srs"
  )
end, { silent = true, desc = "Windows terminal i18n extract" })

vim.keymap.set("n", "<leader>zut", function()
  local apiKey = vim.env.TranslatorKey
  wtnp(
    "C:\\edgeteam\\tribal.edge.ui\\module\\tribal.edge.ui",
    "--title",
    "i18n translate",
    "pwsh.exe",
    "-NoExit",
    "-Command",
    "npm run translate-i18n:srs -- --azureTranslator=mrmtranslator --apiKey=" .. apiKey
  )
end, { silent = true, desc = "Windows terminal i18n translate" })

vim.keymap.set("n", "<leader>zulc", function()
  enable_local_ui("enable-local-ui.ps1", "caltech")
end, { silent = true, desc = "Windows terminal enable local UI caltech" })

vim.keymap.set("n", "<leader>zult", function()
  enable_local_ui("enable-local-ui.ps1", "tribal")
end, { silent = true, desc = "Windows terminal enable local UI tribal" })

vim.keymap.set("n", "<leader>zulpc", function()
  enable_local_ui("enable-local-ui-portal.ps1", "caltech")
end, { silent = true, desc = "Windows terminal enable local UI portal caltech" })

vim.keymap.set("n", "<leader>zulpt", function()
  enable_local_ui("enable-local-ui-portal.ps1", "tribal")
end, { silent = true, desc = "Windows terminal enable local UI portal tribal" })
