IDRIS ?= idris
LIB   := bifunctors
TEST  := test

.PHONY: lib clean check clobber install rebuild test docs docs-clean

lib:
	${IDRIS} ${OPTS} --build ${LIB}.ipkg

clean:
	${IDRIS} --clean ${LIB}.ipkg
	find . -name "*~" -delete

check: clobber
	${IDRIS} --checkpkg ${LIB}.ipkg

clobber: clean docs-clean
	find . -name "*.ibc" -delete

install:
	${IDRIS} --install ${LIB}.ipkg

rebuild: clean lib

test: clean install
	${IDRIS} --testpkg ${TEST}.ipkg

docs: build docs-clean
	${IDRIS} --mkdoc ${LIB}.ipkg \
	&& rm -rf docs >/dev/null \
	&& mv ${LIB}_doc docs

docs-clean:
	rm -rf ${LIB}_doc docs >/dev/null
