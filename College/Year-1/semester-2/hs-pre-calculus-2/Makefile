compile:
	pdflatex master.tex;
	bibtex master;
	pdflatex master.tex;
	pdflatex;
	master.tex;
clean:
	mv master.pdf;
	mv master.tex ../;
	rm -rf master.*;
	mv ../master.pdf .;
	mv ../master.tex .;
