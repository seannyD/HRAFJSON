try(setwd("~/OneDrive - Cardiff University/Conferences/EmberWorkshop/Live/GithubJSON/processing/"))
library(rjson)

jsonFiles = list.files("../data/json/",pattern = "*.json")
jsonFiles = jsonFiles[!grepl("template.json",jsonFiles)]

d = NULL
for(jFile in jsonFiles){
  jData = fromJSON(file = paste0("../data/json/",jFile))
  d = rbind(d, as.data.frame(jData))
}

write.csv(d, "../data/csv/marriage.csv", row.names = F)
