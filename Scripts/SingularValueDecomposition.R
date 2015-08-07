#SVD: u matrix (each vector) explains data variability from row perspective, according to observations# 
#v matrix (each vector) explains data variability from column perspective, according to features#
#D represents variance explained (how many vectors are enough to represent the original data)#
#needs to scale the matrix first, subtract mean and divide by std#

#use impute (library(impute)) to fill up missing values before running SVD#
#impute.knn(YourMatrix)#





dataMatrix = matrix(rnorm(400), nrow = 40)
image(1:10, 1:40, t(dataMatrix)[, nrow(dataMatrix):1])

set.seed(678910)
for (i in 1:40) {
    # flip a coin
    coinFlip <- rbinom(1, size = 1, prob = 0.5)
    # if coin is heads add a common pattern to that row
    if (coinFlip) {
        dataMatrix[i, ] <- dataMatrix[i, ] + rep(c(0, 3), each = 5)
    }
}
image(1:10, 1:40, t(dataMatrix)[, nrow(dataMatrix):1])


hh <- hclust(dist(dataMatrix))
dataMatrixOrdered <- dataMatrix[hh$order, ]
par(mfrow = c(1, 3))
image(t(dataMatrixOrdered))
plot(rowMeans(dataMatrixOrdered), 40:1, , xlab = "Row Mean", ylab = "Row", pch = 19)
plot(colMeans(dataMatrixOrdered), xlab = "Column", ylab = "Column Mean", pch = 19)



constantMatrix <- dataMatrixOrdered*0
for(i in 1:dim(dataMatrixOrdered)[1]){constantMatrix[i,] <- rep(c(0,1),each=5)}
svd1 <- svd(constantMatrix)






#face example#
setwd('~/R_study/Exploratory')
load('./face.rda')
image(t(faceData)[, nrow(faceData):1])
image(t(scale(faceData))[, nrow(faceData):1]) #use scale to subtract background#
svd1 = svd(scale(faceData))
plot(svd1$d^2/sum(svd1$d^2), pch =19, xlab = 'Singular Vector', ylab = 'Explained Variance')

approx5 = svd1$u[, 1:5] %*% diag(svd1$d[1:5]) %*% t(svd1$v[, 1:5])
approx10 = svd1$u[, 1:10] %*% diag(svd1$d[1:10]) %*% t(svd1$v[, 1:10])

par(mfrow = c(1, 3))
image(t(approx5)[, nrow(approx5): 1], main = '5 vectors')
image(t(approx10)[, nrow(approx10): 1], main = '10 vectors')
image(t(faceData)[, nrow(faceData): 1], main = 'all vectors')