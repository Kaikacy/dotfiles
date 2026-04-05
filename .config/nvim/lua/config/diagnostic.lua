vim.diagnostic.config({
    severity_sort = true,
    virtual_text = {
        current_line = true,
        prefix = "󰨓",
        source = "if_many",
    },
    float = {
        source = "if_many",
    },
})
