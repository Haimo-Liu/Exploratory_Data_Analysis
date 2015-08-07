#SVD: u matrix (each vector) explains data variability from row perspective, according to observations# 
#v matrix (each vector) explains data variability from column perspective, according to features#
#D represents variance explained (how many vectors are enough to represent the original data)#
#needs to scale the matrix first, subtract mean and divide by std#

getwd()
load('./clusteringEx_data/data/samsungData.rda')

sub1 = subset(samsungData, subject == 1)
sub1$activity = factor(sub1$activity)
par(mfrow = c(1, 2))
plot(sub1[, 1], col = sub1$activity, ylab = names(sub1)[1])
legend('bottomright', legend = unique(sub1$activity), col = unique(sub1$activity), pch = 1)
plot(sub1[, 2], col = sub1$activity, ylab = names(sub1)[2])
legend('bottomright', legend = unique(sub1$activity), col = unique(sub1$activity), pch = 1)

source('myplclust.R')
clustm = dist(sub1[, 1:3])
hclustering = hclust(clustm)
myplclust(hclustering, lab.col = unclass(sub1$activity))


svd1 = svd(scale(sub1[, -c(562, 563)]))
plot(svd1$d^2/sum(svd1$d^2), pch = 19, xlab = 'singular vector', ylab = 'variance explained')
plot(svd1$u[, 1], col = sub1$activity, pch = 19)

maxcontri1 = which.max(svd1$v[, 1])
maxcontri2 = which.max(svd1$v[, 2])
distmatrix = dist(sub1[, c(10:12, maxcontri2)])
hclustering = hclust(distmatrix)
myplclust(hclustering, lab.col = unclass(sub1$activity))


#k-means clustering#


kcluster = kmeans(sub1[, -c(562, 563)], centers = 6)
names(kcluster)
table(kcluster$cluster, sub1$activity)


kcluster = kmeans(sub1[, -c(562, 563)], centers = 6, nstart = 1)
names(kcluster)
table(kcluster$cluster, sub1$activity)


kcluster = kmeans(sub1[, -c(562, 563)], centers = 6, nstart = 100)
names(kcluster)
table(kcluster$cluster, sub1$activity)
