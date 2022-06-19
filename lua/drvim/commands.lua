local def = vim.api.nvim_create_user_command

def("Close", "Bd", { desc = "Close Current Buffer" })
def("CloseAll", ":bufdo Bd", { desc = "Close All Buffers"})
def("CloseOthers", "%bd|e#|bd#", { desc="Close All Buffers Except Current"})
def("Format", vim.lsp.buf.formatting, { desc = "Format Current Buffer Using LSP"})
def("InstallLanguages", require("drvim.languages").install, { desc="Install Languages (TS Parser and LSP Servers)"})
