#!/bin/sh
#
# Homebrew
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.

# Check for Homebrew
if test ! $(which brew)
then

	# Install the correct homebrew for each OS type
	if test "$(uname)" = "Darwin"
	then

		echo "  Installing Homebrew for you."

		# place everything in ~/.homebrew
		mkdir $HOME/.homebrew && curl -L https://github.com/Homebrew/homebrew/tarball/master | tar xz --strip 1 -C $HOME/.homebrew
	fi

fi

exit 0
