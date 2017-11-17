#---------------------------------------------------------------
# makefile for building site

RSCRIPT = Rscript
RSCRIPT_BUILD = ./R/build.R

TARGETS = site archives

#---------------------------------------------------------------
all: $(TARGETS)

#---------------------------------------------------------------
.PHONY: $(TARGETS) all

#---------------------------------------------------------------
$(TARGETS):
	$(RSCRIPT) $(RSCRIPT_BUILD) $@

