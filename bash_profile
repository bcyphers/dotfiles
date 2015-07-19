# Load the default .profile
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" 

# Load the bashrc every time
if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 

# OPAM configuration
#. /home/bcyphers/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

# init OPAM
#eval `opam config env`

# Load ec2 environment vars (keys)
#source "$HOME/.ec2_vars"
