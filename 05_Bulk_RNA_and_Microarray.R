# =========================================================================
# MODULE 5: Bulk Transcriptomics & Microarray Matrices
# AUTHOR: Kuncha Shashidhar
# 
# ABOUT THE DATA:
# Format: .txt, .csv, or .CEL (Microarray)
# Description: Raw or normalized count matrices where rows represent genes 
#              and columns represent samples. This is the foundational data 
#              structure for calculating differential gene expression.
# 
# WHERE TO FIND PUBLIC DATA:
# NCBI Gene Expression Omnibus (GEO).
# URL: https://www.ncbi.nlm.nih.gov/geo/
# =========================================================================

library(limma)
library(DESeq2)

cat("\n--- Loading Transcriptomic Matrices ---\n")

# Mock sample metadata (swap in your cleaned clinical_dat from Module 1)
clinical_dat <- data.frame(
  condition = factor(c("Control", "Control", "Disease", "Disease")),
  row.names = c("Sample_1", "Sample_2", "Sample_3", "Sample_4")
)

# -------------------------------------------------------------------------
# A. Microarray Data Pipeline (limma)
# -------------------------------------------------------------------------
# To run locally:
# exprs_matrix <- read.table("path/to/microarray_expression.txt", header = TRUE, row.names = 1)

# Mock log2-normalized expression matrix
exprs_matrix <- matrix(
  c(7.2, 7.5, 9.8, 10.1,
    5.1, 5.3, 4.9, 5.0,
    8.4, 8.2, 6.1, 5.9),
  nrow = 3, byrow = TRUE,
  dimnames = list(c("GeneA", "GeneB", "GeneC"), rownames(clinical_dat))
)

design <- model.matrix(~ 0 + clinical_dat$condition)
fit <- lmFit(exprs_matrix, design)
cat("limma linear model fit complete.\n")

# -------------------------------------------------------------------------
# B. Bulk RNA-Seq Pipeline (DESeq2)
# -------------------------------------------------------------------------
# To run locally:
# count_data <- read.csv("path/to/featureCounts_matrix.csv", row.names = 1)

# Mock raw integer count matrix
count_data <- matrix(
  c(120, 135, 450, 480,
    300, 290, 310, 295,
    500, 520, 110, 105),
  nrow = 3, byrow = TRUE,
  dimnames = list(c("GeneA", "GeneB", "GeneC"), rownames(clinical_dat))
)

# Crucial sanity check: sample order must match between counts and metadata
stopifnot(all(rownames(clinical_dat) == colnames(count_data)))

dds <- DESeqDataSetFromMatrix(countData = count_data,
                              colData = clinical_dat,
                              design = ~ condition)
print(dds)
