SOURCES=$(wildcard ./chapters/*.tex ./*.bib ./attachments/*)

all: application.pdf # application_attachments.pdf

%.pdf: %.tex $(SOURCES)
				latexmk -pdf $(basename $@)
				make cleanpartial

cleanpartial:
				-@rm *.aux *.bbl *.bcf *.blg *.dvi *.glg *.glo *.gls *.ist *.lof *.log *.lot *.out *.ps *.run.xml *.toc 2>/dev/null || true
				$(MAKE) -C chapters cleanpartial

clean: cleanpartial
				-@rm *.pdf 2>/dev/null || true
