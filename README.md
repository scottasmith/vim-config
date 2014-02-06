= vim-config =

Vim plugins and settings i use

Thanks to Drew Neil for getting started [this vimcast]((http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen))

= Installation =

1. Make sure ruby and vim-nox are installed (vim with ruby support is required for the Command-T plugin)

```
sudo apt-get install ruby-full vim-nox
```

2. Clone this repo into ~/.vim

```
git clone https://github.com/smitherz82/vim-config.git ~/.vim
```

3. Create symlink for the vimrc file

```
ln -s ~/.vim/vimrc ~/.vimrc
```

4. Initialise the plugin submodules

```
cd ~/.vim
git submodule update --init
```

= vimrc =

For the persistant undo to work, the ~/.vim-undo directory must be created

= Plugins =

Update all plugins

```
git submodule foreach git pull origin master
```

== Pathogen ==

In addition to being git submodules, all plugins are installed as bundles and managed using Pathogen, including Pathogen itself. A symlink is used in the autoload directory to ensure Pathogen loads with vim and brings in all the other plugins it manages.

== BufExplorer ==

BufExplorer provides quick and easy switching between open buffers.

== file-line ==

file-line allows you to open files in vim on a specific line with

```
vim path/to/file:lineNo
```

== Command-T ==

Command-T provides an extremely fast way to open files simply by typing characters that appear in their paths.

It requires ruby and vim with ruby support to be installed.

Whenever this plugin is installed or updated, it must be built using

```
cd ~/.vim/bundle/command-t/ruby/command-t
ruby extconf.rb
make
```

== tabular ==

tabular automatically aligns text (e.g. aligning equals)

To align equals, simply place the cursor somewhere in the block of text you want to align and use the command:

```
:Tabularize /=
```
