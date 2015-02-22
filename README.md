Sentiment Analysis Of Movie Reviews
===================================

###@Author Shivam Sharma(28shivamsharma@gmail.com)
DataSet is similar to dataset used by Pang et. al.[1] in their research. You can directly download the data from the authors [page](http://www.cs.cornell.edu/people/pabo/movie-review-data/mix20_rand700_tokens_cleaned.zip). References related to my project is given below. Kindly Let me know if data is removed or page not available problems occurs.

How do I Run this program?

1. First install R and packages listed below:-
 - **stringr**
 - **openNLP**
 - **NLP**
 - **e1071**
 - **NLP**
 - **stringi**

2. Running program:-

	Run code(40-features).R program on R platform for getting accuracy of `71%`(approx). Features here is bag of words. Then finally for prediction run 3-fold.R or 5-fold.R program.

###Codes:- 
Codes are written in R language with names showing its approaches. Let us take this program **code(40-features).R** means the code is using 40 most informative features as a model. Similarly with others.
###Bootstrapping
Code is use for increasing my features by use of wordnet package.
###Cross Validation
3-fold & 5-fold codes are use for cross validation. In 3-fold.R program Support Vector machine is used but in 5-fold.R Naive bayes is used. You can change according to your convenient.
###Stemming
Stemming for reducing words to their stems(Continued ==> continu & Continue ==> continu).


###References:-
[1] B. Pang, L. Lee, and S. Vaithyanathan. Thumbs up?Sentiment classification using machine learnin techniques. In Proceedings of the Conference on Empirical Methods in Natural Language Processing (EMNLP), pages 79-86, 2002.

[2] R. Feldman. Techniques and applications for sentiment analysis. Published in:  Magazine Communications of the ACM Volume 56 Issue 4, April 2013 Pages 82-89.