if not [ -f ~/.config/fish/functions/fisher.fish ]
  set_color yellow --bold
  echo "Installing Fisher as it's not installed"
  set_color normal
  curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher
  set_color yellow --bold
  echo "Please run `install-fisher-plugins` to install plugins."
  set_color normal
end
