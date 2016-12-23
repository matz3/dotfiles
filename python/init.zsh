if which pyenv > /dev/null;
	# Silently rehash in the background to improve startup performance (https://github.com/carsomyr/rbenv-bundler/issues/33#issuecomment-14334906)
	then eval "$(pyenv init --no-rehash -)"; (rbenv rehash &) 2> /dev/null;
fi
