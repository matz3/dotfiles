# Default way to load nvm. very sloooow :-(
#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

# Faster way (from https://github.com/MoOx/setup/commit/b5d9fbe34c7f8f786d59580274dde4acecccf973)
export NVM_DIR="$HOME/.nvm"
export NVM_SH="$NVM_DIR/nvm.sh"
# https://github.com/creationix/nvm/issues/860
declare -a NODE_GLOBALS=(`find $NVM_DIR/versions/node -maxdepth 3 -type l -wholename '*/bin/*' | xargs -n1 basename | sort | uniq`)
NODE_GLOBALS+=("node")
NODE_GLOBALS+=("nvm")
load_nvm () { [ -s "$NVM_SH" ] && . "$NVM_SH" }
for cmd in "${NODE_GLOBALS[@]}"; do
	eval "${cmd}(){ unset -f ${NODE_GLOBALS}; load_nvm; ${cmd} \$@ }"
done
