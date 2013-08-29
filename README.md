# DotFiles (Fish)

A set of environment variables, functions and aliases for the Fish shell. Nothing here will gonna work for bash or zsh :D

## Instalation

- Install Fish
- Clone this folder in somewhere (in my case is in ~/dev)
- Go to ~/.config/fish/config.fish
- Add the next line to that file: `. ~/dev/dotfiles/fish/profile.fish⏎`
- Save it

## Some Troubleshooting
- What the command `z` does to jump magically to some places is record them in a mini database each time the prompt changes. Because of this, this line in `prompt.fish`: https://github.com/juliogarciag/dotfiles/blob/master/fish/prompt.fish#L23 should be included in your prompt variable always to allow `z` to work.
- If you don't have mercurial or your mercurial is printing the help each time is called, remove the following line from the `prompt.fish` file: https://github.com/juliogarciag/dotfiles/blob/master/fish/prompt.fish#L31. You will lose the tracking messages for mercurial but if you don't use mercurial is just ok.
