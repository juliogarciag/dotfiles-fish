set -x EDITOR vim
set -x VISUAL_EDITOR subl
set -x DEV $HOME/dev
set -x DOWNLOAD_LOCATION $HOME/Downloads
set -x PROJECT_DIR $DEV/projects
set -x PRACTICE_DIR $DEV/practice
set -x GIT_EMAIL "julioggonz@gmail.com"
set -x GIT_NAME "Julio García"

function bootstrap_dev -d "bootstrap the ~/dev folder"
  mkdir -p "$PROJECT_DIR"
  for folder in 'ruby' 'js' 'python'
    mkdir -p "$PROJECT_DIR/$folder"
  end
  mkdir -p "$PRACTICE_DIR"
  for folder in 'ruby' 'java' 'c'
    mkdir -p "$PRACTICE_DIR/$folder"
  end
end

function e -d "the editor of choice. Edit on demand with ealias"
  eval $VISUAL_EDITOR $argv
end

function dotfiles -d "The dotfiles location"
  echo $DEV/dotfiles
end

function ez -d "find a folder with z and open the first result in an editor"
  z $argv
  e .
  cd -
end

function .. -d ".."
  cd ..
end

function md -d "edit a markdown file in an aplication"
  open -a "Marked 2" $argv[1]
end

function rm -d "remove a file interactively"
  command rm -i $argv
end

function rm! -d "remove a file"
  command rm $argv
end

function readme -d "edit a README.md. If it doesn't exists, creates it"
  if not [ -f README.md ]
    touch README.md
  end
  md README.md
end

function l -d "ls -lah, show all the files in a folder, with additional information"
  ls -lah $argv
end

function join_array -d "join strings(\$argv[2..-1]) with a separator(\$argv[1])"
  set separator $argv[1]
  set args $argv[2..-1]

  if [ (count $args) -lt 2 ]
    echo $args[1]
  else
    echo $args[1]$separator(join_array $separator $args[2..-1])
  end
end

function cd_in_parts -d "go to a folder or something inside it"
  cd (join_array "/" $argv)
end

function cdp -d "go to the projects folder or something inside them"
  cd_in_parts $PROJECT_DIR $argv
end

function cdev -d "go to something inside $DEV or to $DEV directly"
  cd_in_parts $DEV $argv
end

function lsp -d "list projects in an optional subfolder of $DEV/projects"
  if [ (count $argv) -lt 1 ]
    ls $DEV/projects
  else
    ls $DEV/projects/$argv[1]
  end
end

function cdd
  # edit for your OS
  cd $DOWNLOAD_LOCATION
end

function cdotfiles -d "navigate (cd) to dotfiles"
  cd (dotfiles)
end

function reload! -d "reload functions and env"
  . $DEV/dotfiles/fish/functions.fish
  . $DEV/dotfiles/fish/env.fish
end

function edotfiles -d "Open the dotfiles folder in an editor (e)"
  e (dotfiles)
end

function epath -d "Open the path file (env.fish) with an editor (e)"
  e $DEV/dotfiles/fish/env.fish
end

function efunctions -d "Open the functions file (functions.fish) with an editor (e)"
  e $DEV/dotfiles/fish/functions.fish
end

function eprompt -d "Open the prompt file (prompt.fish) with an editor (e)"
  e $DEV/dotfiles/fish/prompt.fish
end

function esshconfig -d "Open the ~/.ssh/config file with an editor (e)"
  e $HOME/.ssh/config
end

function patremove -d "Remove all files with a given pattern"
  find . -name $argv[1] -type f -delete
end

function extremove -d "Remove all files with a given extension"
  patremove "*.$args[1]"
end

function mkcd
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

# Hightlight
function ccat -d "colored cat"
  highlight -O ansi $argv
end

# CTags
function ctags -d "true ctags"
  if [ -f /usr/local/bin/ctags ]
    /usr/local/bin/ctags $argv
  else
    echo "To use true ctags, please install with HomeBrew: brew install ctags"
  end
end

# Ruby
function b -d "bundle exec"
  bundle exec $argv
end

function bi -d "bundle install"
  bundle install $argv
end

function bu -d "bundle update"
  bundle update $argv
end

function gemi -d "gem install without docs"
  gem install --no-rdoc --no-ri
end

function guard -d "bundle exec guard"
  bundle exec guard
end

function rake -d "bundle exec rake"
  bundle exec rake $argv
end

# Git
function gac -d "git: add and commit with a message"
  git add -A
  git commit -m $argv[1]
end

function gacp -d "git: add, commit and push with a message"
  gac $argv[1]
  git push
end

function push -d "git push"
  git push $argv
end

function pull -d "git pull"
  git pull $argv
end

function rebase-to -d "git rebase this branch into another"
  set original (git branch | grep '*' | awk '{print $2}')
  gc $argv[1]
  git rebase $original
  gc $original
end

function gc -d "git checkout"
  git checkout $argv
end

function gs -d "git status"
  git status $argv
end

function glog -d "git log"
  git log $argv
end

function reflog -d "git reflog"
  git reflog $argv
end

function merge -d "git merge"
  git merge $argv
end

function commit -d "git commit -m"
  git commit -m $argv
end

function configme -d "config me in a git repository"
  git config user.email $GIT_EMAIL
  git config user.name $GIT_NAME
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

# Finder (OS X specific)
function finder -d "open in your file browser (Finder)"
  open -a 'Finder' $argv[1]
end

# Nautilus (Linux with Nautilus specific)
function nautilus -d "open in your file browser (Nautilus)"
  nautilus $argv
end

# Simulate Slow Connection
function makeslow
  sudo ipfw pipe 1 config bw 2500Kbit/s delay 30ms
  sudo ipfw add 1 pipe 1 src-port 80
  sudo ipfw add 2 pipe 1 dst-port 80
end

# Restore Normal Connection Speed
function makefast
  sudo ipfw delete 1
  sudo ipfw delete 2
end

# Browsers (OS X specific)
function safari -d "open in Safari"
  open -a "Safari" $argv[1]
end

function chrome -d "open in Chrome"
  open -a "Google Chrome" $argv[1]
end

# Lazyness
function py
  python $argv
end

function rb
  ruby $argv
end

function localhost -d "open localhost in a given port"
  open "http://localhost:$argv[1]"
end

function lt -d "open LightTable"
  open -a "/Applications/LightTable.app/" $argv[1]
end
