# =========================================================================
# MODULE 3: Spatial Genomics & Epigenomics (BED)
# AUTHOR: Kuncha Shashidhar
# 
# ABOUT THE DATA:
# Format: .bed (Browser Extensible Data)
# Description: A text-based format used to define genomic regions/coordinates. 
#              It utilizes a 0-based coordinate system. Commonly used to 
#              annotate R-loop forming regions, ChIP-Seq peaks, or structural 
#              variants mapped to a specific reference genome (e.g., hg19/hg38).
# 
# WHERE TO FIND PUBLIC DATA:
# UCSC Genome Browser or the ENCODE Project.
# URL: https://genome.ucsc.edu/
# =========================================================================

library(rtracklayer)

cat("\n--- Loading Genomic Coordinates (BED) ---\n")

# To run locally on your own BED file (e.g., hg19.rloop.filtered.bed), uncomment below:
# genomic_regions <- import("path/to/your/regions.bed", format = "BED")

# Mock BED file (0-based coordinates) so this script runs out of the box
mock_bed <- tempfile(fileext = ".bed")
writeLines(c(
  "chr1\t10000\t10500\tRloop_Peak_1\t100\t+",
  "chr2\t25000\t25800\tRloop_Peak_2\t85\t-",
  "chrX\t50000\t50600\tRloop_Peak_3\t92\t+"
), mock_bed)

genomic_regions <- import(mock_bed, format = "BED")

# Inspect the GRanges object and chromosomes present
print(genomic_regions)
cat("\nChromosomes present:\n")
print(seqlevels(genomic_regions))
