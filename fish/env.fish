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

# Cocoa Bins
set PATH "/System/Library/Frameworks" $PATH

# Postgres Bins
set PATH "/Applications/Postgres.app/Contents/MacOS/bin" $PATH

# Sublime Text Bins
set PATH "/Applications/Sublime Text.app/Contents/SharedSupport/bin" $PATH

# Play Bins
set PATH "/Users/juliogarcia/bin/play-2.1.2" $PATH

set fish_greeting ""
set fish_color_cwd "bbbbbb"

set -x SERVER_IP 192.168.1.9
set -x GOOGLE_CUSTOM_SEARCH_KEY "AIzaSyA5bBm5S3osGN0f8eQgRJu-qKrUf5OvusY"
set -x GOOGLE_CUSTOM_SEARCH_CX "009926135480036780929:8i5a-la835q"