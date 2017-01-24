SHELL := /bin/bash


output_dir  = /tmp/online_atps
tests_path = test/basics


OnlineATPs = dist/build/online-atps/online-atps


.PHONY : errors
errors :
	shelltest --color --execdir --precise  $(tests_path)/basics.test
	@echo "$@ succeeded!"


.PHONY : haddock
haddock :
	cabal configure
	cabal haddock --executables \
	              --haddock-option=--use-unicode \
	              --hyperlink-source \
	              --for-hackage
	@echo "$@ succeeded!"

.PHONY : install-bin
install-bin :
	cabal install --disable-documentation

.PHONY : install-fix-whitespace
install-fix-whitespace :
	cd src/fix-whitespace && cabal install


.PHONY : check-whitespace
check-whitespace :
	fix-whitespace --check

.PHONY : TODO
TODO :
	find . -type d \( -path './.git' -o -path './dist' \) -prune -o -print \
	| xargs grep -I 'TODO' \
	| sort

.PHONY : clean
clean :
	find . -type f -name '*.hi' -delete
	find . -type f -name '*.o' -delete
	find . -type f -name 'atps.txt' -delete
	rm -f -r $(output_dir)

.PHONY : tests
tests :
	make errors
	make hlint
	make check-whitespace
	make haddock
	@echo "$@ succeeded!"