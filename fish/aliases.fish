function get_home
  echo ~
end

function .. -d ".."
  cd ..
end

alias l="ls -lah"
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
alias pryrails="pry -r ./config/environment"

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

function url_final_part -d "get the final part of a string separated by /"
  set str_parts (echo $argv[1] | sed 's/\//\ /g')
  eval "set parts $str_parts"
  echo $parts[-1..-1]
end

function download -d "download a file in the current dir from the url $1"
  curl -o (url_final_part $argv[1]) $argv[1]
end

function get_jquery -d "jquery"
  download http://code.jquery.com/jquery.min.js
end

function get_underscore -d "underscore.js"
  download http://underscorejs.org/underscore.js
end

function get_backbone -d "backbone.js"
  download http://documentcloud.github.io/backbone/backbone.js
end

function get_es5 -d "es5shims.js"
  download https://raw.github.com/kriskowal/es5-shim/master/es5-shim.min.js
end

function get_normalize -d "normalize.css"
  download http://necolas.github.io/normalize.css/2.1.2/normalize.css
end

# Finder
function finder -d "open in Finder"
  open -a 'Finder' $argv[1]
end

# Photoshop
function photoshop -d "open in photoshop"
  open -a 'Adobe Photoshop CS6' $argv[1]
end

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
  download https://gist.github.com/raw/4282518/cfd102d2a09df9e6cbeb472efaa6af97496eaf14/config.ru
  rackup config.ru
end

alias getpuzzlenode="~/dev/projects/ruby/getpuzzlenode/getpuzzlenode.rb"
alias rdb="bundle exec rake db:migrate"
alias rdba="bundle exec rake db:migrate; env RAILS_ENV=test bundle exec rake db:migrate"

function mvim -d "open a file with MacVim"
  open -a "MacVim" $argv[1]
end

alias emacs="/usr/local/Cellar/emacs/24.1/Emacs.app/Contents/MacOS/Emacs -nw"

alias py="python"
alias bzmanage="python project/manage.py"
alias bzenv=". env/bin/activate.fish"

function localhost -d "open localhost in a given port"
  open "http://localhost:$argv[1]"
end

function lt -d "open LightTable"
  open -a "/Applications/LightTable.app/" $argv[1]
end

function openrepo -d "open a repository location in github using the name of the remote"
  set repo (getrepo $argv[1])
  if [ $repo ]
    open $repo
  end
end

function getrepo -d "get url of this current repository in github based in the remote name"
  if [ (count $argv) -lt 1 ]
    set expected_remote_name origin
  else
    set expected_remote_name $argv[1]
  end
  
  set remotes (git remote -v)
  
  for remote in $remotes
    set remote_data_string (echo $remote | sed 's/\s+/ /g' | sed 's/(/ /g' | sed 's/)/ /g')
    eval "set remote_data $remote_data_string"
    set remote_name $remote_data[1]
    
    if [ $expected_remote_name = $remote_name ]
      set remote_address $remote_data[2]
            
      set http_part (echo $remote_address | grep -E "http:\/\/|https:\/\/")
      set github_http_part (echo $remote_address | grep -e "@github")
      
      if [ $http_part ]
        echo $remote_address
      else
        if [ $github_http_part ]
          echo (github_web_from_git_address $remote_address)
        end
      end
      
      break
    end
  end
  
end

function github_web_from_git_address -d "transforms a github git address to a https url"
  set address_parts_string (echo $argv[1] | sed 's/:/ /g')
  eval "set address_parts $address_parts_string"
  set repo_data $address_parts[2]
  
  set repo_parts_string (echo $repo_data | sed 's/\// /g')
  eval "set repo_parts $repo_parts_string"
  
  set username $repo_parts[1]
  set reponame_with_extension $repo_parts[2]
  
  set reponame_parts_string (echo $reponame_with_extension | sed 's/\./ /g')
  eval "set reponame_parts $reponame_parts_string"
  set reponame $reponame_parts[1]
  
  printf "https://github.com/%s/%s" $username $reponame
end

