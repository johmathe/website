DOCS=index aviation projects_tail misc drafts footprint research_projects technical shotdetect publications gfuzzy past_projects projects

HDOCS=$(addsuffix .html, $(DOCS))
PHDOCS=$(addprefix html/, $(HDOCS))

.PHONY : docs
docs : $(PHDOCS)

.PHONY : update
update : $(PHDOCS)
	@echo -n 'Copying to server...'
	cp -R html/* /home/www/johmathe.name/
	@echo ' done.'

html/%.html : %.jemdoc MENU site.conf
	jemdoc -c site.conf -o $@ $<

.PHONY : clean
clean :
	-rm -f html/*.html
