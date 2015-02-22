library("e1071")
nb <- function(ndataSet)
{
  train1 <- naiveBayes(ndataSet[-(1:466),-ncol(ndataSet)],ndataSet[-(1:466),ncol(ndataSet)])
  train2 <- naiveBayes(ndataSet[-(467:932),-ncol(ndataSet)],ndataSet[-(467:932),ncol(ndataSet)])
  train3 <- naiveBayes(ndataSet[-(933:1400),-ncol(ndataSet)],ndataSet[-(933:1400),ncol(ndataSet)])
  
  predict1 <- predict(train1,ndataSet[1:466,-ncol(ndataSet)])
  tab1 <- table(predict1,ndataSet[1:466,ncol(ndataSet)])
  predict2 <- predict(train2,ndataSet[467:932,-ncol(ndataSet)])
  tab2 <- table(predict2,ndataSet[467:932,ncol(ndataSet)])
  predict3 <- predict(train3,ndataSet[933:1400,-ncol(ndataSet)])
  tab3 <- table(predict3,ndataSet[933:1400,ncol(ndataSet)])
  print(tab1)
  print(tab2)
  print(tab3)
  list <- list(tab1,tab2,tab3)
  return(list)
}

svm_radial <- function(ndataSet)
{
  train1 <- svm(ndataSet[-(1:466),-ncol(ndataSet)],ndataSet[-(1:466),ncol(ndataSet)])
  train2 <- svm(ndataSet[-(467:932),-ncol(ndataSet)],ndataSet[-(467:932),ncol(ndataSet)])
  train3 <- svm(ndataSet[-(933:1400),-ncol(ndataSet)],ndataSet[-(933:1400),ncol(ndataSet)])
  
  predict1 <- predict(train1,ndataSet[1:466,-ncol(ndataSet)])
  tab1 <- table(predict1,ndataSet[1:466,ncol(ndataSet)])
  predict2 <- predict(train2,ndataSet[467:932,-ncol(ndataSet)])
  tab2 <- table(predict2,ndataSet[467:932,ncol(ndataSet)])
  predict3 <- predict(train3,ndataSet[933:1400,-ncol(ndataSet)])
  tab3 <- table(predict3,ndataSet[933:1400,ncol(ndataSet)])
  print(tab1)
  print(tab2)
  print(tab3)
  list <- list(train1,train2,train3,predict1,predict2,predict3,tab1,tab2,tab3)
  return(list)
}
ndataSet <- as.data.frame(numeric())
i <- 1
j <- 701
for(m in 1:10)
{
  ndataSet <- rbind(ndataSet,dataSet_freq[i:(i+69),])
  ndataSet <- rbind(ndataSet,dataSet_freq[j:(j+69),])
  i <- i+70
  j <- j+70
}
svm.list <- svm_radial(ndataSet)