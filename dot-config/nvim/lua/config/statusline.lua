function Stl_diff_summary()
    local summary = vim.b.minidiff_summary
    if not summary then return "" end
    local pad = ""
    local t = {}
    if summary.add and summary.add > 0 then
        table.insert(t, "%#Added#+" .. summary.add)
        pad = " "
    end
    if summary.change and summary.change > 0 then
        table.insert(t, "%#Changed#~" .. summary.change)
        pad = " "
    end
    if summary.delete and summary.delete > 0 then
        table.insert(t, "%#Removed#-" .. summary.delete)
        pad = " "
    end
    return table.concat(t, " ") .. "%#NONE#" .. pad
end

vim.o.statusline =
    "%<%y %{% v:lua.Stl_diff_summary() %}%f %h%w%q%m%r %{% v:lua.require('vim._core.util').term_exitcode() %}%=%{% luaeval('(package.loaded[''vim.ui''] and vim.api.nvim_get_current_win() == tonumber(vim.g.actual_curwin or -1) and vim.ui.progress_status()) or '''' ')%}%{% &showcmdloc == 'statusline' ? '%-10.S ' : '' %}%{% exists('b:keymap_name') ? '<'..b:keymap_name..'> ' : '' %}%{% &busy > 0 ? '◐ ' : '' %}%{% luaeval('(package.loaded[''vim.diagnostic''] and next(vim.diagnostic.count()) and vim.diagnostic.status() .. '' '') or '''' ') %}%{% &ruler ? ( &rulerformat == '' ? '%-14.(%l,%c%V%) %P' : &rulerformat) : '' %}"
