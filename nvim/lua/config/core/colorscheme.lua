local status, _ = pcall(vim.cmd, "color shirotelin")
if not status then
    print("Colorscheme not found!")
    return
end
