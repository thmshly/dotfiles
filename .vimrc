":let zenburn_high_Contrast=1 
":colorscheme zenburn
:let g:solarized_contrast = "high"
:colorscheme solarized
:set background=dark
:map <Leader>bgd :set background=dark<CR>
:map <Leader>bgl :set background=light<CR>

"au BufWinLeave * mkview
"au BufWinEnter * silent loadview
" S
" Set Auto-indent options
set cindent
set smartindent
set autoindent
" File Type detection
filetype on
filetype plugin on
" Enable Code Folding
set foldenable

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
" Turn off the retched flashing (that would probably cause an epileptic to
" have a seizure if they were using a dark theme)
set visualbell t_vb=
au GuiEnter set * t_vb=

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler			" show the cursor position all the time
set showcmd			" display incomplete commands
set incsearch		" do incremental searching
set number			" show line numbers

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal hascolors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=72
  autocmd FileType text setlocal nocin

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif
set ofu=syntaxcomplete#Complete
"au BufRead * set ft=php.html
"au BufNewFile  set ft=php.html
noremap j gj
noremap k gk
"au BufWritePost /home/thomas/Media/text/wiki/* :helptags /home/thomas/Media/text/wiki/
"Set tabs to display as 4 spaces
:set tabstop=4
:set shiftwidth=4


au BufRead,BufNewFile *.js set ft=javascript syntax=jquery

"This is for perldoc.vim
autocmd BufNewFile,BufRead *.p? map <F1> :Perldoc<cword><CR>
autocmd BufNewFile,BufRead *.p? setf perl
autocmd BufNewFile,BufRead *.p? let g:perldoc_program='/usr/bin/perldoc'
" autocmd BufNewFile,BufRead *.p? source /PATH/TO/.vim/ftplugin/perl_doc.vim

"Showing whitespace stuff
"set listchars=tab:>-,trail:~,eol:¶
"set listchars=tab:,trail:~,eol:
"set list

:map <Leader>zbd :let g:zenburn_high_Contrast = 1<CR> :source ~/.vimrc<CR>
:map <Leader>tbt :TagbarToggle<CR>
:map <Leader>ect :Project<CR>

"Hide gui
:map <Leader>hg :set guioptions=<CR>

"Show or hide seach highlighting
:map <Leader>hs :set hlsearch<CR>
:map <Leader>nhs :nohls<CR>

"Replace or delete last search keyword or pattern
:map <Leader>r :%s//

"++**++**++**++**++
" Open files and directories
"++**++**++**++**++
"Open current working directory to browse in split
:map <Leader>s. :sp ./<CR>

"Partial split open for ~/
:map <Leader>s~ :sp ~/

"Partial open for ~/
:map <Leader>e~ :e ~/

"Partial open file command for path ~/.v (.vim/, .vimrc ...)
:map <Leader>e.v :e ~/.v

"Partial split open file command for path ~/.v (.vim/, .vimrc ...)
:map <Leader>s.v :sp ~/.v

"Open file ~/.xinitrc 
:map <Leader>e.x :e ~/.xinitrc<CR>

"Split open file ~/.xinitrc
:map <Leader>s.x :sp ~/.xinitrc<CR>

"Partial open file for ~/.bash.. (.bashrc .bash_profile etc)
:map <Leader>e.b :e ~/.bash

"Source .vimrc
:map <Leader>sov :source ~/.vimrc<CR>

"Source ...
:map <Leader>so :source 
"++**++**++**++**++
" Buffer movement and positioning
"++**++**++**++**++
" UP DOWN
"Move cursor to the next buffer window down and maximise it/ flatten others
:map <Leader>j <C-W>j<C-W>_

"Move cursor to the next buffer window up
:map <Leader>k <C-W>k<C-W>_

"Reposition current buffer window at the bottom
:map <Leader>J <C-W>J

"Reposition current buffer window at the top 
:map <Leader>K <C-W>K

" LEFT RIGHT
"Move cursor one buffer window left
:map <Leader>h <C-W>h

"Move cursor one buffer window right
:map <Leader>l <C-W>l

"Move current buffer window to the left
:map <Leader>H <C-W>H

"Move current buffer window to the right
:map <Leader>L <C-W>L

" DISTRIBUTION
"Maximise current buffer window vertically
:map <Leader>_ <C-W>_

"Maximise current buffer window horizontally
:map <Leader><Bar> <C-W><Bar>

"Resize windows equally
:map <Leader>= <C-W>=

"Previous buffer
:map <Leader>pb :bp<CR>

"Next buffer
:map <Leader>nb :bn<CR>

"Switch to buffer if open
:map <Leader>sb :sbuffer 

"Replace current buffer with another
:map <Leader>bb :buffer 

"List buffers
:map <Leader>bl :ls<CR>

"Write current buffer
:map <Leader>w :w<CR>

"Open new tab
:map <Leader>t :tabe<CR>


:set switchbuf=useopen,split
:set tags=./tags;tags/;
:set wildmenu
"Automatic syntax checking for perl files
"au BufWritePost *.pl,*.pm !perl -c %
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline

:map <Leader>fm :set foldmethod=manual<CR>

if has("autocmd")
	" Highlight TODO, FIXME, NOTE, etc.
if v:version > 701
		autocmd Syntax * call matchadd('Todo',  '\W\zs\(ing\|FIXME\|CHANGED\|XXX\|BUG\|HACK\)')
		autocmd Syntax * call matchadd('Debug', '\W\zs\(rq3\|TS3\|NOTE\|INFO\|IDEA\)')
	endif
endif

"Lock or unlock autocompletePop
:map <Leader>pop :AcpUnlock<CR>
:map <Leader>nopop :AcpLock<CR>

"No text width and 80 cols
:map <Leader>ntw :setlocal textwidth=0<CR>
:map <Leader>tw :setlocal textwidth=79<CR>

"Spell check Toggle
:map <Leader>sc :setlocal spell! spelllang=en_gb <CR> 

"++**++**++**++**++
" TagList settings and bindings
"++**++**++**++**++
" set the names of flags
let Tlist_Php_Settings = 'php;c:class;f:function;d:constant'

" close all folds except for current file
let Tlist_File_Fold_Auto_Close = 1

" make tlist pane active when opened
let Tlist_GainFocus_On_ToggleOpen = 0

"Toggle show/hide
:map <Leader>tt :TlistToggle<CR>

nmap <silent> <Leader>p <Plug>ToggleProject

"Hiding the msg() debug functions
":set conceallevel=2 concealcursor="" "cocu
autocmd BufNewFile,BufRead *.p? setlocal conceallevel=2 
:syntax match mociMsg /^\s*msg\(.*\)\;/ conceal cchar=~
