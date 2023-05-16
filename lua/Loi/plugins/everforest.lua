vim.cmd([[
" Important!!ever
if has('termguicolors')
  set termguicolors
endif

set background=dark 

" Set contrast.
" This configuration option should be placed before `colorscheme everforest`.
" Available values: 'hard', 'medium'(default), 'soft'
let g:everforest_background = 'medium'

" For better performance
let g:everforest_better_performance = 1

" To enable italic in this color scheme, set this option to `1`.
" Available values: 0, 1
let g:everforest_enable_italic = 1

" To disable italic in `Comment`, set this option to `1`.
" Available values: 0, 1
let g:everforest_disable_italic_comment = 0

" Customize the cursor color, only works in GUI clients.
" Available values: 'auto', 'red', 'orange', 'yellow', 'green','aqua', 'blue', 'purple'
let g:everforest_cursor = 'auto'

" To use transparent background, set this option to `1`
" want more ui components to be transparent set this option to `2`
" Available values: 0, 1, 2
let g:everforest_transparent_background = 0

" Dim inactive windows. Only works in neovim currently.
" Available values: 0, 1,
let g:everforest_dim_inactive_windows = 0

" the color of sign column background is the same as normal text background
" Available values: 0, 1,
let g:everforest_sign_column_background = 'none'

"If you also want to color the foreground,set this option to `'colored' 
" Available values: 'none', 'colored'
let g:everforest_spell_foreground = 'none'

" The contrast of line numbers, indent lines, etc. 
" values: 'low' or 'high'
let g:everforest_ui_contrast = 'low' 

" Whether to show |hl-EndOfBuffer|.
" values : 0, 1
let g:everforest_show_eob = 1

" Some plugins support highlighting error/warning/info/hint texts, by default
" these texts are only underlined, but you can use this option to also highlight
" the background of them.
" Available values: 0, 1
let g:everforest_diagnostic_text_highlight = 0

" Some plugins support highlighting error/warning/info/hint lines, but this
" feature is disabled by default in this color scheme. To enable this feature,
" set this option to `1`.
" Available values: 0, 1
let g:everforest_diagnostic_line_highlight = 1

" Some plugins can use the virtual text feature of Neovim to display
" error/warning/info/hint information. You can use this option to adjust the
" way these virtual texts are highlighted.
" Available values: 'grey', 'colored', 'highlighted'
let g:everforest_diagnostic_virtual_text = 'colored'

" Some plugins can highlight the word under current cursor, you can use this
" option to control their behavior.
" Available values: 'grey background', 'bold', 'underline', 'italic'
let g:everforest_current_word = 'grey background'
let g:everforest_disable_terminal_colors = 1

colorscheme everforest
]])
