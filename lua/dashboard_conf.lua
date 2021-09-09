local g = vim.g

g.dashboard_default_executive = 'telescope'

g.dashboard_custom_section = {
  a = {description = {' Find what you\'re looking for'}, command = 'Telescope find_files'},
  b = {description = {' Recently Used Files         '}, command = 'Telescope oldfiles'},
  c = {description = {' Search for something        '}, command = 'Telescope live_grep'},
  d = {description = {' Hack Neovim                 '}, command = ':cd ~/dotfiles/nvimRocks | :Telescope find_files find_command=rg,--ignore,--hidden,--files prompt_prefix=🔍'},
}

g.dashboard_custom_header = {
  '',
  '',
  '',
	    '                         COMMIT FROM ANYWHERE!',
	    '                              LIVED ENERGIZED!',
}


g.dashboard_custom_footer = {
    '"Some are born great, others achieve greatness"',
    '      William Shakespeare, Twelfth Night       ',
}
