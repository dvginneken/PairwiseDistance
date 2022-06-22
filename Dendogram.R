library("ape")
library(stringr)

matrix <- data.matrix(read.csv("DistanceMatrix_consensus_pt4.csv", header = TRUE, row.names = 1,
                   sep = ","))


##Change names###################################################################
names <- read.csv("DistanceMatrix_consensus_pt4.csv", header=FALSE, nrows = 1)
names <- as.character(names)[2:length(names)]
colnames(matrix) <- names
name_table = "C:/Users/Daphne/OneDrive - UMC Utrecht/Samples/MasterTable_manipulated.tsv"
df = data.frame(colnames(matrix))
colnames(df) <- "Raw Filename"
#read table with names and select columns
mastertable = read.table(name_table, sep = "\t", header = TRUE)
mastertable = dplyr::select(mastertable, Raw.Filenames, name)
#remove extension from raw filenames
mastertable$Raw.Filenames = str_sub(mastertable$Raw.Filenames, 1, -17)
#change columnnames
colnames(mastertable) = c("Raw Filename", "name")
#join treelabel and name df by "Raw Filename"
df_joined = dplyr::left_join(df, mastertable, by = "Raw Filename")
colnames(matrix) <- df_joined$name 
rownames(matrix) <- df_joined$name
#################################################################################


id = factor(substring(colnames(matrix), 1, 4))
colors = factor(id, labels = c('#fcbba1','#fc9272','#fb6a4a','#ef3b2c','#cb181d','#99000d', 
                               '#253494', '#253494', '#66c2a4','#00441b'))
plot(as.phylo(hclust(as.dist(matrix))), label.offset = 0.5, tip.color = as.vector(colors),
     root.edge = TRUE)
add.scale.bar(x=0, y=0)
title(main = paste0("Dendogram pt4 Pairwise Alignment Sample Consensus"))
legend(x=-3, y=41, legend = c("Prior to ART", "4 weeks after ART", "8 weeks after ART",
                                 "12 weeks after ART", "16 weeks after ART", "24 weeks after ART",
                                 "58 weeks after ART", "10 years after ART", "20 year after ART"),
       col = c('#253494', '#fcbba1','#fc9272','#fb6a4a','#ef3b2c','#cb181d','#99000d',
               '#66c2a4','#00441b'), cex = 0.8, lty = 1, lwd = 3)
