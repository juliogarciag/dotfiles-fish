# Local Bin
set PATH "/usr/local/bin:/usr/local/sbin" $PATH

# Rbenv bin and shims of the current ruby
set PATH ~/.rbenv/bin $PATH
set PATH ~/.rbenv/shims $PATH

# Rehash rbenv to get the latest rubies installed
rbenv rehash >/dev/null ^&1

set PATH "/usr/local/mysql/bin" $PATH
set PATH "/opt/nginx/sbin" $PATH
set PATH "/opt/local/bin" $PATH
set PATH "/opt/local/sbin" $PATH

# MySQL
set MYSQL "/usr/local/mysql/bin"
set PATH $MYSQL $PATH
set DYLD_LIBRARY_PATH "/usr/local/mysql/lib" $DYLD_LIBRARY_PATH

# Custom Bins
set PATH "$HOME/bin" $PATH

# Cocoa Bins
set PATH "/System/Library/Frameworks" $PATH

# Postgres Bins
set PATH "/Applications/Postgres93.app/Contents/MacOS/bin" $PATH

# Sublime Text Bins
set PATH "/Applications/Sublime Text.app/Contents/SharedSupport/bin" $PATH

# Play Bins
set PATH "$HOME/bin/play-2.1.3" $PATH

# Random home binaries
set PATH "$HOME/bin" $PATH

# Neo4j
set PATH "$HOME/bin/neo4j/bin" $PATH

# Datomic
# set PATH "$HOME/bin/datomic/bin" $PATH

set fish_greeting ""
set fish_color_cwd "bbbbbb"

