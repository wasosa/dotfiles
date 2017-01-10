.PHONY: all clean

FILES = .bashrc .emacs .gitconfig .profile .tmux.conf
DIRS = bin .vnc .ccache

all:
	cp -r $(FILES) $(DIRS) $$HOME/

# end of file
