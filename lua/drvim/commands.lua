local command = vim.api.nvim_create_user_command

command("Format", vim.lsp.buf.formatting, { desc = "Format Current Buffer Using LSP"})

command("Close", "Bd", { desc = "Close Current Buffer" })
command("CloseAll", ":bufdo Bd", { desc = "Close All Buffers"})
command("CloseAllExceptCurrent", "%bd|e#|bd#", { desc="Close All Buffers Except Current"})

