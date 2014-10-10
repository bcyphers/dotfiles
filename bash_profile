# Load the default .profile
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" 

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 

# OPAM configuration
. /home/bcyphers/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

# Load ec2 keys into memory
source "$HOME/.ec2_vars"

# init OPAM
eval `opam config env`

# fancy prompt
export PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\e[0;92m\]\u@\h \[\e[0;94m\][ \[\e[1;94m\]\w \[\e[0;94m\]]\n\[\e[0;37m\]\$\[\e[0;37m\] "
