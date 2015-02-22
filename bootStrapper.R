library("wordnet")
bootStrapper <- function(vector)
{
  data <- as.vector(character())
  len <- length(vector)
  for(i in 1:len)
  {
    print(i)
    synsets_Adj <- synonyms(vector[i],"ADJECTIVE")
    synsets_Adv <- synonyms(vector[i],"ADVERB")
    synsets_Noun <- synonyms(vector[i],"NOUN")
    synsets_Verb <- synonyms(vector[i],"VERB")
    if(length(synsets_Adj)==0 && length(synsets_Adv) == 0 && length(synsets_Verb) == 0 && length(synsets_Noun) == 0)
    {
      data <- c(data,vector[i])
      next
    }
    data <- c(data,synsets_Adj,synsets_Adv,synsets_Verb,synsets_Noun)
  }
  return(data)
}
dataSet <- as.vector(character())
dataSet <- c(dataSet,bootStrapper(scan(file = "AFINN/Descriptive_Words.txt",what = character(),sep = ",")))
dataSet <- c(dataSet,bootStrapper(scan(file = "AFINN/word_to_use-neg.txt",what = character(),sep = "\n")))
dataSet <- c(dataSet,bootStrapper(scan(file = "AFINN/word_to_use-pos.txt",what = character(),sep = "\n")))
dataSet <- c(dataSet,scan(file = "AFINN/negative-words.txt",what = character(),sep = "\n"))
dataSet <- c(dataSet,scan(file = "AFINN/positive-words.txt",what = character(),sep = "\n"))