TEXMFLOCAL=`kpsexpand '$$TEXMFLOCAL'`

all:

doc:
	pdflatex dk-bib.ltx
	bibtex dk-bib
	pdflatex dk-bib.ltx
	pdflatex dk-bib.ltx
	${RM} dk-bib.aux dk-bib.log dk-bib.blg dk-bib.bbl dk-bib.out

install-texmflocal:
	install --mode 0644 -D dk-bib.sty ${TEXMFLOCAL}/tex/latex/dk-bib/dk-bib.sty
	install --mode 0644 -D dk-bib.pdf ${TEXMFLOCAL}/doc/latex/dk-bib/dk-bib.pdf
	install --mode 0644 -D dk-abbrv.bst ${TEXMFLOCAL}/bibtex/bst/dk-bib/dk-abbrv.bst
	install --mode 0644 -D dk-alpha.bst ${TEXMFLOCAL}/bibtex/bst/dk-bib/dk-alpha.bst
	install --mode 0644 -D dk-plain.bst ${TEXMFLOCAL}/bibtex/bst/dk-bib/dk-plain.bst
	install --mode 0644 -D dk-unsrt.bst ${TEXMFLOCAL}/bibtex/bst/dk-bib/dk-unsrt.bst
	mktexlsr ${TEXMFLOCAL}

texlive:
	install --mode 0644 -D dk-bib.sty texlive/texmf-dist/tex/latex/dk-bib/dk-bib.sty
	install --mode 0644 -D dk-bib.pdf texlive/texmf-dist/doc/latex/dk-bib/dk-bib.pdf
	install --mode 0644 -D dk-abbrv.bst texlive/texmf-dist/bibtex/bst/dk-bib/dk-abbrv.bst
	install --mode 0644 -D dk-alpha.bst texlive/texmf-dist/bibtex/bst/dk-bib/dk-alpha.bst
	install --mode 0644 -D dk-plain.bst texlive/texmf-dist/bibtex/bst/dk-bib/dk-plain.bst
	install --mode 0644 -D dk-unsrt.bst texlive/texmf-dist/bibtex/bst/dk-bib/dk-unsrt.bst
