# =========================================================================
# MODULE 2: NGS Raw Reads Import (FASTQ)
# AUTHOR: Kuncha Shashidhar
# 
# ABOUT THE DATA:
# Format: .fastq or .fastq.gz
# Description: The standard output format from high-throughput sequencing 
#              machines (like Illumina). It stores both the biological sequence 
#              (nucleotides) and the corresponding Phred quality scores 
#              (accuracy) for each base.
# 
# WHERE TO FIND PUBLIC DATA:
# National Center for Biotechnology Information (NCBI) Sequence Read Archive (SRA).
# URL: https://www.ncbi.nlm.nih.gov/sra
# European Nucleotide Archive
# URL: https://www.ebi.ac.uk/ena/browser/home
# =========================================================================

library(ShortRead)

cat("\n--- Loading Raw NGS Reads ---\n")

# To run locally on your own .fastq or .fastq.gz file, uncomment below:
# raw_reads <- readFastq("path/to/your/reads.fastq.gz")

# Mock 2-read FASTQ file so this script runs out of the box
mock_fastq <- tempfile(fileext = ".fastq")
writeLines(c(
  "@READ_1", "GATTTGGGGTTCAAAGCAGTATCGATCAAATAGTAAATCCATTTGTTCAACTCACAGTTT", "+", "IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII",
  "@READ_2", "GATTTGGGGTTCAAAGCAGTATCGATCAAATAGTAAATCCATTTGTTCAACTCACAGTTT", "+", "IIIIIIIIIIHHHHHHHHGGGGGFFFFFEEEEEDDDDDCCCCCBBBBBAAAAA@@@@@??"
), mock_fastq)

raw_reads <- readFastq(mock_fastq)

# View read count and Phred quality summary
cat("Reads loaded:", length(raw_reads), "\n")
cat("Average Phred quality per read:\n")
print(alphabetScore(quality(raw_reads)) / width(raw_reads))

Quick Phred quality interpretation (Q = -10 * log10(error_prob))
avg_q <- alphabetScore(quality(raw_reads)) / width(raw_reads)
qc_status <- ifelse(avg_q >= 30, "PASS (High Quality, >=99.9% accuracy)",
             ifelse(avg_q >= 20, "WARN (Moderate, consider trimming)",
                                 "FAIL (Low Quality, filter/trim)"))

data.frame(Read = as.character(id(raw_reads)), Avg_Phred = round(avg_q, 1), QC = qc_status)

# QC INTERPRETATION GUIDE:
# Official FastQC Analysis Modules (Per-Base Quality, GC Content, Adapters, etc.):
# https://www.bioinformatics.babraham.ac.uk/projects/fastqc/Help/3%20Analysis%20Modules/
