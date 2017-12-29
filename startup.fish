# This is here just to fix rbenv setenv call
function setenv
  set -gx $argv
end

status --is-interactive; and . (rbenv init -|psub)

if [ -f $SECRET_FISH ]
  source $SECRET_FISH
else
  touch $SECRET_FISH
  source $SECRET_FISH
end

mkdir -p $PROJECT_DIR
