# `tmux_vim_zsh_config`

Tmux Vim Zsh Setup for my development environment.

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

## shell feature

### edit command line in vim

press ESC and then press v to enter vim to edit the current line
