require("mrdupin.options")
require("mrdupin.plugins")
require("mrdupin.remap")

-- colorscheme config: kanagawa
local themeStatus, kanagawa = pcall(require, "kanagawa")

if themeStatus then
    vim.cmd("colorscheme kanagawa")
else
    return
end

