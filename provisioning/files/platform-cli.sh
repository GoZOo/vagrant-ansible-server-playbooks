 export PATH="$PATH:$HOME/.composer/vendor/bin" 
 
 # Platform.sh CLI configuration
 PLATFORMSH_CONF=~/.composer/vendor/platformsh/cli/platform.rc
 [ -f "$PLATFORMSH_CONF" ] && . "$PLATFORMSH_CONF"