library("e1071")
library("stringr")

#Fuction to remove noise like punctuation, special symbols
featureExtractor <- function(review.add,feature) 
{
  temp <- paste(readLines(review.add), collapse = "")
  freq <- as.vector(numeric())
  pres <- as.vector(numeric())
  for( i in 1:length(feature) )
  {
    flag <- 0
    char <- as.character(paste(" ",feature[i]," ",sep = ""))
    length <- str_count(temp,ignore.case(fixed(char)))
    if(length > 0)
      flag <- 1
    freq <- c(freq,length)
    pres <- c(pres,flag)
  }
  list <- list(freq = freq,pres = pres)
  return(list)
}

#Vector of negative & positive files name with full path appended
negativeFileNames <- dir("./DataSets/neg/",full.names = TRUE)
positiveFileNames <- dir("./DataSets/pos/",full.names = TRUE)

features <- c("love", "wonderful", "best", "great", "superb", "still", "beautiful","worth","fine","emotional","performance","world","more","life","many","well","family","especially","makes","different","effective")
features <- c(features,"bad","worst","stupid","waste","boring","against","unfortunately","worse","still","wrong","reason","why","didn't","?","!","no","dull","don't","awful","falls")
# features <- scan("AFINN/features-set/features(6440).txt",what = character(),sep="\n")

#Main dataset is to be add in it
dataSet_freq <- data.frame(as.vector(numeric()))
dataSet_pres <- data.frame(as.vector(numeric()))

for( i in 1:700 )
{
  list <- featureExtractor(negativeFileNames[i],features)
  dataSet_freq <- rbind(dataSet_freq,list$freq)
  dataSet_pres <- rbind(dataSet_pres,list$pres)
  print(i)
}
for( i in 1:700 )
{
  list <- featureExtractor(positiveFileNames[i],features)
  dataSet_freq <- rbind(dataSet_freq,list$freq)
  dataSet_pres <- rbind(dataSet_pres,list$pres)
  print(i)
}
names(dataSet_freq) <- features
names(dataSet_pres) <- features

#Creating a vectors of positive and negative
neg <- as.vector(character())
neg <- "Negative"
length(neg) <- 700
neg[is.na(neg)] <- "Negative"
pos <- as.vector(character())
pos <- "Positive"
length(pos) <- 700
pos[is.na(pos)] <- "Positive"
targetFunction <- c(neg,pos)

#Bind target function in dataset
dataSet_freq <- cbind(dataSet_freq,targetFunction = targetFunction)
dataSet_pres <- cbind(dataSet_pres,targetFunction = targetFunction)
save.image("data(40-features.RData")