.PHONY: all doc install-texmflocal install texlive clean

all: dk-bib.pdf

doc: dk-bib.ltx litteratur.bib dk-plain.bst dk-bib.sty
	test ${LATEX} # checking wheter LATEX is set
	${LATEX} dk-bib.ltx
	bibtex dk-bib
	${LATEX} dk-bib.ltx
	${LATEX} dk-bib.ltx

dk-bib.pdf: dk-bib.ltx litteratur.bib dk-plain.bst dk-bib.sty
	LATEX=pdflatex make doc

dk-bib.dvi: dk-bib.ltx litteratur.bib dk-plain.bst dk-bib.sty
	LATEX=latex make doc

install: dk-bib.pdf
	test ${INSTALLDIR} # checking whether INSTALLDIR is set
	install -m 0755 -d            ${INSTALLDIR}/tex/latex/dk-bib/
	install -m 0755 -d            ${INSTALLDIR}/doc/latex/dk-bib/
	install -m 0755 -d            ${INSTALLDIR}/bibtex/bst/dk-bib/
	install -m 0644 dk-bib.sty    ${INSTALLDIR}/tex/latex/dk-bib/
	install -m 0644 dk-bib.pdf    ${INSTALLDIR}/doc/latex/dk-bib/
	install -m 0644 dk-abbrv.bst\
	                dk-alpha.bst\
	                dk-apali.bst\
	                dk-plain.bst\
	                dk-unsrt.bst  ${INSTALLDIR}/bibtex/bst/dk-bib/
	(test -f ${INSTALLDIR}/ls-R && mktexlsr ${INSTALLDIR}) || true

texlive:
	INSTALLDIR=texlive/texmf-dist make install

install-texmflocal:
	test `kpsexpand '$$TEXMFLOCAL'` # checking whether TEXMFLOCAL is defined
	INSTALLDIR=`kpsexpand '$$TEXMFLOCAL'` make install

clean:
	${RM} dk-bib.aux dk-bib.log dk-bib.blg dk-bib.bbl dk-bib.out dk-bib.dvi dk-bib.pdf
	${RM} *~
