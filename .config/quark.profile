set -a
for f in "${XDG_CONFIG_HOME}/env/.${HOSTNAME}"/*; do
	[ -r "$f" ] && . "$f"
done
unset f
set +a

if [ "$(tty)" = "/dev/tty1" ]; then
	mkdir -m 700 -p "$XDG_RUNTIME_DIR" || return
	command -v sway >/dev/null &&
	    exec dbus-run-session sway
fi
