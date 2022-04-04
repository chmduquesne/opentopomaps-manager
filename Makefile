ALPS := france switzerland italy germany austria slovenia
CONTOURS := $(ALPS:%=otm-%-contours.zip)
GARMIN := $(ALPS:%=otm-%.zip)
BASE := https://garmin.opentopomap.org/europe

all: $(GARMIN) $(CONTOURS)

otm-%-contours.zip: %
	curl -f -o $@ -z $@ $(BASE)/$</$@

otm-%.zip: %
	curl -f -o $@ -z $@ $(BASE)/$</$@

.PHONY: all $(ALPS)
