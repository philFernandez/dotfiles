eval "$(/opt/homebrew/bin/brew shellenv)"

# Put Oracle JDK in path
path=("$HOME/SoftwarePackages/jdk-17.0.1.jdk/Contents/Home/bin" $~path)
# Add homebrew installed "man" because the native one throws errors because of wrong CPU archetecture 
path=("/opt/homebrew/opt/man-db/libexec/bin" $~path)


