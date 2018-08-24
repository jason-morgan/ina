# ==============================================================================
# Makefile for ina
# ==============================================================================

compile: FORCE
	R -e "devtools::document('.')"
	R -e "devtools::build('.')"

install: FORCE
	R -e "devtools::install('.')"

reinstall: FORCE
	R -e "remove.packages('ina'); devtools::install('.')"

remove: FORCE
	R -e "remove.package('ina')"

test: FORCE
	R -e "devtools::test('.')"

FORCE:
