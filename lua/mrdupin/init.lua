print("🚀 start hacking! 🤟")
require("mrdupin.options")
require("mrdupin.plugins")

-- colorscheme config: kanagawa
local themeStatus, kanagawa = pcall(require, "kanagawa")

if themeStatus then
    vim.cmd("colorscheme kanagawa")
else
    return
end
