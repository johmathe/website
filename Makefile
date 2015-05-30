DOCS=aviation flying_bay_tour index misc online_footpring projects projects_tail publications research_projects shotdetect technical

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
