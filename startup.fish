rbenv rehash >/dev/null ^&1
status --is-interactive; and . (nodenv init -|psub)

if [ -f $SECRET_FISH ]
  source $SECRET_FISH
else
  touch $SECRET_FISH
  source $SECRET_FISH
end

mkdir -p $PROJECT_DIR
