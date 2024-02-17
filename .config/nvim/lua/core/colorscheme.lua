local status, _ = pcall(vim.cmd, "color lunaperche")
if not status then
    print("Colorscheme not found!")
    return
end
