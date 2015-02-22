library("SnowballC")
library("openNLP")
library("NLP")
negFiles <- dir("./DataSets/neg/", full.names = TRUE)
posFiles <- dir("./DataSets/pos/", full.names = TRUE)
tagRemover <- function(file,tags)
{
  vector <- c("DT","POS","PRP","PRP$","FW","WP","WDT","WP$","WRB","TO","SYM","CD","MD")
  file <- file[!(tags %in% vector)]
  file <- file[!is.na(file)]
  file <- file[!(file %in% file[grep("^ ?[[:punct:]] ?$|^'s$|^i$",file)])]
  file <- gsub("^n't$","not",file)
  return(file)
}
stemWord <- function(file)
{
  file <- wordStem(file)
  file <- unique(file)
  return(file)
}
stemmer <- function(File)
{
  ##Sentence annotator
  sent_token <- Maxent_Sent_Token_Annotator()
  ##Word Annotator
  word_token <- Maxent_Word_Token_Annotator()
  ##Part of speech tagger annotator
  pos_tag_annotator <- Maxent_POS_Tag_Annotator()
  ##Annotation without features
  annotation1 <- annotate(File,list(sent_token, word_token))
  ##Second annotation with POS
  annotation2 <- annotate(File, pos_tag_annotator, annotation1)
  ##Taking only word tokens
  annotation_word <- subset(annotation2, type == "word")
  tags <- sapply(annotation_word$features, `[[`, "POS")
  temp <- sprintf("%s", File[annotation_word])
  temp <- tagRemover(temp, tags)
  temp <- wordStem(temp)
  return(temp)
}
for( i in 1:700 )
{
  negFile <- paste(readLines(negFiles[i]), collapse = "")
  negFile <- as.String(negFile)
  temp <- stemmer(negFile)
  write(temp, negFiles[i], ncolumns = 10e6)
  posFile <- paste(readLines(posFiles[i]), collapse = "")
  posFile <- as.String(posFile)
  temp <- stemmer(posFile)
  write(temp, posFiles[i],ncolumns = 10e6)
  print(i)
}