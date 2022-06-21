from Bio import SeqIO
from Bio import pairwise2
from Bio.pairwise2 import format_alignment
from Levenshtein import distance
import numpy as np
import pandas as pd

distance_list = []
for entry1 in SeqIO.parse(open("pt4_dealigned.fa"), 'fasta'):
    for entry2 in SeqIO.parse(open("pt4_dealigned.fa"), 'fasta'):
        # num2+=1
        alignments = pairwise2.align.globalxx(entry1.seq.lower(), entry2.seq.lower())
        aln1 = alignments[0][0]
        aln2 = alignments[0][1]
        dist = distance(aln1, aln2)
        distance_list.append([entry1.id, entry2.id, dist])


array = np.array(distance_list)
df = pd.DataFrame(array, columns=['Seq1', 'Seq2', 'Distance'])
matrix = df.pivot(index='Seq1', columns='Seq2', values='Distance')
matrix.to_csv("DistanceMatrix_pt4.csv")







