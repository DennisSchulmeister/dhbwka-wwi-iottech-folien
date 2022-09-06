#===============================================================================
# Makefile for Digital Sheetbook Documentation
# Sunday, March 27 2011, Dennis Schulmeister
# NOTE: Each file is created three times for the table of contents to be correct
#===============================================================================
OUTDIR = ./PDF
BUILDDIR = ./build
PDFLATEX = pdflatex
PDFLATEX_OPTIONS = -halt-on-error -file-line-error -output-directory $(BUILDDIR)

.DEFAULT: all

#-------------------------------------------------------------------------------
# Targets for single files
# $ make ds0-TEMPLATE.pdf
#-------------------------------------------------------------------------------
.SUFFIXES: .pdf

%.pdf: builddir
	export TEXINPUTS=`cat build/$*.dir`; \
	$(PDFLATEX) $(PDFLATEX_OPTIONS) build/$*.tex; \
	mv "$(BUILDDIR)/$@" $(OUTDIR)

#-------------------------------------------------------------------------------
# Targets for all files at once
# $ make all
# $ make clean
#-------------------------------------------------------------------------------
.PHONY: clean
.PHONY: builddir
.PHONY: all

clean:
	rm -rf $(BUILDDIR)
	rm -rf $(OUTDIR)/*.pdf

builddir:
	if [ ! -e $(OUTDIR)           ]; then mkdir $(OUTDIR);           fi
	if [ ! -e $(BUILDDIR)         ]; then mkdir $(BUILDDIR);         fi
	if [ ! -e $(BUILDDIR)/include ]; then mkdir $(BUILDDIR)/include; fi

	for NAME in */hauptfolien.tex; do                 \
	    NAME=$${NAME//"/hauptfolien.tex"/};           \
	    DIR=$(BUILDDIR)/$$NAME;                       \
	                                                  \
	    if [ ! -e $$DIR ]; then                       \
	        mkdir $$DIR;                              \
	    fi;                                           \
	                                                  \
	    IF=xx-folien.tex;                             \
	    OF=$(BUILDDIR)/$${IF//xx/$$NAME};             \
	    sed s/xx/$$NAME/g $$IF > $$OF;                \
	    echo .:$$NAME: > $${OF//.tex/.dir};            \
	                                                  \
	    IF=xx-handout.tex;                            \
	    OF=$(BUILDDIR)/$${IF//xx/$$NAME};             \
	    sed s/xx/$$NAME/g $$IF > $$OF;                \
	    echo .:$$NAME: > $${OF//.tex/.dir};            \
	                                                  \
	    if [ -e $$NAME/aufgabenblatt.tex ]; then      \
	        IF=xx-aufgaben.tex;                       \
	        OF=$(BUILDDIR)/$${IF//xx/$$NAME};         \
	        sed s/xx/$$NAME/g $$IF > $$OF;            \
	        echo .:$$NAME: > $${OF//.tex/.dir};        \
	    fi;                                           \
	done                                              \

all: clean builddir
	for INFILE in build/*.tex; do                     \
		export TEXINPUTS=`cat $${INFILE//.tex/.dir}`; \
		$(PDFLATEX) $(PDFLATEX_OPTIONS) $$INFILE;     \
		$(PDFLATEX) $(PDFLATEX_OPTIONS) $$INFILE;     \
		$(PDFLATEX) $(PDFLATEX_OPTIONS) $$INFILE;     \
	done

	mv $(BUILDDIR)/*.pdf $(OUTDIR)
