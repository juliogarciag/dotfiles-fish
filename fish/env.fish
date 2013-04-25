set PATH "/usr/local/bin:/usr/local/sbin:$PATH"

set PATH $HOME/.rbenv/bin $PATH
set PATH $HOME/.rbenv/shims $PATH
rbenv rehash >/dev/null ^&1

set PATH /usr/local/mysql/bin:/opt/local/bin:/opt/local/sbin:~/bin:$PATH
set PATH "/Applications/Postgres.app/Contents/MacOS/bin:$PATH"

set fish_greeting ""