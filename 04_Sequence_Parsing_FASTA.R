# =========================================================================
# MODULE 4: Sequence Parsing & Alignment Prep (FASTA)
# AUTHOR: Kuncha Shashidhar
# 
# 🧬 ABOUT THE DATA:
# Format: .fasta, .fa, or .fna
# Description: A text-based format representing either nucleotide sequences 
#              or amino acid (protein) sequences. It begins with a single-line 
#              description starting with ">", followed by lines of sequence data.
# 
# 🔍 WHERE TO FIND PUBLIC DATA:
# UniProt (for proteins) or NCBI Nucleotide.
# URL: https://www.uniprot.org/
# =========================================================================

library(Biostrings)

cat("\n--- Loading Sequence Data (FASTA) ---\n")

# To run locally, point to your FASTA file for downstream Multiple Sequence Alignment
dna_seqs <- readDNAStringSet("path/to/your/sequences.fasta")

# Print the sequence set to verify the headers and lengths
print(dna_seqs)
