DOCS=index software_dev_tips eclipse_tips software_dev_tips aviation projects_tail misc footprint bay_tour_flight research_projects technical shotdetect publications gfuzzy past_projects projects

HDOCS=$(addsuffix .html, $(DOCS))
PHDOCS=$(addprefix html/, $(HDOCS))

docs : $(PHDOCS)

update : $(PHDOCS)
	@echo -n 'Copying to server...'
	scp -r html/* imgs eqs e.nonutc.fr:/home/www/johmathe.name/
	@echo ' done.'

html/%.html : jemdoc/%.jemdoc MENU site.conf
	./jemdoc.py -c site.conf -o $@ $<

clean :
	rm -f html/*.html

publish :
	cp -R html/* johmathe.github.io

.PHONY : clean docs update
