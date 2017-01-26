# pandakey (WIP)
Aim here is to write a text completion plugin, comparable in performance and quality to swiftkey on mobile, for Vim (and/or for Emacs, NeoVim). Similar to swiftkey, the auto-completions from this plugin are meant for general text, and not for code.

## Installation

Use your plugin manager of choice.

- [Pathogen](https://github.com/tpope/vim-pathogen)
  - `git clone https://github.com/sainathadapa/pandakey ~/.vim/bundle/pandakey`
- [Vundle](https://github.com/gmarik/vundle)
  - Add `Bundle 'https://github.com/sainathadapa/pandakey'` to .vimrc
  - Run `:BundleInstall`
- [NeoBundle](https://github.com/Shougo/neobundle.vim)
  - Add `NeoBundle 'https://github.com/sainathadapa/pandakey'` to .vimrc
  - Run `:NeoBundleInstall`
- [vim-plug](https://github.com/junegunn/vim-plug)
  - Add `Plug 'https://github.com/sainathadapa/pandakey'` to .vimrc
  - Run `:PlugInstall`

## People
- [Manoj Sukhavasi](https://github.com/manojsukhavasi)
- [Sainath Adapa](https://github.com/sainathadapa)

## Status/Version history
- 2017-01-26 : Moved to a server-client architecture
- 2017-01-21 : Trivial implementation of a static N-gram model based completion
- 2016-12-29 : Project created

## Resources (in no particular order)
- [Writing vim plugins in python](https://www.youtube.com/watch?v=vMAeYp8mX_M)
- help :complete-functions
- [vim-plugin-starter-kit wiki](https://github.com/JarrodCTaylor/vim-plugin-starter-kit/wiki)
- [YouCompleteMe - writing new semantic completers](https://github.com/Valloric/YouCompleteMe#writing-new-semantic-completers)
- [What's the difference between omnifunc and completefunc except the invocation key mapping?](http://stackoverflow.com/questions/6941842/whats-the-difference-between-omnifunc-and-completefunc-except-the-invocation-ke)
- [How to create my own autocomplete function](http://vi.stackexchange.com/questions/4584/how-to-create-my-own-autocomplete-function)
- [writing completefunc in python](http://stackoverflow.com/questions/18191874/writing-completefunc-in-python)

