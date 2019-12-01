#######   Textmining

####### https://rpubs.com/pjmurphy/265713

## Get your data
cname <- file.path("./test/")   
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


## Remove unwanted diacritics 
# ?removePunctuation()
# ?regexp says:
#   ‘[:punct:]’ Punctuation characters:
#   ‘! " # $ % & ' ( ) * + , - . / : ; < = > ? @ [ \ ] ^ _ ` { |
#           } ~’.

docs <- tm_map(docs,removePunctuation)   
writeLines(as.character(docs[1])) # Check to see if it worked.
# The 'writeLines()' function is commented out to save space.

for (j in seq(docs)) {
  docs[[j]] <- gsub( "\t"," ", docs[[j]]) 
  docs[[j]] <- gsub( " +"," ", docs[[j]])
}

docs <- tm_map(docs, PlainTextDocument)
               