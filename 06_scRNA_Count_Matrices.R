# =========================================================================
# MODULE 6: High-Dimensional Single-Cell RNA-Seq (scRNA-Seq)
# AUTHOR: Kuncha Shashidhar
# 
# 🧬 ABOUT THE DATA:
# Format: .TSV, .MTX (Matrix Market), or .h5
# Description: Highly sparse, high-dimensional count matrices representing 
#              gene expression at the individual cell level. Requires specialized 
#              objects (like Seurat) to handle dimensionality reduction (UMAP) 
#              and memory efficiency.
# 
# 🔍 WHERE TO FIND PUBLIC DATA:
# The Human Cell Atlas or Single Cell Portal (Broad Institute).
# URL: https://singlecell.broadinstitute.org/
# =========================================================================

library(Seurat)

cat("\n--- Loading Single-Cell Data ---\n")

# To run locally, load your combined count matrix (e.g., Combined_Count_Matrix.tsv)
sc_matrix <- read.table("path/to/Combined_Count_Matrix.tsv", header = TRUE, row.names = 1)

# Initialize the Seurat Object
seu_obj <- CreateSeuratObject(counts = sc_matrix, project = "Drosophila_Pericardial_Proj")

# Calculate mitochondrial QC metrics
seu_obj <- PercentageFeatureSet(seu_obj, pattern = "^mt-", col.name = "percent.mt")
