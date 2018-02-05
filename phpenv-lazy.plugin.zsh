# Lazy load phpenv
if type phpenv &> /dev/null; then
  local PHPENV_SHIMS="${PHPENV_ROOT:-${HOME}/.phpenv}/shims"
  export PATH="${PHPENV_SHIMS}:${PATH}"
  source $(which phpenv)/../../completions/phpenv.zsh
  function phpenv() {
    unset phpenv
    eval "$(command phpenv init -)"
    phpenv "$@"
  }
fi