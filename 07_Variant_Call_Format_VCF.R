# =========================================================================
# MODULE 7: Genomic Variant Call Format (VCF)
# AUTHOR: Kuncha Shashidhar
# 
# ABOUT THE DATA:
# Format: .vcf or .vcf.gz
# Description: The standard text file format for storing gene sequence 
#              variations (SNPs, indels, structural variants). It contains 
#              meta-information lines, a header line, and data lines 
#              detailing the chromosomal coordinate, reference allele, 
#              and alternate allele.
# 
# WHERE TO FIND PUBLIC DATA:
# dbSNP or The 1000 Genomes Project.
# URL: https://www.ncbi.nlm.nih.gov/snp/
# =========================================================================

library(VariantAnnotation)

cat("\n--- Loading Variant Call Format Data ---\n")

# To run locally on your own .vcf or .vcf.gz file, uncomment below:
# vcf_file <- "path/to/patient_variants.vcf"

# Mock VCF file so this script runs out of the box
vcf_file <- tempfile(fileext = ".vcf")
writeLines(c(
  "##fileformat=VCFv4.2",
  "##FORMAT=<ID=GT,Number=1,Type=String,Description=\"Genotype\">",
  "##FORMAT=<ID=GQ,Number=1,Type=Integer,Description=\"Genotype Quality\">",
  "#CHROM\tPOS\tID\tREF\tALT\tQUAL\tFILTER\tINFO\tFORMAT\tSample_1",
  "chr1\t10500\trs12345\tA\tG\t99\tPASS\t.\tGT:GQ\t0/1:95",
  "chr2\t24800\trs67890\tC\tT\t85\tPASS\t.\tGT:GQ\t1/1:88"
), vcf_file)

vcf_data <- readVcf(vcf_file, "hg38")

# Extract genomic ranges, alleles, and genotype qualities
snp_info <- rowRanges(vcf_data)
print(snp_info)

cat("\nGenotype Qualities (GQ):\n")
print(geno(vcf_data)$GQ)
