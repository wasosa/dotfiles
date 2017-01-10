.PHONY: all clean

FILES = .bashrc .emacs .gitconfig .profile .tumx.conf
DIRS = bin .vnc .ccache

all:
	echo cp -r $(FILES) $(DIRS) $$HOME/

# end of file
