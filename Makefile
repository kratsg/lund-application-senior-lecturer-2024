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
				-@rm *.aux *.bbl *.bcf *.blg *.dvi *.glg *.glo *.gls *.ist *.lof *.log *.lot *.out *.ps *.run.xml *.toc *.bak* 2>/dev/null || true
				-@rm chapters/*.aux chapters/*.bbl chapters/*.bcf chapters/*.blg chapters/*.dvi chapters/*.glg chapters/*.glo chapters/*.gls chapters/*.ist chapters/*.lof chapters/*.log chapters/*.lot chapters/*.out chapters/*.ps chapters/*.run.xml chapters/*.toc chapters/*.bak* 2>/dev/null || true
				$(MAKE) -C chapters cleanpartial

clean: cleanpartial
				-@rm *.pdf 2>/dev/null || true
