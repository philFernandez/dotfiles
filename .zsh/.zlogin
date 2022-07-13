eval "$(/opt/homebrew/bin/brew shellenv)"

# Put Oracle JDK in path
#path=("$HOME/SoftwarePackages/jdk-17.0.1.jdk/Contents/Home/bin" $~path)
path=("$HOME/.bin" $~path)
path=("$HOME/go/bin" $~path)
path=("/Applications/Racket v8.4/bin" $~path)
path=("." $~path)
