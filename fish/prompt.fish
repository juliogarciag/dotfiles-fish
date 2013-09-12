. ~/dev/dotfiles/fish/ext/z.fish
. ~/dev/dotfiles/fish/ext/git_prompt.fish

# Prompt
set normal (set_color normal)
set magenta (set_color magenta)
set yellow (set_color yellow)
set green (set_color green)
set gray (set_color -o black)

function prompt_pwd --description 'Print the current working directory, shortend to fit the prompt'
    echo $PWD | sed -e "s|^$HOME|~|"
end

function fish_prompt
  # add to z database
  z --add "$PWD"
  
  # pwd
  set_color $fish_color_cwd --bold
  printf '%s' (prompt_pwd)
  
  # git
  printf ' '
  __git_prompt
  set_color white -o
  
  # a colon :)
  printf ' : '
  set_color normal
end
