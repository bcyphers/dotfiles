#! /bin/bash

die () {
    echo -e >&2 "$@"
    exit 1
}

_done() {
  printf "...done\n\n"
}

# Define a timestamp function
timestamp() {
  date +"%T"
}

backup() {
  src=$1
  dst=$2
  if [ -e $dst ]; then
    name="$dst-`timestamp`-bak"
    echo "Saving old $dst as $name"
    mv $dst $name
  fi
  cp -R $src $dst
}

install() {
  echo "Starting installation..."
  echo "Installing common python packages."
  sudo pip install -r requirements.txt
  _done

  echo "Initializing submodules"
  git submodule update --init --recursive
  _done

  mkdir ~/.config

  echo "Copying vim, screen, and bash settings."
  backup vim/ ~/.vim
  backup vim/vimrc ~/.vimrc
  backup screenrc ~/.screenrc
  backup bash_profile ~/.bash_profile
  backup flake8.config ~/.config/flake8
  _done
}

clean() {
  echo "Cleaing old files..."
  files="~/.vim ~/.vimrc ~/.screenrc ~/.bash_profile ~/.config/flake8"
  for f in $files;
  do
    name=$f-*-bak
    echo "Removing $name"
    eval rm -rf $name
  done
}

usage() {
  echo "Usage: ./init.sh [install|clean]"
}

[ "$#" -eq 1 ] || die "`usage`\n1 argument required, $# provided"

if [ "$1"  == "install" ]; then
    install
elif [ "$1" ==  "clean" ]; then
    clean
else
  usage
fi
