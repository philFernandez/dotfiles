###
# Python and rust things are also set (automatically) in ~/.zprofile
###

# Get rid of this if java 1.8 is needed
#path=("/usr/local/opt/openjdk/bin" $path)
path=("/Applications/Racket v7.6/bin" $~path)
path=("/usr/local/Cellar/llvm/*/bin" $~path)
path=("/Users/philthy/Documents/Software/latexindent" $~path)
path=("/Users/philthy/Documents/Software/apache-maven-3.6.3/bin" $~path)
path=("/Library/Frameworks/Python.framework/Versions/3.9/bin" $~path)
path=("/usr/local/mysql-8.0.22-macos10.15-x86_64/bin" $~path)
#path=("$HOME/.cargo/bin" $~path)
path=("$HOME/.bin" $~path)
path=("$HOME/.local/bin" $~path)  # pipx install executables here
path=("." $~path)

# The ~ in $~path does glob expansion so things with version number dirs can
# be replaced with * and still work after a version update

# export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_231.jdk/Contents/Home

