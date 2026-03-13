# =========================================================================
# MODULE 2: NGS Raw Reads Import (FASTQ)
# AUTHOR: Kuncha Shashidhar
# 
# 🧬 ABOUT THE DATA:
# Format: .fastq or .fastq.gz
# Description: The standard output format from high-throughput sequencing 
#              machines (like Illumina). It stores both the biological sequence 
#              (nucleotides) and the corresponding Phred quality scores 
#              (accuracy) for each base.
# 
# 🔍 WHERE TO FIND PUBLIC DATA:
# National Center for Biotechnology Information (NCBI) Sequence Read Archive (SRA).
# URL: https://www.ncbi.nlm.nih.gov/sra
# European Nucleotide Archive
# URL: https://www.ebi.ac.uk/ena/browser/home
# =========================================================================

library(ShortRead)

cat("\n--- Loading Raw NGS Reads ---\n")

# To run locally, download a sample .fastq file from the SRA and replace the path:
raw_reads <- readBStringSet("path/to/your/reads.fastq", format="fastq", with.qualities=TRUE)

# View the number of reads loaded into memory
cat("Reads loaded:", length(raw_reads), "\n")
