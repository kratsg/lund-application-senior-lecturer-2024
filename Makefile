SOURCES=$(wildcard ./preamble.tex ./chapters/*.tex ./*.bib ./attachments/cover-letter-academic-position-180928.pdf ./attachments/signature.png)
ATTACHMENTS=$(wildcard ./preamble.tex ./attachments/*/*)

all: application.pdf application_attachments.pdf

application.pdf: application.tex $(SOURCES)
				latexmk -pdf $(basename $@)
				make cleanpartial

application_attachments.pdf: application_attachments.tex $(ATTACHMENTS)
				latexmk -pdf $(basename $@)
				make cleanpartial

cleanpartial:
				-@rm *.aux *.bbl *.bcf *.blg *.dvi *.glg *.glo *.gls *.ist *.lof *.log *.lot *.out *.ps *.run.xml *.toc 2>/dev/null || true
				$(MAKE) -C chapters cleanpartial

clean: cleanpartial
				-@rm *.pdf 2>/dev/null || true