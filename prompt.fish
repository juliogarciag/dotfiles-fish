. ~/dev/dotfiles/fish/ext/z.fish
. ~/dev/dotfiles/fish/ext/git_prompt.fish

# Prompt
set normal (set_color normal)
set magenta (set_color magenta)
set yellow (set_color yellow)
set green (set_color green)
set gray (set_color -o black)

function fish_prompt
  # add to z database
  z --add "$PWD"

  # pwd
  set_color bbb --bold
  printf '%s' (prompt_pwd)

  # git
  set_color yellow -o
  __git_prompt
  set_color yellow -o

  switch $USER
     case root toor; set prompt_symbol '#'
     case '*';  set prompt_symbol '$'
   end

  printf ' '
  printf $prompt_symbol
  printf ' '
  set_color normal
end
