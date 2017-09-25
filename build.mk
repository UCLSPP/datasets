#---------------------------------------------------------------
# makefile for building site

RSCRIPT = Rscript
RSCRIPT_BUILD = ./R/build.R

TARGETS = site archives

#---------------------------------------------------------------
all: $(TARGETS)

#---------------------------------------------------------------
.PHONY: $(TARGETS) all publish

#---------------------------------------------------------------
$(TARGETS):
	$(RSCRIPT) $(RSCRIPT_BUILD) $@

#---------------------------------------------------------------
PUBLISH_SH = ./bin/publish.sh

publish: $(TARGETS)
	chmod +x $(PUBLISH_SH)
	$(PUBLISH_SH)

