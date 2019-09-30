#===============================================================================
# Makefile for Digital Sheetbook Documentation
# Sunday, March 27 2011, Dennis Schulmeister
# NOTE: Each file is created three times for the table of contents to be correct
#===============================================================================
OUTDIR = ./PDF
BUILDDIR = ./build
PDFLATEX = pdflatex
PDFLATEX_OPTIONS = -halt-on-error -file-line-error -output-directory $(BUILDDIR)
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
	mv "$(BUILDDIR)/$@" $(OUTDIR)

#-------------------------------------------------------------------------------
# Targets for all files at once
# $ make all
# $ make clean
#-------------------------------------------------------------------------------
.PHONY: clean
.PHONY: mkdirs
.PHONY: all

#clean:
#	shopt -s globstar; \
#	rm -f **/**~; \
#	rm -f **/**.aux; \
#	rm -f **/**.dvi; \
#	rm -f **/**.log; \
#	rm -f **/**.out; \
#	rm -f **/**.nav; \
#	rm -f **/**.snm; \
#	rm -f **/**.toc; \
#	rm -f **/**.vrb

clean:
	rm -rf $(BUILDDIR)

mkdirs:
	if [ ! -e $(OUTDIR)                    ]; then mkdir $(OUTDIR);                    fi
	if [ ! -e $(BUILDDIR)                  ]; then mkdir $(BUILDDIR);                  fi
	if [ ! -e $(BUILDDIR)/include          ]; then mkdir $(BUILDDIR)/include;          fi
	if [ ! -e $(BUILDDIR)/0-kopiervorlage  ]; then mkdir $(BUILDDIR)/0-kopiervorlage;  fi
	if [ ! -e $(BUILDDIR)/0-vorlage        ]; then mkdir $(BUILDDIR)/0-vorlage;        fi
	if [ ! -e $(BUILDDIR)/1-grundlagen     ]; then mkdir $(BUILDDIR)/1-grundlagen;     fi
	if [ ! -e $(BUILDDIR)/2-hardwaredesign ]; then mkdir $(BUILDDIR)/2-hardwaredesign; fi
	if [ ! -e $(BUILDDIR)/3-nodered        ]; then mkdir $(BUILDDIR)/3-nodered;        fi
	if [ ! -e $(BUILDDIR)/4-programmierung ]; then mkdir $(BUILDDIR)/4-programmierung; fi

all: clean mkdirs
	export TEXINPUTS=$(TEXINPUTS); \
	for INFILE in *.tex; do \
	$(PDFLATEX) $(PDFLATEX_OPTIONS) $$INFILE; \
	$(PDFLATEX) $(PDFLATEX_OPTIONS) $$INFILE; \
	$(PDFLATEX) $(PDFLATEX_OPTIONS) $$INFILE; \
	done
	mv $(BUILDDIR)/*.pdf $(OUTDIR)
