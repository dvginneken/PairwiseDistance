library("ape")
library(stringr)

args <- commandArgs()
matrix <- data.matrix(read.csv(args[6], header = TRUE, row.names = 1,
                   sep = ","))

id = factor(str_sub(colnames(matrix), -4, -1))
colors = factor(id, labels = c('#d7191c','#fdae61'))

pdf(file = paste0("Dendogram.pdf"),
    width = 16.5, height = 23.5, pointsize = 10)
plot(as.phylo(hclust(as.dist(matrix))), label.offset = 0.5, tip.color = as.vector(colors),
     root.edge = TRUE)
legend("topleft", legend = c("Method 3", "Method 4"),
       col = c('#d7191c','#fdae61'), cex = 0.8, lty = 1, lwd = 3)
add.scale.bar(x=0, y=0)
title(main = paste0("Dendrogram Pairwise Alignment"))
dev.off()
