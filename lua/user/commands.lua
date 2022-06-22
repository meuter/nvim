local command = vim.api.nvim_create_user_command
local toggle_mouse_copy = require("user.utils.mouse_copy").toggle_mouse_copy
local hexconvert = require("user.utils.hexconvert")

command("Close", "Bd", { desc = "Close Current Buffer" })
command("CloseAll", ":bufdo Bd", { desc = "Close All Buffers"})
command("CloseOthers", "%bd|e#|bd#", { desc="Close All Buffers Except Current"})
command("ConvertHexStringLineToCArray", hexconvert.convert_hexstring_current_line_to_c_array, { desc="Converts Hex String to C Array" })
command("ConvertHexStringSelectionToCArray", hexconvert.convert_hexstring_selection_to_c_array, { desc="Converts Hex String to C Array" })
command("ToggleMouseCopy", toggle_mouse_copy, { desc="Toggle Mouse Copy"})

