# Set working directory
try(setwd("~/OneDrive - Cardiff University/Conferences/EmberWorkshop/Live/GithubJSON/processing/"))

# Load data
d = read.csv("../data/csv/marriage.csv",stringsAsFactors = F)

# Table
table(d$PolygamousMarriage)

# Exclude uncertain cases
d = d[d$PolygamousMarriage!="8",]
d = d[d$PolygamousMarriage!="9",]

# Proportion of "1"
propAbsent = sum(d$PolygamousMarriage==1)/nrow(d)
# Change to percentage
perAbsent = round(propAbsent*100,2)

cat(perAbsent, file="../results/latex/perAbsent.tex")

library(xtable)
d$PolygamousMarriageName = 
  factor(d$PolygamousMarriage,
         levels = c("1","2","3","8","9"),
         labels = c("rare or never", 
                    "frequent but not typical", 
                    "typical","confusing", 
                    "no information"))
latexTable = xtable(d[,c("Society","PolygamousMarriageName")],caption = "Summary of data")
cat(print(latexTable), file="../results/latex/PolyTable.tex")
