#===============================================================================
# Makefile for Digital Sheetbook Documentation
# Sunday, March 27 2011, Dennis Schulmeister
# NOTE: Each file is created three times for the table of contents to be correct
#===============================================================================
PDFLATEX = pdflatex
PDFLATEX_OPTIONS = -halt-on-error -file-line-error
TEXINPUTS = .:docclass:

.DEFAULT: all

#-------------------------------------------------------------------------------
# Targets for single files
# $ make ds0-TEMPLATE.pdf
#-------------------------------------------------------------------------------
.SUFFIXES: .pdf

%.pdf : mkdirs
	export TEXINPUTS=$(TEXINPUTS); \
	$(PDFLATEX) $(PDFLATEX_OPTIONS) $*.tex; \
	#$(PDFLATEX) $(PDFLATEX_OPTIONS) $*.tex; \
	#$(PDFLATEX) $(PDFLATEX_OPTIONS) $*.tex; \

#-------------------------------------------------------------------------------
# Targets for all files at once
# $ make all
# $ make clean
#-------------------------------------------------------------------------------
.PHONY: clean
.PHONY: mkdirs
.PHONY: all

clean:
	shopt -s globstar; \
	rm -f **/**~; \
	rm -f **/**.aux; \
	rm -f **/**.dvi; \
	rm -f **/**.log; \
	rm -f **/**.out; \
	rm -f **/**.nav; \
	rm -f **/**.snm; \
	rm -f **/**.toc;


mkdirs:
	if [ ! -e $(OUTDIR) ]; then mkdir $(OUTDIR); fi

all: clean mkdirs
	export TEXINPUTS=$(TEXINPUTS); \
	for INFILE in *.tex; do \
	$(PDFLATEX) $(PDFLATEX_OPTIONS) $$INFILE; \
	$(PDFLATEX) $(PDFLATEX_OPTIONS) $$INFILE; \
	$(PDFLATEX) $(PDFLATEX_OPTIONS) $$INFILE; \
	done
