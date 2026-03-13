# =========================================================================
# MODULE 7: Genomic Variant Call Format (VCF)
# AUTHOR: Kuncha Shashidhar
# 
# 🧬 ABOUT THE DATA:
# Format: .vcf or .vcf.gz
# Description: The standard text file format for storing gene sequence 
#              variations (SNPs, indels, structural variants). It contains 
#              meta-information lines, a header line, and data lines 
#              detailing the chromosomal coordinate, reference allele, 
#              and alternate allele.
# 
# 🔍 WHERE TO FIND PUBLIC DATA:
# dbSNP or The 1000 Genomes Project.
# URL: https://www.ncbi.nlm.nih.gov/snp/
# =========================================================================

library(VariantAnnotation)

cat("\n--- Loading Variant Call Format Data ---\n")

# To run locally, point to your VCF file and specify the reference genome
vcf_file <- "path/to/patient_variants.vcf"
vcf_data <- readVcf(vcf_file, "hg38")

# Extract the genomic ranges and alleles for downstream mapping
snp_info <- rowRanges(vcf_data) 
print(snp_info)
