local command = vim.api.nvim_create_user_command
local toggle_mouse_copy = require("drvim.utils.mouse_copy").toggle_mouse_copy
local hexconvert = require("drvim.utils.hexconvert")

command("Close", "Bd", { desc = "Close Current Buffer" })
command("CloseAll", ":bufdo Bd", { desc = "Close All Buffers"})
command("CloseOthers", "%bd|e#|bd#", { desc="Close All Buffers Except Current"})
command("ConvertHexStringLineToCArray", hexconvert.convert_hexstring_current_line_to_c_array, { desc="Converts Hex String to C Array" })
command("ConvertHexStringSelectionToCArray", hexconvert.convert_hexstring_selection_to_c_array, { desc="Converts Hex String to C Array" })
command("Format", vim.lsp.buf.formatting, { desc = "Format Current Buffer Using LSP"})
command("ToggleMouseCopy", toggle_mouse_copy, { desc="Toggle Mouse Copy"})

