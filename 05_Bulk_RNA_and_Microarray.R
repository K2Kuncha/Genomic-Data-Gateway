# =========================================================================
# MODULE 5: Bulk Transcriptomics & Microarray Matrices
# AUTHOR: Kuncha Shashidhar
# 
# 🧬 ABOUT THE DATA:
# Format: .txt, .csv, or .CEL (Microarray)
# Description: Raw or normalized count matrices where rows represent genes 
#              and columns represent samples. This is the foundational data 
#              structure for calculating differential gene expression.
# 
# 🔍 WHERE TO FIND PUBLIC DATA:
# NCBI Gene Expression Omnibus (GEO).
# URL: https://www.ncbi.nlm.nih.gov/geo/
# =========================================================================

library(limma)
library(DESeq2)

cat("\n--- Loading Transcriptomic Matrices ---\n")

# -------------------------------------------------------------------------
# A. Microarray Data Pipeline (limma)
# -------------------------------------------------------------------------
exprs_matrix <- read.table("path/to/microarray_expression.txt", header=TRUE, row.names=1)
design <- model.matrix(~ 0 + clinical_dat$condition)
fit <- lmFit(exprs_matrix, design)

# -------------------------------------------------------------------------
# B. Bulk RNA-Seq Pipeline (DESeq2)
# -------------------------------------------------------------------------
count_data <- read.csv("path/to/featureCounts_matrix.csv", row.names=1)
dds <- DESeqDataSetFromMatrix(countData = count_data,
                               colData = clinical_dat,
                               design = ~ condition)
