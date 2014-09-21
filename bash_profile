[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# OPAM configuration
. /home/bcyphers/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

source "$HOME/.ec2_vars"

# init OPAM
eval `opam config env`
