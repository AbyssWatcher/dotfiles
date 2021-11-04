# Environment Variables

# NVM (Node.js) (/home/austin/.nvm/versions/node/<version_number>/bin)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Go (/usr/local/go/bin AND /home/austin/go/bin)
export GOPATH=$(go env GOPATH)
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN
# export PATH=$PATH:/usr/local/go/bin # Adding Go to PATH.
# export GOPATH=$HOME/go
# export GOBIN=$GOPATH/bin
# export PATH=$PATH:$GOPATH/bin

# Elixir (/usr/lib/elixir/bin)
export PATH=$PATH:/usr/lib/elixir/bin # Adding Elixir to PATH.

# Python (home/austin/.local/bin)

# Rust (/home/austin/.cargo/bin)
. "$HOME/.cargo/env"

# SDKMAN (JVM languages + tools)
# Scala (/home/austin/.sdkman/candidates/scala/current/bin)
# Maven (/home/austin/.sdkman/candidates/maven/current/bin)
# Kotlin (/home/austin/.sdkman/candidates/kotlin/current/bin)
# Java (/home/austin/.sdkman/candidates/java/current/bin)
# Gradle: (home/austin/.sdkman/candidates/gradle/current/bin)
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
