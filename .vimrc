" ============================================================
" Folling tempate is from https://github.com/VundleVim/Vundle.vim
" ============================================================
" enter the current millenium
set nocompatible              " be iMproved, required
filetype off                  " required

" highlight when searching

set hlsearch

map <esc>[A <up>
map <esc>[B <down>
map <esc>[D <left>
map <esc>[C <right>

" enable true color 24 bit, so that we do not need to
" http://lotabout.me/2018/true-color-for-tmux-and-vim/
if has("termguicolors")
    " enable true color
    set termguicolors
endif

" use Leader key + f to hide or show the NERDTree
" use Leader key + v to locate the current open file in NERDTree
nnoremap <Leader>f :NERDTreeToggle<CR>
nnoremap <Leader>v :NERDTreeFind<CR>

" Let system know what is F7 and F8
" set <F7>=[18~
" set <F8>=[19~
map <esc>[18~ <F7>
map <esc>[19~ <F8>

" map F7 and F8 to browse over compile result
" put the line always in the centre
noremap <F8> :cn<CR>z.
noremap <F7> :cp<CR>z.

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" Command-T, File Fuzzy Finder
Plugin 'wincent/command-t'

" table mode
Plugin 'dhruvasagar/vim-table-mode'

" buffer and file management
Plugin 'Shougo/unite.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-git'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" select a theme
let g:airline_theme='alduin'

" set the tmux status line to the same style of vim-ariline
Plugin 'edkolev/tmuxline.vim'

" NERDTree
Plugin 'git://github.com/scrooloose/nerdtree.git'

" YCM plugin
" 1) Step 1, Install:
" cd .vim/bundle/YouCompleteMe
" python3 install.py --clang-completer
" 2) Step 2, configure project
" add following python file  in project top directory
" ycm_extra_conf.py
" with content
"
" def Settings(**kwargs):
"    return {
"        'flags': ['-x', 'c', '-Wall', '-Wextra', '-Werror'],
"    }
Plugin 'Valloric/YouCompleteMe'

" Text Exchange Plugin
" see the video in
" http://vimcasts.org/episodes/swapping-two-regions-of-text-with-exchange-vim/
" you can now use cx to exchange the text
" it support also motion
" cxiw and then press in another word ".", it will exchange the two words
" or cxi) and then press in another text, it will exchange the text in ()
Plugin 'tommcdo/vim-exchange'

" support markdown document folding
Plugin 'nelstrom/vim-markdown-folding'
" support markdown syntax highlight
Plugin 'tpope/vim-markdown'

" clang format
Plugin 'rhysd/vim-clang-format'

" Ultisnips
Plugin 'SirVer/ultisnips'

" snippets scritps for various language
Plugin 'honza/vim-snippets'

" this alternative one fix the issue
Plugin 'Raimondi/delimitMate'

" asyncrun
Plugin 'skywind3000/asyncrun.vim'

" using mm to add/remove bookmark
"       mi add/edit/remove annotation at current line
"       mn jumpt to next bookmark
"       mp previous bookmark
"       ma show all bookmarks
"       mc clear bookmarks in current buffer only
"       mx clear bookmark in all buffers
Plugin 'MattesGroeger/vim-bookmarks'

Plugin 'nathanaelkane/vim-indent-guides'
" CCTree, calling tree
" Plugin 'hari-rangarajan/CCTree'

" using pip3 to install flake8 and autopep8
" do not use brew.
Plugin 'pandysong/vim-flake8'
Plugin 'pandysong/vim-autopep8'
Plugin 'tmhedberg/SimpylFold'
Plugin 'fatih/vim-go'
Plugin 'w0rp/ale'
Plugin 'mileszs/ack.vim'

Plugin 'rhysd/devdocs.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'jpalardy/vim-slime'

Plugin 'ianva/vim-youdao-translater'
Plugin 'makerj/vim-pdf'
Plugin 'pandysong/cscope.vim'

" rfc reading"
Plugin 'mhinz/vim-rfc.git'
Plugin 'vim-scripts/rfc-syntax'
Plugin 'pandysong/highlight.vim'

" open url from vim
" Plugin 'henrik/vim-open-url.git'

"Plugin 'pandysong/ghost-text.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Put your non-Plugin stuff after this line

syntax enable
filetype plugin on

" search down into subfolders
" provides tab-complete for all file-related tasks
set path+=**


" display all matching files when we tab complete
set wildmenu

" Now e can
" - hit tabl to : find by partial match
" - use * to make it fuzzy
"
"  Thing to consider
"  -  :b lets you autocomplete any open buffer

" ctags
" command! MakeTags !ctags -R --fields=+l .
" using cscope instead of default ctags
" command! MakeTags !cscope -b -R
command! MakeTags !./MakeTags.sh
set cscopetag

"cabbrev di cexpr system('./detect_zombie_includes.sh') <bar> copen
"cabbrev di AsyncRun ./detect_zombie_includes.sh
"cabbrev dis AsyncRun python include_spotter.py %
"cabbrev am AsyncRun ./compile.sh
"cabbrev aem AsyncRun ./another_compile.sh
"cabbrev afm AsyncRun ./other_compile.sh
"cabbrev ts AsyncRun  -raw ./runtest.sh
"cabbrev mt AsyncRun -raw ./MakeTags.sh
"cabbrev mc AsyncRun -raw ./another_compile.sh
"cabbrev vg AsyncRun -raw cd ..; ./runimg2.sh ; cd -
cabbrev ss :AsyncRun! ag --vimgrep <cword>

cabbrev ch w !xclip
" auto open quickfix window after AsyncRun is started
augroup MyGroup
        autocmd User AsyncRunStart call asyncrun#quickfix_toggle(8, 1)
augroup END

autocmd FileType python map <buffer> <F4> :call Flake8()<CR>
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
let g:flake8_cmd="python3 -m flake8"
let no_flake8_maps = 1
let g:autopep8_cmd="python3 -m autopep8"
let g:autopep8_max_line_length=79
let g:autopep8_disable_show_diff=0

" make the search result show at quick fix window
set cscopequickfix=s-,c-,d-,i-,t-,e-,a-
" short cut to search the symbol and search the calling function
autocmd FileType c nnoremap <leader>s :call cscope#find('s', expand('<cword>'))<CR>
autocmd FileType c nnoremap <leader>c :call cscope#find('c', expand('<cword>'))<CR>

" in order for following to work, add ~/usr/go/bin to PATH
" as GoReferrers commands uses the tools in that path
" also please set the ~/usr/go  as GOROOT
" set GOPATH to the working directory
autocmd FileType go nnoremap <leader>s :GoReferrers<Enter>
autocmd FileType go nnoremap <leader>c :GoCallers<Enter>
" although I am using YCM to jump around so ctags not needed
"
" However for header file ycm has not knowledge on parsing, so we need ctags
" to do that, while ycm could read the ctags using following command
" Note that:
" Ctags needs to be called with the --fields=+l (that's a lowercase L, not a
" one) option because YCM needs the language:<lang> field in the tags output.

let g:ycm_collect_identifiers_from_tags_files = 1


" generates compile_commands.json which is needed by YCM
command! MakeCompileCommands :!./compile_cmd_gen.sh

" clear trailing white spaces
command! ClearTrainingWhite :%s/\s\+$//g

" run test
command! Run :!./runtest.sh
" make html

" I do not need to replease the extension name using sed
" command! MakeHtml !echo % | sed "s/.md/.html/g" | xargs multimarkdown -t html % -o
" Instead I could use %< which returns the file name without trailling
" extesion
command! MakeHtml !multimarkdown -t html % -o %<.html


" Now you can
" - use ^] to jump to tag under curso
" - use g^] for ambiguous tags
" - use ^t to jump back up the tag stack
" - use :tag to search a specific tag, * is supported


highlight Normal ctermfg=grey ctermbg=black
highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red

set hidden

set makeprg=./compile.sh\ $*

" NOW WE CAN:
" run :make to build
" :cl to list errors
" :cc# to jump to error by number
" :cn and :cp to navigate forward and back
" COOL

" replace tab to 4 spaces when pressing a tab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" ycm config
" for the ycm server to use python2 since it is compiled with Python 2

" let g:ycm_server_python_interpreter = '/usr/bin/python2'
" let g:ycm_path_to_python_interpreter = '/usr/bin/python2'

" replace ctags C-] with YcmCompleter GoTo
" I need to use the ctags as Ycm does not parse the header file well
" Since ycm only have information of .c files
" nnoremap <C-]> :YcmCompleter GoToImprecise<CR>
"
" 2018-4-11 I need to use ycm to jump with Python code
autocmd FileType python nnoremap <C-]> :YcmCompleter GoToDefinition<CR>
"autocmd FileType c unmap <C-]>


" ycm tips:
" How to debug Ycm
" :YcmDebugInfo: find the log and check the log to see if there is any error.
" For a full installation
" Refer to
" https://github.com/Valloric/YouCompleteMe#full-installation-guide
" carefully
" Bear is compiled and installed for generating compilation database
" in json formate. it is suggested to have the compile_command.json
" in the directly

" Installation of Bear
" using following command line to install to home directory instead of
" system directory.
" cmake ../Bear -DCMAKE_INSTALL_PREFIX=~/usr
"
" using following command line to designate the libear.so file
"  bear -l ~/usr/lib64/libear.so  make -j12 PLATFORM=native wss_svr_image2/test

" clang_complete setting
" tried, but not as good as YCM
" let g:clang_library_path='/usr/lib64/libclang.so.4.0'

" resolve NERDTree bad characters issue
set encoding=utf-8

"short key to switch in splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Sorry you can not use C-[ as it has same effect of Esc
" nnoremap <C-[> <C-t>
" automaticaly launch NERDTree, this is not needed since we have
" <leader>v and <leader>f
" auto VimEnter * NERDTree
" auto VimEnter * MarkLoad

" resize window width
"
map <esc>[20~ <F9>
map <esc>[21~ <F10>

noremap <F9> <C-W><
noremap <F10> <C-W>>
" ignore .o and .d files
let NERDTreeIgnore = ['\.o','\.d','\.a','\.swp']

" turn on spell when needed in command line
" setlocal spell spelllang=en_us
" or to turn on:
" set spell
" or to turn off:
" set nospell
"
" zg to add the word under the cursor to wordlist
" zw to make the word as a wrong (bad) word
" z= to have a list to correct the word under cursor

" show the line under cursor
" set cursorline

" <cword> will be replaced with the word under cursor
nnoremap <leader>q :silent grep <cword> . <bar> :copen

nnoremap <leader>p :cd %:p:h
" this is important to show the correct characters in vim powerline
let g:airline_powerline_fonts = 1

" set the ycm syntax error highlight color
" hi YcmErrorLine ctermbg=magenta ctermfg=white

" highlight on the line
hi clear YcmErrorLine
" gutter sign
hi YcmErrorSign ctermbg=DarkRed
" highligh on the error words
hi YcmErrorSection ctermbg=DarkRed



" now you could select text in Virtual mode and press gq to format (wrap)
" lines.

" tips:
" - gf go to the file under cusor using gf command
" - ctrl-^ to go back to previous file
"  about is using Ctrl - ] to follow a tag, and Ctrl - o to go back.
"
"  For what it's worth, Ctrl - i goes forward again. So for example, you might
"  gg to the top of a document, hit Ctrl - o (bringing you back to where you
"   motions, and hit enter to run the command under cursor.
"   Incidentally, you can also access your search history using q/ or q?.
"
" - q/ to view history of / command
" :wa     write all changed files (save all changes), and keep working
" :xa     exit all (save all changes and close Vim)
" :qa     quit all (close Vim, but not if there are unsaved changes)
" :qa!    quit all (close Vim without saving—discard any changes)

" Block Mode
"    - Select the lines you want to modify using Ctrl-v.
"    - Press:
"       I: Insert before what's selected.
"       A: Append after what's selected.
"       c: Replace what's selected.
"    - Type the new text.
"    - Press Esc to apply the changes to all selected lines.

" copy a word to multiple location
" -  type `yiw` to copy the current word
" -  move cursor to a new location
" -  type `ciw<C-R>0<Esc> to change the word
"    here <C-R>0 means paste the register 0 value
"
" search and replace command
"  search entire file
"  %s//....
"  % is the range where you could use line number to indicate ranges
"  for exampe 8,10 s//..

" *               - search for word currently under cursor
" g*              - search for partial word under cursor
"                   (repeat with n)

" copy to system clipboard
" Use the register "+ to copy to the system clipboard (i.e. "+y instead of y).
"
" Switching to the console where the vim was launched
" CTRL-Z
" this will put the vim in background
" in console
" you could type
" fg
" to make the vim in foreground again

" In Insert mode, how to delete a word?
" ctrl-w   - erase word (insert mode
" ctrl-u   - erase line  .... or on command line)
"
" exchange the current character with next on
" xp

" replace the word under cursor in whole buffer
" - press * to search
" :%s//new value/gc  for substitue command, if patten is not specified, it will
" use the last searched on
"
" Using * (also <kMultiply>, <S-LeftMouse>) or # (also <S-RightMouse>) searches
" for the exact word at the cursor (searching for rain would not find rainbow).
"
"
" Use g* or g# if you don't want to search for the exact word.
"
" use gn command to replace the charactor, you could use search pattern to
" search for the text you want to replace then use cgn to change the first
" character then press . to repeat if we want to change the search pattern to
" upper case using gUgn
"
" watch the video
" http://vimcasts.org/episodes/operating-on-search-matches-using-gn/
"
"
" use \zs \ze to mark the group and replace only these text with new one
" :%s/test.\zscom/org/gc this will replace the "com" in "test.com" with "org"
"

" for debuging ycm
let g:ycm_keep_logfiles = 1
let g:ycm_log_level = 'debug'

set dictionary=/usr/share/dict/cracklib-small
" now you could use
" ctrl-x and ctrl-k  for word completion

" BTW, next/ previous word completion (similar word in current file)
" ctrl-N for next words
" ctrl-P for previous words
"
"

" set the foldmethod
" now you could use zM to fold all
" and zR to unfold all
" zA to toggle current
set foldmethod=syntax
set foldlevel=20

set efm-=%-GIn\ file\ included\ from\ %f:%l:%c:
set efm-=%-GIn\ file\ included\ from\ %f:%l:%c\,
set efm-=%-GIn\ file\ included\ from\ %f:%l:%c\\
set efm-=%-G%In\ file\ included\ from\ %f:%l:%c
set efm-=%-G%In\ file\ included\ from\ %%f:%l
set efm^=In\ file\ included\ from\ %f:%l:%c:
set efm^=In\ file\ included\ from\ %f:%l:%c\,
set efm^=In\ file\ included\ from\ %f:%l:%c
set efm^=In\ file\ included\ from\ %%f:%l


" searching when typing
set incsearch

" clang format setting
" a useful tool to understand the setting:
" https://clangformat.com/

let g:clang_format#style_options = {
            \ "UseTab" : " Never",
            \ "AlignTrailingComments" : "true",
            \ "Language" : "Cpp",
            \ "IndentWidth" : 4,
            \ "ColumnLimit" : 79,
            \ "BreakBeforeBraces" : "Allman",
            \ "IndentCaseLabels" : "false",
            \ "BinPackParameters" : "true",
            \ "BinPackArguments" : "true",
            \ "AllowAllParametersOfDeclarationOnNextLine" : "true",
            \ "AlignAfterOpenBracket" : "Align",
            \ "ExperimentalAutoDetectBinPacking"  : "true",
            \ "SortIncludes" : "false",
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AllowShortLoopsOnASingleLine" : "true",
            \ "PointerAlignment" : "Right",
            \ "DerivePointerAlignment" : "false",
                        \}


autocmd FileType c noremap <leader>z :ClangFormat<CR>
autocmd FileType python noremap <leader>z :Autopep8<CR>
autocmd FileType python :autocmd BufWritePre <buffer> :Autopep8

" Ultisnips short cut, this is important as the default value conflicts with
" YCM
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsSnippetsDir        = $HOME.'/.vim/UltiSnips/'
let g:UltiSnipsSnippetDirectories=["UltiSnips"]

set viminfo+=!

" make the tab completion like in bash
set wildmode=longest,list
set textwidth=79

highlight SpellBad ctermfg=009 ctermbg=011 guifg=#ff0000 guibg=#ffff00

" enable mouse wheel school
set mouse=a

tnoremap <Esc> <C-\><C-n>

tnoremap <esc>[A <up>
tnoremap <esc>[B <down>
tnoremap <esc>[D <left>
tnoremap <esc>[C <right>
let g:markdown_fold_style = 'nested'
let g:airline#extensions#tabline#enabled = 1

let g:slime_target = "tmux"
let g:slime_paste_file = tempname()

" using :SlimeConfig to configure which session:window.pane as target
" ":"     means current window, current pane (a reasonable default)
" ":i"    means the ith window, current pane
" ":i.j"  means the ith window, jth pane
" "h:i.j" means the tmux session where h is the session identifier
"        (either session name or number), the ith window and the jth pane
" "%i"    means i refers the pane's unique id

if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif


" for ianva/vim-youdao-translater
"
vnoremap <silent> <C-T> :<C-u>Ydv<CR>
nnoremap <silent> <C-T> :<C-u>Ydc<CR>
noremap <leader>yd :<C-u>Yde<CR>

" for ale linter plugin, we now know where the error comes from, as there might be multiple linter in system:
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" pandysong/cscope.vi
"

let g:cscope_use_quickfix=1
" If 'cscoperelative' is set, then in absence of a prefix given to cscope
" (prefix is the argument of -P option of cscope), basename of cscope.out
" location (usually the project root directory) will be used as the prefix to
" construct an absolute path. The default is off. Note: This option is only
" effective when cscope (cscopeprg) is initialized without a prefix path (-P).

" must not use this if we are using cscope.vim plugin, otherwise the directory would be wrong
" set csre

" resolve the delete key not working issue
" https://vi.stackexchange.com/questions/2162/why-doesnt-the-backspace-key-work-in-insert-mode
set backspace=indent,eol,start
