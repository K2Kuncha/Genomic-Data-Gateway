# =========================================================================
# MODULE 3: Spatial Genomics & Epigenomics (BED)
# AUTHOR: Kuncha Shashidhar
# 
# 🧬 ABOUT THE DATA:
# Format: .bed (Browser Extensible Data)
# Description: A text-based format used to define genomic regions/coordinates. 
#              It utilizes a 0-based coordinate system. Commonly used to 
#              annotate R-loop forming regions, ChIP-Seq peaks, or structural 
#              variants mapped to a specific reference genome (e.g., hg19/hg38).
# 
# 🔍 WHERE TO FIND PUBLIC DATA:
# UCSC Genome Browser or the ENCODE Project.
# URL: https://genome.ucsc.edu/
# =========================================================================

library(rtracklayer)

cat("\n--- Loading Genomic Coordinates (BED) ---\n")

# To run locally, replace the path with your BED file (e.g., hg19.rloop.filtered.bed)
genomic_regions <- import("path/to/your/regions.bed", format = "BED")

# View the chromosomes present in the dataset
seqlevels(genomic_regions)
