# Try to find scalaenv, if it's not on the path
export SCALAENV_ROOT="${SCALAENV_ROOT:=${HOME}/.scalaenv}"
if ! type scalaenv > /dev/null && [ -f "${SCALAENV_ROOT}/bin/scalaenv" ]; then
    export PATH="${SCALAENV_ROOT}/bin:${PATH}"
fi

# Lazy load jenv
if type scalaenv > /dev/null; then
    export PATH="${SCALAENV_ROOT}/bin:${PATH}"
    function scalaenv() {
        unset -f scalaenv
        eval "$(command scalaenv init -)"
        scalaenv $@
    }
fi
