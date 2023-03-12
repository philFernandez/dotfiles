eval "$(/opt/homebrew/bin/brew shellenv)"

# Put Oracle JDK in path
#path=("$HOME/SoftwarePackages/jdk-17.0.1.jdk/Contents/Home/bin" $~path)
path=("$HOME/.bin" $~path)
path=("$HOME/go/bin" $~path)
path=("/usr/local/mysql/bin" $~path)
path=("/Applications/Racket v8.4/bin" $~path)
path=("$HOME/Library/Application Support/Code/User/globalStorage/ms-vscode-remote.remote-containers/cli-bin" $~path)
path=("." $~path)
