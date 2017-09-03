#---------------------------------------------------------------
# makefile for building site

RSCRIPT = Rscript
RSCRIPT_BUILD = ./R/build.R

TARGET = site

#---------------------------------------------------------------
all: $(TARGET)

#---------------------------------------------------------------
.PHONY: $(TARGET) all publish

#---------------------------------------------------------------
$(TARGET):
	$(RSCRIPT) $(RSCRIPT_BUILD) $@

#---------------------------------------------------------------
PUBLISH_SH = ./bin/publish.sh

publish: $(TARGET)
	chmod +x $(PUBLISH_SH)
	$(PUBLISH_SH)

