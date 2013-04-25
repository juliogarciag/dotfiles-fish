alias l="ls -lah"
alias ..="cd .."
alias cdp="cd ~/dev/projects"
alias cdd="cd ~/Downloads"

alias editor="mate"

alias reload=". ~/dev/dotfiles/fish/aliases.fish"
alias epath="editor ~/dev/dotfiles/bash/env"
alias ealias="editor ~/dev/dotfiles/fish/aliases.fish"

function touche
  touch $argv[1]
  editor $argv[1]
end

function patremove -d "Remove all files with a given pattern"
  find . -name $argv[1] -type f -delete
end

function extremove -d "Remove all files with a given extension"
  find . -name "*.$argv[1]" -type f -delete
end

function take
  mkdir $argv[1]
  cd $argv[1]
end

function ddos
  if [ (count $argv) -gt 1 ]
    set times $argv[2]
  else
    set times 1000
  end
  
	for i in (seq $times)
		curl "$argv[1]"
	end
end

function extract
  if [ -f $argv[1] ]
    switch $argv[1]
      case '*.tar.bz2'
        tar xjf $argv[1]
      case '*.tar.gz'
        tar xzf $argv[1]
      case '*.bz2'
        bunzip2 $argv[1]
      case '*.rar'
        rar x $argv[1]
      case '*.gz'
        gunzip $argv[1]
      case '*.tar'
        tar xf $argv[1]
      case '*.tbz2'
        tar xjf $argv[1]
      case '*.tgz'
        tar xzf $argv[1]
      case '*.zip'
        unzip $argv[1]
      case '*.Z'
        uncompress $argv[1]
      case '*'
        echo "'$argv[1]' cannot be extracted via extract()" ;;
    end
  else
    echo "'$argv[1]' is not a valid file"
  end
end

# Ruby
alias b="bundle exec"
alias bi="bundle install"
alias bu="bundle update"
alias rage="bundle exec rake"
alias gemi="gem install --no-rdoc --no-ri"
alias ru="rackup config.ru"

# Postgres
alias pg="/Library/PostgreSQL/9.1/scripts/runpsql.sh; exit"
alias pg_ctl="/Library/PostgreSQL/9.1/bin/pg_ctl"

# Trash
function trash -d "send a file to the trash"
  mv $argv[1] ~/.Trash
end

# Git

function gao -d "git: add, commit with a message and push to the default origin master"
  git add -A
  git commit -m $argv[1]
  git push
end

function gac -d "git: add and commit with a message"
  git add -A
  git commit -m $argv[1]
end

function gah -d "git: add, commit with a message and push to heroku master"
  git add -A
  git commit -m $argv[1]
  git push heroku master
end

# C
function gcrun
	gcc $argv[1]
	./a.out
end

# Redis
alias redisgo="redis-server /usr/local/etc/redis.conf"

# CouchDB
alias couch="~/dev/clones/build-couchdb/build/bin/couchdb"

# Get JS Libraries
alias jquery="curl -o jquery.js http://code.jquery.com/jquery.min.js"
alias underscore="curl -o underscore.js http://underscorejs.org/underscore.js"
alias backbone="curl -o backbone.js http://documentcloud.github.com/backbone/backbone.js"

# Finder
function finder -d "open in Finder"
  open -a 'Finder' $argv[1]
end

# Photoshop
function photoshop -d "open in photoshop"
  open -a 'Adobe Photoshop CS6' $argv[1]
end

# Pry in Rails
alias pryrails="pry -r ./config/environment"

# Simulate Slow Connection
function makeslow
  sudo ipfw pipe 1 config bw 2500Kbit/s delay 30ms
  sudo ipfw add 1 pipe 1 src-port 80
  sudo ipfw add 2 pipe 1 dst-port 80
end

# Return to Fast Connections
function makefast
  sudo ipfw delete 1
  sudo ipfw delete 2
end

# Navegadores
function safari -d "open in Safari"
  open -a "Safari" $argv[1]
end

function chrome -d "open in Chrome"
  open -a "Google Chrome" $argv[1]
end

function ra -d "rack: create and run a default rack server over a static folder"
  curl -o config.ru https://gist.github.com/raw/4282518/cfd102d2a09df9e6cbeb472efaa6af97496eaf14/config.ru
  rackup config.ru
end

alias getpuzzlenode="/Users/juliogarcia/dev/projects/ruby/getpuzzlenode/getpuzzlenode.rb"

alias rdb="bundle exec rake db:migrate"
alias rdba="bundle exec rake db:migrate; RAILS_ENV=test bundle exec rake db:migrate"

function mvim -d "open a file with MacVim"
  open -a "MacVim" $argv[1]
end

alias emacs="/usr/local/Cellar/emacs/24.1/Emacs.app/Contents/MacOS/Emacs -nw"

alias py="python"
alias bzmanage="python project/manage.py"
alias bzenv=". env/bin/activate.fish"

function openhost -d "open localhost in a given port"
  open "http://localhost:$argv[1]"
end