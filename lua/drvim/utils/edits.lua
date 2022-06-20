local M = {}

function M.get_selected_range()
    local range = {}
    range.start_row = vim.fn.line("'<")
    range.start_col = vim.fn.col("'<")
    range.end_row = vim.fn.line("'>")
    range.end_col = vim.fn.col("'>")
    return range
end

function M.get_current_line_range()
    local current_position = vim.api.nvim_win_get_cursor(0)
    local current_line_index = current_position[1] -- lua table are 1-indexed!
    local current_line = M.get_current_line()

    local range = {}
    range.start_row = current_line_index
    range.start_col = 1
    range.end_row = current_line_index
    range.end_col = #current_line
    return range
end

function M.convert_range_to_lsp_range(range)
    return {
        ["start"] = {
            line = range.start_row - 1,
            character = range.start_col - 1,
        },
        ["end"] = {
            line = range.end_row - 1,
            character = range.end_col,
        },
    }
end

function M.get_selected_lsp_range()
    return M.convert_range_to_lsp_range(M.get_selected_range())
end

function M.get_current_line_lsp_range()
    return M.convert_range_to_lsp_range(M.get_current_line_range())
end

function M.get_selected_lines()
    local range = M.get_selected_range()
    local text = vim.api.nvim_buf_get_lines(0, range.start_row-1, range.end_row, false)
    local text_length = #text
    local end_col = math.min(#text[text_length], range.end_col)
    local end_idx = vim.str_byteindex(text[text_length], end_col)
    local start_idx = vim.str_byteindex(text[1], range.start_col)

    text[text_length] = text[text_length]:sub(1, end_idx)
    text[1] = text[1]:sub(start_idx)

    return text
end

function M.get_selected_text()
    local selected_lines = M.get_selected_lines()
    return table.concat(selected_lines, "")
end

function M.get_word_under_cursor()
    vim.fn.expand("<cword>")
end

function M.get_current_line()
    return vim.api.nvim_get_current_line()
end

function M.get_current_mode()
    return vim.api.get_selected_lines()
end

function M.replace_current_line_with(lines_to_insert)
    local edits = {
        {
            range = M.get_current_line_lsp_range(),
            newText = table.concat(lines_to_insert, "\n")
        }
    }
    vim.lsp.util.apply_text_edits(edits, 0, "utf-16")
end

function M.replace_selection_with(lines_to_insert)
    local edits = {
        {
            range = M.get_selected_lsp_range(),
            newText = table.concat(lines_to_insert, "\n")
        }
    }
    vim.lsp.util.apply_text_edits(edits, 0, "utf-16")
end

return M
