. ~/dev/dotfiles/fish/ext/z.fish
. ~/dev/dotfiles/fish/ext/git_prompt.fish

# Prompt
set normal (set_color normal)
set magenta (set_color magenta)
set yellow (set_color yellow)
set green (set_color green)
set gray (set_color -o black)
set hg_promptstring "< on $magenta<branch>$normal>< at $yellow<tags|$normal, $yellow>$normal>$green<status|modified|unknown><update>$normal<
patches: <patches|join( → )|pre_applied($yellow)|post_applied($normal)|pre_unapplied($gray)|post_unapplied($normal)>>" 2>/dev/null

function hg_prompt
    hg prompt --angle-brackets $hg_promptstring 2>/dev/null
end

function prompt_pwd --description 'Print the current working directory, shortend to fit the prompt'
    echo $PWD | sed -e "s|^$HOME|~|"
end

function fish_prompt
  # add to z database
  z --add "$PWD"
  
  # pwd
  set_color $fish_color_cwd --bold
  printf '%s' (prompt_pwd)
  
  # mercurial
  set_color normal
  hg_prompt
  
  # git
  printf ' '
  __git_prompt
  set_color white -o
  
  # a colon :)
  printf ' : '
  set_color normal
end
