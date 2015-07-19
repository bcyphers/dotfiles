# Load the default .profile and .bashrc
if [ -r $HOME/.profile ]; then
   . $HOME/.profile
fi

if [ -r $HOME/.bashrc ]; then
   . $HOME/.bashrc
fi

# Load the bashrc every time
if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 
