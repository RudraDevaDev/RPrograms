mydata<-read.csv("C:/Users/RudraDevan G/Downloads/USArrests.csv")
head(mydata)
tail(mydata)
mydata$State
library(factoextra)
#Scales/standardizes the data
USdata <- scale(mydata[,1:4])
head(USdata)
#K-means clustering with 2, 3, 4 and 5 centers
kmeans.cluster_2 <- kmeans(USdata, centers = 2, nstart = 20)
kmeans.cluster_2
kmeans.cluster_3 <- kmeans(USdata, centers = 3, nstart = 20)
kmeans.cluster_3
kmeans.cluster_4 <- kmeans(USdata, centers = 4, nstart = 20)
kmeans.cluster_4
kmeans.cluster_5 <- kmeans(USdata, centers = 5, nstart = 20)
kmeans.cluster_5
kmeans.cluster_2$cluster
kmeans.cluster_3$cluster
kmeans.cluster_4$cluster
kmeans.cluster_5$cluster
print(fviz_cluster(kmeans.cluster_2, data = USdata))
print(fviz_cluster(kmeans.cluster_3, data = USdata))
print(fviz_cluster(kmeans.cluster_4, data = USdata))
print(fviz_cluster(kmeans.cluster_5, data = USdata))
#Creates a plot showing the silhouette and elbow methods in determining the amount of optimal centers.
print(fviz_nbclust(USdata, FUN = kmeans, method = "silhouette"))