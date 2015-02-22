library("e1071")
ndataSet <- as.data.frame(numeric())
i <- 1
j <- 701
for(m in 1:5)
{
  ndataSet <- rbind(ndataSet,dataSet[i:(i+139),])
  ndataSet <- rbind(ndataSet,dataSet[j:(j+139),])
  i <- i+140
  j <- j+140
}

train1 <- naiveBayes(ndataSet[-(1:280),-ncol(ndataSet)],ndataSet[-(1:280),ncol(ndataSet)])
train2 <- naiveBayes(ndataSet[-(281:560),-ncol(ndataSet)],ndataSet[-(281:560),ncol(ndataSet)])
train3 <- naiveBayes(ndataSet[-(561:840),-ncol(ndataSet)],ndataSet[-(561:840),ncol(ndataSet)])
train4 <- naiveBayes(ndataSet[-(841:1120),-ncol(ndataSet)],ndataSet[-(841:1120),ncol(ndataSet)])
train5 <- naiveBayes(ndataSet[-(1121:1400),-ncol(ndataSet)],ndataSet[-(1121:1400),ncol(ndataSet)])

predict1 <- predict(train1,ndataSet[1:280,-ncol(ndataSet)])
tab1 <- table(predict1,ndataSet[1:280,ncol(ndataSet)])
predict2 <- predict(train2,ndataSet[281:560,-ncol(ndataSet)])
tab2 <- table(predict2,ndataSet[281:560,ncol(ndataSet)])
predict3 <- predict(train3,ndataSet[561:840,-ncol(ndataSet)])
tab3 <- table(predict3,ndataSet[561:840,ncol(ndataSet)])
predict4 <- predict(train4,ndataSet[841:1120,-ncol(ndataSet)])
tab4 <- table(predict4,ndataSet[841:1120,ncol(ndataSet)])
predict5 <- predict(train5,ndataSet[1121:1400,-ncol(ndataSet)])
tab5 <- table(predict5,ndataSet[1121:1400,ncol(ndataSet)])