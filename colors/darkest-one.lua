vim.opt.background = 'dark'
vim.g.colors_name = 'darkest-one'

package.loaded['lush_theme.darkest-one'] = nil

require('lush')(require('lush_theme.darkest-one'))
