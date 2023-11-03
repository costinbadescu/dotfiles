umask 022

ENV=~/.env
HOSTNAME=$(uname -n)
HOSTNAME="${HOSTNAME%%.*}"
LANG=en_US.UTF-8
LC_COLLATE=C
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin
PATH=~/bin:~/.local/bin:"$PATH"
XDG_CONFIG_HOME=~/.config
XDG_CACHE_HOME=~/.cache
XDG_DATA_HOME=~/.local/share
XDG_RUNTIME_DIR=/tmp/runtime-$(id -u)
XDG_STATE_HOME=~/.local/state

[ -d /run/user ] && XDG_RUNTIME_DIR=/run/user/$(id -u)

export ENV PATH LANG LC_COLLATE
export XDG_CACHE_HOME XDG_CONFIG_HOME \
    XDG_DATA_HOME XDG_RUNTIME_DIR XDG_STATE_HOME

[ -r "${XDG_CONFIG_HOME}/${HOSTNAME}.profile" ] &&
    . "${XDG_CONFIG_HOME}/${HOSTNAME}.profile"
