set PATH "$DEV/dotfiles/fish/bin" $PATH
set PATH "/usr/local/bin" $PATH
if [ -f "/usr/local/opt/gnu-tar/libexec/gnubin" ]
  set PATH "/usr/local/opt/gnu-tar/libexec/gnubin" $PATH
end
set PATH "/System/Library/Frameworks" $PATH
if [ -f $POSTGRES_PATH ]
  set PATH $POSTGRES_PATH $PATH
end
if [ -n "$JAVA_HOME" ]
  set PATH $JAVA_HOME/bin $PATH
end
