# Start D-Bus

source /etc/X11/xinit/xinitrc.d/30-dbus

# Start GPG agent
eval $(gpg-agent --daemon)

export SSH_AUTH_SOCK
export GPG_AGENT_INFO

TZ='Europe/Stockholm'; export TZ

# Desktop compositor
compton --backend glx --paint-on-overlay --glx-no-stencil --vsync opengl-swc -b -CG

# Keyboard layout
setxkbmap -layout se
setxkbmap -option ctrl:nocaps

xbindkeys
syndaemon -t -k -i 2 -d >>.syndaemon.log

exec i3
