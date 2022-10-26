# Pairwise Distance
Calculate the pairwise levenshtein distance between haplotype sequences and plot a dendrogram.  
Input is a fasta file containing all sequences, last three character of the sequence names should identify the method. Output is a distance matrix in CSV format.

### How to run these scripts:  
`conda env create -f environment.yaml`  
`conda activate pairwise-align`  
`python PairwiseAlignment.py [input] [output]`
