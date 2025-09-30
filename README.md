# `tmux_vim_zsh_config`

Tmux Vim Zsh Setup for my development environment.

## after cloning this repo

```
ln tmux_vim_zsh_config/.tmux.conf ./
ln tmux_vim_zsh_config/.vimrc ./
```

install tmux (if not yet)

install zsh (if not yet)

```
sudo apt install zsh
```

Refer to: https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH

install oh-my-zsh
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Refer to : https://ohmyz.sh/#install

Install vundle:
```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

In VIM:

```
:PlugInstall
```

Install cscope

```
sudo apt install cscope
```

in vim, install Plugins

```
:PluginInstall
```

Install nodejs, refer to: https://nodejs.org/en/download/

Install coc vim:
```
cd .vim/bundle/coc.nvim
npm ci
```

Now reopen vim, it will automatically install coc.nvim related plugins.

in .zshrc add following to enable vi mode in ZSH:
```
bindkey -v
```
# install Tmux related

clone the theme package:
```
git clone  git@github.com:jimeh/tmux-themepack.git~/.tmux-themepack
```

## Tmux feature

### default shell

default shell is set to zsh

### reloading tmux config

C-n r  : reload tmux config

###  create pane

C-n s
C-n v


### move around panes

### if vim is not active

One could use the same vim binding to move around

C-h
C-j
C-k
C-l

### if vim is active

using the key binding to move around:

C-n h
C-n j
C-n k
C-n l

### resize the pane


### if vim is not active

C-n J
C-n K
C-n H
C-n L


## Vim feature

### buffer management

:Unite buffer

### git

show the diff for the current file:

:Gdiff

Show current status:

:Gstatus

:G<tab> for more commands

### swap two text

press 'cxiw' on one word then press 'cxiw' or '.' on another word

http://vimcasts.org/episodes/swapping-two-regions-of-text-with-exchange-vim/


### Text folding

:help(za) for help

### markdown (support folding)


### clang-format

-C
-C++
-Objective-C
-JavaScript
-Java
-TypeScript
-Protobuf

### Snippet
https://github.com/SirVer/ultisnips
https://github.com/honza/vim-snippets

Example

type 'if'
select one of the snipper and then press C-j



### automatic closing of quotes, parenthesis, brackets

by plugin `Raimondi/delimitMate`


### Asyncrun

This could be compiled with compile script to do asynchronizely compile.


### vim-bookmark

using mm to add/remove bookmark
      mi add/edit/remove annotation at current line
      mn jumpt to next bookmark
      mp previous bookmark
      ma show all bookmarks
      mc clear bookmarks in current buffer only
      mx clear bookmark in all buffers

### indent guide

show indent in different color

:IdentGuidlesEnable
:IdentGuidlesDisable
:IdentGuidlesToggle

### vim go for supporting golang

### code lint

Using `w0rp/ale`


Install tools in the following page for specific language:
https://github.com/w0rp/ale

And it just works automatically.


### code search

searching all c code from current working directory:
:Ack --cc yourkeyword

using :ss<space>

This is abbreviation of following command

```
:AsyncRun! ag --vimgrep <cword>
```

you may add more options to the command line, e.g., search only C file
```
:AsyncRun! ag --cc --vimgrep <cword>
```

### copy to wclip

If we are working from remote ssh, wclip could transfer the content to the host clipboard.

### make

change compile.sh in the .vimrc  `set makeprg = ./compile.sh\ $*`

:make to build
:cl to list errors
:cc# to jump to error by number
:cn and :cp to navigate forward and back

### NERDTree

<leader>f  to open or close NERDTree
<leader>v  to locate the current file in NERDTree


Edit following line to ignore specific file type:

```
let NERDTreeIgnore = ['\.o','\.d','\.a','\.swp']
```

### enable or disable spell checking

:set spell
:set nospell

zg to add the word under the cursor to wordlist
zw to make the word as a wrong (bad) word
z= to have a list to correct the word under cursor

### always read the manual of vim

```
4. Operating on the Visual area				*visual-operators*

The operators that can be used are:
	~	switch case					|v_~|
	d	delete						|v_d|
	c	change (4)					|v_c|
	y	yank						|v_y|
	>	shift right (4)					|v_>|
	<	shift left (4)					|v_<|
	!	filter through external command (1)		|v_!|
	=	filter through 'equalprg' option command (1)	|v_=|
	gq	format lines to 'textwidth' length (1)		|v_gq|

The objects that can be used are:
	aw	a word (with white space)			|v_aw|
	iw	inner word					|v_iw|
	aW	a WORD (with white space)			|v_aW|
	iW	inner WORD					|v_iW|
	as	a sentence (with white space)			|v_as|
	is	inner sentence					|v_is|
	ap	a paragraph (with white space)			|v_ap|
	ip	inner paragraph					|v_ip|
	ab	a () block (with parenthesis)			|v_ab|
	ib	inner () block					|v_ib|
	aB	a {} block (with braces)			|v_aB|
	iB	inner {} block					|v_iB|
	at	a <tag> </tag> block (with tags)		|v_at|
	it	inner <tag> </tag> block			|v_it|
	a<	a <> block (with <>)				|v_a<|
	i<	inner <> block					|v_i<|
	a[	a [] block (with [])				|v_a[|
	i[	inner [] block					|v_i[|
	a"	a double quoted string (with quotes)		|v_aquote|
	i"	inner double quoted string			|v_iquote|
	a'	a single quoted string (with quotes)		|v_a'|
	i'	inner simple quoted string			|v_i'|
	a`	a string in backticks (with backticks)		|v_a`|
	i`	inner string in backticks			|v_i`|

Additionally the following commands can be used:
	:	start Ex command for highlighted lines (1)	|v_:|
	r	change (4)					|v_r|
	s	change						|v_s|
	C	change (2)(4)					|v_C|
	S	change (2)					|v_S|
	R	change (2)					|v_R|
	x	delete						|v_x|
	D	delete (3)					|v_D|
	X	delete (2)					|v_X|
	Y	yank (2)					|v_Y|
	p	put						|v_p|
	J	join (1)					|v_J|
	U	make uppercase					|v_U|
	u	make lowercase					|v_u|
	^]	find tag					|v_CTRL-]|
	I	block insert					|v_b_I|
	A	block append					|v_b_A|

(1): Always whole lines, see |:visual_example|.
(2): Whole lines when not using CTRL-V.
(3): Whole lines when not using CTRL-V, delete until the end of the line when
     using CTRL-V.
(4): When using CTRL-V operates on the block only.

```

### translation

using C-t for translation for the word under the cursor or for the paragraph of selection.

### YCMCompleter

add file on the any directory the file path will go to the top directory:

".ycm_extra_conf.py"

```
def Settings(**kwargs):
    return {
        'flags': ['-x', 'c', '-Wall', '-Wextra', '-Werror'],
    }
```

### view pdf in vim

The plugin "https://github.com/makerj/vim-pdf" make the vim pdf viewer.

It uses `pdftotext` to convert the pdf to text.

In OSX, we need to compile and install pdftotext manually:

download from:
https://www.xpdfreader.com/pdftotext-man.html

```bash
mkdir build
cd build
cmake ../
make
make install
sudo make install
```

using following command to view pdf

```bash
vim some.pdf
```

### devdocs

:Devdocs [query]

Refer to https://github.com/rhysd/devdocs.vim

### slime for REPL

Send to a tmux pane

```
":"     means current window, current pane (a reasonable default)
":i"    means the ith window, current pane
":i.j"  means the ith window, jth pane
"h:i.j" means the tmux session where h is the session identifier
        (either session name or number), the ith window and the jth pane
"%i"    means i refers the pane's unique id
```

Refer to `https://github.com/jpalardy/vim-slime`


### vim-gitgutter

Show the git information (where the line is added or removed or changed on a gutter in Vim).

## shell feature

### edit command line in vim

press ESC and then press v to enter vim to edit the current line
