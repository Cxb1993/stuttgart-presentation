litvinov-pr.pdf: litvinov-pr.tex

litvinov-pr.pdf: litvinov-pr.tex
	texi2dvi --pdf $<

.PHONY: clean
clean:
	-rm litvinov-pr.pdf
