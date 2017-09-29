set -x DYLD_LIBRARY_PATH "/usr/local/mysql/lib" $DYLD_LIBRARY_PATH
set -x POSTGRES_PATH "/Applications/Postgres.app/Contents/Versions/latest/bin"
set -x JAVA_HOME (/usr/libexec/java_home)
set -x ANDROID_HOME /usr/local/opt/android-sdk
set -x EDITOR vim
set -x VISUAL_EDITOR atom-beta
set -x MARKDOWN_EDITOR "Typora"
set -x DEV $HOME/dev
set -x DOTFILES $DEV/dotfiles
set -x DOWNLOAD_LOCATION $HOME/Downloads
set -x PROJECT_DIR $DEV/projects
set -x SECRET_FISH $DEV/dotfiles/fish/secrets.fish
set -x GIT_EMAIL "julioggonz@gmail.com"
set -x GIT_NAME "Julio García"
set -x LC_CTYPE "en_US.UTF-8"
set -x LC_ALL "en_US.UTF-8"
