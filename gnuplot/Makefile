PDFS=f1.pdf self.pdf dep.pdf
all: ${PDFS}

%.pdf: %.gp
	gnuplot $<
	epstopdf $(<:%.gp=%.eps)

.phony: clean
clean:
	-rm ${PDFS}
