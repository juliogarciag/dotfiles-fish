# Local Bin
set PATH "/usr/local/bin:/usr/local/sbin" $PATH

set PATH "/usr/local/mysql/bin" $PATH
set PATH "/opt/nginx/sbin" $PATH
set PATH "/opt/local/bin" $PATH
set PATH "/opt/local/sbin" $PATH
set PATH "/usr/local/opt/gnu-tar/libexec/gnubin" $PATH
set PATH "$HOME/.nodenv/bin" $PATH
set PATH "$HOME/.rbenv/bin" $PATH
set PATH "$HOME/.rbenv/shims" $PATH

# Rehash rbenv to get the latest rubies installed
rbenv rehash >/dev/null ^&1

# Noenv
status --is-interactive; and . (nodenv init -|psub)

# MySQL
set MYSQL "/usr/local/mysql/bin"
set PATH $MYSQL $PATH
set DYLD_LIBRARY_PATH "/usr/local/mysql/lib" $DYLD_LIBRARY_PATH

# Cocoa Bins
set PATH "/System/Library/Frameworks" $PATH

# Postgres Bins
set PATH "/Applications/Postgres.app/Contents/Versions/9.3/bin" $PATH

# Java
set -x JAVA_HOME (/usr/libexec/java_home)
set PATH $JAVA_HOME/bin $PATH

set fish_greeting ""
set fish_color_cwd "bbbbbb"
