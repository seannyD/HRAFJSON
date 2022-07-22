# Set working directory
#  (shouldn't be hard coded)
try(setwd("~/OneDrive - Cardiff University/Conferences/EmberWorkshop/Live/GithubJSON/processing/"))

# Load libraries
library(rjson)

# Find all the files in the "json" folder
jsonFiles = list.files("../data/json/",pattern = "*.json",full.names = T)
jsonFiles = jsonFiles[!grepl("template.json",jsonFiles)]

# Loop through the files and combine them into a single data frame
d = NULL
for(jFile in jsonFiles){
  print(jFile)
  jData = fromJSON(file = jFile)
  d = rbind(d, as.data.frame(jData))
}

# Write to a csv
write.csv(d, "../data/csv/marriage.csv", row.names = F)
