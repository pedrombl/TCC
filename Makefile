BASE_NAME = tcc_pedro_leal

LATEX     = latex
PDFLATEX  = pdflatex
BIBTEX    = bibtex
MAKEINDEX = makeindex

open_tcc: clean compile semi_clean
	open $(BASE_NAME).pdf

compile: $(BASE_NAME).pdf semi_clean

$(BASE_NAME).pdf: $(BASE_NAME).tex
	$(PDFLATEX) $(BASE_NAME).tex
	$(BIBTEX) $(BASE_NAME) 
	$(PDFLATEX) $(BASE_NAME).tex
	$(PDFLATEX) $(BASE_NAME).tex
	$(PDFLATEX) $(BASE_NAME).tex

semi_clean:
	rm -f *.ps *.dvi *.log *.aux *.blg *.toc *.brf *.ilg *.ind *.idx missfont.log *.bbl *.out *.lof *.lot *.synctex.gz

clean: semi_clean
	rm -f $(BASE_NAME)*.pdf