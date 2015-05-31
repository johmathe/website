# ls jemdoc|sed s/.jemdoc//g |tr '\n' ' '
DOCS=aviation flying_bay_tour flying_fighters flying_l39 flying_mig29 index misc online_footprint optimization projects projects_tail publications technical tutorials 

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

publish : docs
	cp -R html/* johmathe.github.io
	cp -R imgs johmathe.github.io
	cp -R eqs johmathe.github.io
.PHONY : clean docs update
