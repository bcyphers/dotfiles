[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# OPAM configuration
. /home/bcyphers/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

# Amazon EC2 environmental variables
export JAVA_HOME="/usr/lib/jvm/java-7-openjdk-amd64/jre"
export EC2_USER="922607788343"
export EC2_ACCESS="AKIAJERWPOGXCXA6TXXQ"
export EC2_ACCESS_SECRET="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"
export EC2_CERT="/home/bcyphers/dev/ec2/cert.pem"
export EC2_PRIVATE_KEY="/home/bcyphers/dev/ec2/pk.pem"

# init OPAM
eval `opam config env`
