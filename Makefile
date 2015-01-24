DOCS=index software_dev_tips eclipse_tips software_dev_tips aviation projects_tail misc footprint bay_tour_flight research_projects technical shotdetect publications gfuzzy past_projects projects

HDOCS=$(addsuffix .html, $(DOCS))
PHDOCS=$(addprefix html/, $(HDOCS))

.PHONY : docs
docs : $(PHDOCS)

.PHONY : update
update : $(PHDOCS)
	@echo -n 'Copying to server...'
	scp -r html/* imgs eqs e.nonutc.fr:/home/www/johmathe.name/
	@echo ' done.'

html/%.html : %.jemdoc MENU site.conf
	jemdoc -c site.conf -o $@ $<

.PHONY : clean
clean :
	-rm -f html/*.html
