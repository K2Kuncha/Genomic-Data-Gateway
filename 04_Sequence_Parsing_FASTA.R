# =========================================================================
# MODULE 4: Sequence Parsing & Alignment Prep (FASTA)
# AUTHOR: Kuncha Shashidhar
# 
# ABOUT THE DATA:
# Format: .fasta, .fa, or .fna
# Description: A text-based format representing either nucleotide sequences 
#              or amino acid (protein) sequences. It begins with a single-line 
#              description starting with ">", followed by lines of sequence data.
# 
# WHERE TO FIND PUBLIC DATA:
# UniProt (for proteins) or NCBI Nucleotide.
# URL: https://www.uniprot.org/
# =========================================================================

library(Biostrings)

cat("\n--- Loading Sequence Data (FASTA) ---\n")

# To run locally on your own FASTA file, uncomment the matching line below:
# dna_seqs <- readDNAStringSet("path/to/your/sequences.fasta")   # For DNA (.fna / .fa)
# aa_seqs  <- readAAStringSet("path/to/your/proteins.fasta")     # For Proteins (.faa / .fasta)

# Mock FASTA file so this script runs out of the box
mock_fasta <- tempfile(fileext = ".fasta")
writeLines(c(
  ">GeneA_Human", "ATGGCCATTGTAATGGGCCGCTGAAAGGGTGCCCGATAG",
  ">GeneA_Mouse", "ATGGCCATTGTAATGGGCCGCTGAAAGGGTGCCCGATAA",
  ">GeneA_Fly",   "ATGGCCATTGTGATGGGCCGCTGAAAGGGTGCGCGATAG"
), mock_fasta)

dna_seqs <- readDNAStringSet(mock_fasta)

# Print the sequence set to verify headers, widths, and nucleotide content
print(dna_seqs)
cat("\nGC Content (%):\n")
print(round(letterFrequency(dna_seqs, letters = "GC", as.prob = TRUE) * 100, 1))
