DOCNAME=master
PDF_VIEWER=zathura

all:
	make compile
	make clean
	make view

.PHONY:
	clean

compile:
	pdflatex $(DOCNAME).tex
	pdflatex $(DOCNAME).tex

clean:
	mv master.tex master-back.tex
	mv master.pdf master-back.pdf
	rm -rf master.*
	mv master-back.tex master.tex
	mv master-back.pdf master.pdf

view:
	make compile
	make clean
	$(PDF_VIEWER) $(DOCNAME).pdf
