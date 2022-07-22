(cd processing
R -f combineData.R
)
(cd analysis
R -f analysis.R
)
(cd writeup
pdflatex paper.tex
)