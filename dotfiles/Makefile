# Dotfiles Makefile

.PHONY: install clean

srcbin := ./cmd
srcetc := ./etc
srcext := sh

install :
	install -bCSv -m 0740 ${srcbin}/dotsend.${srcext} ~/bin/dotsend
	install -bCSv -m 0740 ${srcbin}/dotsync.${srcext} ~/bin/dotsync
	install -bCSv -m 0740 ${srcbin}/dotdiff.${srcext} ~/bin/dotdiff
	install -bCSv -m 0640 ${srcetc}/dotenvs           ~/.dotenvs

clean :
	rm "${HOME}/bin/dotsync" "${HOME}/bin/dotsend" "${HOME}/bin/dotdiff"
	rm "${HOME}/.dotlist"
	rm "${HOME}/.dotenvs"
