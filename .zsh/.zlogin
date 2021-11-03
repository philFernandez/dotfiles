eval "$(/opt/homebrew/bin/brew shellenv)"

# Put Oracle JDK in path
path=("$HOME/SoftwarePackages/jdk-17.0.1.jdk/Contents/Home/bin" $~path)
path=("$HOME/.bin" $~path)
