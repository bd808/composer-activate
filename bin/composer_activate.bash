_CP_SCRIPT=${BASH_SOURCE[0]}
[[ ${_CP_SCRIPT} == ${0} ]] && {
  echo "$0 must be sourced. It cannot be run directly." >&2
  exit 1
}

composer_deactivate () {
  if [[ -n ${_CP_OLD_PATH} ]]; then
    exportPATH="${_CP_OLD_PATH}"
    unset _CP_OLD_PATH
  fi
  if [[ -n ${_CP_OLD_PS1} ]]; then
    export PS1="${_CP_OLD_PS1}"
    unset _CP_OLD_PS1
  fi
  builtin hash -r 2>/dev/null
  unset COMPOSER_BINDIR
  unset COMPOSER_DIR
  if [[ -z ${1} ]]; then
    unset -f composer_deactivate
  fi
}

composer_deactivate nondestructive

COMPOSER_BINDIR=$(cd -P -- "$(dirname ${_CP_SCRIPT})" &&
  printf '%s\n' "$(pwd -P)")

composer_find_base () {
  local d=${COMPOSER_BINDIR}
  while ! [[ -f ${d}/composer.json ]]; do
    d=$(dirname "${d}")
  done
  echo "${d}"
}
COMPOSER_DIR=$(composer_find_base)
unset -f composer_find_base

_CP_OLD_PATH="${PATH}"
export PATH="${COMPOSER_BINDIR}:${PATH}"

_CP_OLD_PS1="${PS1}"
export PS1="($(basename "${COMPOSER_DIR}"))${PS1}"

builtin hash -r 2>/dev/null

unset _CP_SCRIPT

echo "${COMPOSER_BINDIR} added to path."
echo "Remove with \`composer_deactivate\`"
