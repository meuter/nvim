local command = vim.api.nvim_create_user_command
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local toggle_mouse_copy = require("user.utils.mouse_copy").toggle_mouse_copy
local hexconvert = require("user.utils.hexconvert")
local format = require("user.utils.format")

-- some utility functions
command("CloseOthers", "%bd|e#|bd#", { desc="Close All Buffers Except Current"})
command("ConvertHexStringLineToCArray", hexconvert.convert_hexstring_current_line_to_c_array, { desc="Converts Hex String to C Array" })
command("ConvertHexStringSelectionToCArray", hexconvert.convert_hexstring_selection_to_c_array, { desc="Converts Hex String to C Array" })
command("ToggleMouseCopy", toggle_mouse_copy, { desc="Toggle Mouse Copy"})
command("Format", format.format, {desc="Format Code"})
command("EnableFormatOnSave", format.enable_format_on_save, {desc="Enable Format on Save"})
command("DisableFormatOnSave", format.disable_format_on_save, {desc="Disable Format on Save"})
command("CodeAction", vim.lsp.buf.code_action, { desc="Execute LSP code action"})

-- disable paren highlight in insert mode
autocmd("InsertEnter", { group = augroup("MatchParenDisable", { clear = true }), command = "NoMatchParen" })
autocmd("InsertLeave", { group = augroup("MatchParenEnable", { clear = true }), command = "DoMatchParen" })

