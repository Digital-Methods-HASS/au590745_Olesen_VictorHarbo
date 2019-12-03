#######   Textmining scipt taken from Adela Sobotkova at  https://github.com/adivea/TextMiningTutorial

#Now we will do some textmining - this is to get the data 
cname <- file.path("./messytxts/")   
cname   
dir(cname)

## Get R packages for text mining
library(tm)

## Lets load texts to R
docs <- VCorpus(DirSource(cname))   
summary(docs)

## For details about documents in the corpus, use the inspect(docs) command.
inspect(docs[1])

# To write out the full text, use writeLines()
class(docs[1])
writeLines(as.character(docs[1]))

#This is the regular expression section to use if there are a lot of \t in the plain text file from writeLines(as.character(docs[1]))
###I need to make a regular expression, that substitutes ", " with a newline
### Can the tm-package make an output file as well, instead of just making a change to the corpus
for (j in seq(docs)) {
  docs[[j]] <- gsub("\t"," ", docs[[j]]) 
}

#To show the file (or one of the files) afterwards use this command again:
writeLines(as.character(docs[1]))

#This command saves the changes to the documents
docs <- tm_map(docs, PlainTextDocument)
