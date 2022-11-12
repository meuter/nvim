local command = vim.api.nvim_create_user_command

command("Close", "Bd", { desc = "Close Current Buffer" })
command("CloseAll", ":bufdo Bd", { desc = "Close All Buffers"})
