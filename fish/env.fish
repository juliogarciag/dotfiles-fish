# Local Bin
set PATH "/usr/local/bin:/usr/local/sbin" $PATH

# Rbenv bin and shims of the current ruby
set PATH $HOME/.rbenv/bin $PATH
set PATH $HOME/.rbenv/shims $PATH

# Rehash rbenv to get the latest rubies installed
rbenv rehash >/dev/null ^&1

set PATH "/usr/local/mysql/bin" $PATH
set PATH "/opt/nginx/sbin" $PATH
set PATH "/opt/local/bin" $PATH
set PATH "/opt/local/sbin" $PATH

# Custom Bins
set PATH "/Users/juliogarcia/bin" $PATH

# Coca Bins
set PATH "/System/Library/Frameworks" $PATH

# Postgres Bins
set PATH "/Applications/Postgres.app/Contents/MacOS/bin" $PATH

set fish_greeting ""
set fish_color_cwd "bbbbbb"
