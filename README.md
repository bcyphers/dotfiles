.files
========

Installation
--------

    git clone https://github.com/bcyphers/dotfiles.git ~/.dotfiles

Initialization:
--------

    cd ~/.dotfiles
    ./configure install
    source ~/.bash_profile


Remove old backups
--------
    cd ~/.dotfiles
    ./configure clean


Update from current environment
--------
    cd ~/.dotfiles
    ./configure pull

Add plugins
--------

    git submodule add [link_to_git_repository.git] vim/bundle[plugin_name]
    git add .
    git commit -m "Installed [plugin_name] as a submodule."

    TODO: this can be automated
