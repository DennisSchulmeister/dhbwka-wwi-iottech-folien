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

%.pdf: mkdirs
	export TEXINPUTS=$(TEXINPUTS); \
	$(PDFLATEX) $(PDFLATEX_OPTIONS) $*.tex; \
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
	if [ ! -e $(OUTDIR)                      ]; then mkdir $(OUTDIR);                      fi
	if [ ! -e $(BUILDDIR)                    ]; then mkdir $(BUILDDIR);                    fi
	if [ ! -e $(BUILDDIR)/include            ]; then mkdir $(BUILDDIR)/include;            fi
	if [ ! -e $(BUILDDIR)/00-kopiervorlage   ]; then mkdir $(BUILDDIR)/00-kopiervorlage;   fi
	if [ ! -e $(BUILDDIR)/00-vorlage         ]; then mkdir $(BUILDDIR)/00-vorlage;         fi
	if [ ! -e $(BUILDDIR)/01-grundlagen      ]; then mkdir $(BUILDDIR)/01-grundlagen;      fi
	if [ ! -e $(BUILDDIR)/02-hardwaredesign  ]; then mkdir $(BUILDDIR)/02-hardwaredesign;  fi
	if [ ! -e $(BUILDDIR)/03-python1         ]; then mkdir $(BUILDDIR)/03-python1;         fi
	if [ ! -e $(BUILDDIR)/04-python2         ]; then mkdir $(BUILDDIR)/04-python2;         fi
	if [ ! -e $(BUILDDIR)/05-semesterstart   ]; then mkdir $(BUILDDIR)/05-semesterstart;   fi
	if [ ! -e $(BUILDDIR)/06-hardwarenutzung ]; then mkdir $(BUILDDIR)/06-hardwarenutzung; fi
	if [ ! -e $(BUILDDIR)/07-python3         ]; then mkdir $(BUILDDIR)/07-python3;         fi
	if [ ! -e $(BUILDDIR)/08-datenaustausch  ]; then mkdir $(BUILDDIR)/08-datenaustausch;  fi
	if [ ! -e $(BUILDDIR)/09-linux           ]; then mkdir $(BUILDDIR)/09-linux;           fi
	if [ ! -e $(BUILDDIR)/99-beispiele       ]; then mkdir $(BUILDDIR)/99-beispiele;       fi

all: clean mkdirs
	export TEXINPUTS=$(TEXINPUTS); \
	for INFILE in *.tex; do \
	$(PDFLATEX) $(PDFLATEX_OPTIONS) $$INFILE; \
	$(PDFLATEX) $(PDFLATEX_OPTIONS) $$INFILE; \
	$(PDFLATEX) $(PDFLATEX_OPTIONS) $$INFILE; \
	done
	mv $(BUILDDIR)/*.pdf $(OUTDIR)
