function e -d "the editor of choice. Edit on demand with VISUAL_EDITOR env variable"
  eval $VISUAL_EDITOR $argv
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
  open -a $MARKDOWN_EDITOR $argv[1]
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

function cdp -d "go to the projects folder or something inside them"
  cd "$PROJECT_DIR/$argv"
end

function cdev -d "go to something inside $DEV or to $DEV directly"
  cd "$DEV/$argv"
end

function lsp -d "list projects in an optional subfolder of $DEV/projects"
  ls "$DEV/projects/$argv"
end

function cdd
  cd $DOWNLOAD_LOCATION
end

function reload -d "reload profile"
  source $DOTFILES/fish/profile.fish
end

function edotfiles -d "Open the dotfiles folder in an editor (e)"
  e "$DOTFILES/$argv"
end

function epath -d "Open the path file (path.fish) with an editor (e)"
  e "$DOTFILES/fish/path.fish"
end

function efunctions -d "Open the functions file (functions.fish) with an editor (e)"
  e $DOTFILES/fish/functions.fish
end

function eprompt -d "Open the prompt file (prompt.fish) with an editor (e)"
  e $DOTFILES/fish/prompt.fish
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

function ctags -d "true ctags"
  if [ -f /usr/local/bin/ctags ]
    /usr/local/bin/ctags $argv
  else
    echo "To use true ctags, please install with HomeBrew: brew install ctags"
  end
end

function guard -d "bundle exec guard"
  bundle exec guard
end

function rake -d "bundle exec rake"
  bundle exec rake $argv
end

function gac -d "git: add and commit with a message"
  git add -A
  git commit -m $argv[1]
end

function gacp -d "git: add, commit and push with a message"
  set branch (git branch | grep '*' | awk '{print $2}')
  gac $argv[1]
  git push -u origin $branch
end

function configme -d "config me in a git repository"
  git config --global user.email $GIT_EMAIL
  git config --global user.name $GIT_NAME
end

function url-final-part -d "get the final part of a string separated by /"
  echo (string split "/" $argv[1])[-1]
end

function download -d "download a file in the current dir from the url $1"
  curl -o (url-final-part $argv[1]) $argv[1]
end

function finder -d "open in your file browser (Finder)"
  open -a 'Finder' $argv[1]
end

function localhost -d "open localhost in a given port"
  open "http://localhost:$argv[1]"
end

function file-extension -d "get extension of a given file name"
  echo (string split . $argv[1])[-1]
end

function show-code -d "Show the code in a less-powered highlighted view"
  set filename $argv[1]
  set syntax (file-extension $argv[1])
  set format "xterm256"

  cat $filename | highlight --syntax=$syntax --out-format=$format | less -R
end

function install-fisher-plugins -d "Install Fisher plugins"
  fisher z tab choices
end
