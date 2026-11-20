# =========================================================================
# MODULE 6: High-Dimensional Single-Cell RNA-Seq (scRNA-Seq)
# AUTHOR: Kuncha Shashidhar
# 
# ABOUT THE DATA:
# Format: .TSV, .MTX (Matrix Market), or .h5
# Description: Highly sparse, high-dimensional count matrices representing 
#              gene expression at the individual cell level. Requires specialized 
#              objects (like Seurat) to handle dimensionality reduction (UMAP) 
#              and memory efficiency.
# 
# WHERE TO FIND PUBLIC DATA:
# The Human Cell Atlas or Single Cell Portal (Broad Institute).
# URL: https://singlecell.broadinstitute.org/
# =========================================================================

library(Seurat)

cat("\n--- Loading Single-Cell Data ---\n")

# To run locally, uncomment the loader matching your file format:
# sc_matrix <- read.table("path/to/Combined_Count_Matrix.tsv", header = TRUE, row.names = 1)
# sc_matrix <- Read10X(data.dir = "path/to/10x_mtx_folder/")       # For .MTX (10x Genomics)
# sc_matrix <- Read10X_h5("path/to/filtered_feature_bc_matrix.h5") # For .h5

# Mock sparse single-cell count matrix so this script runs out of the box
set.seed(42)
sc_matrix <- matrix(
  rpois(30, lambda = 3),
  nrow = 6, ncol = 5,
  dimnames = list(
    c("tin", "Hand", "odd", "zfh1", "mt:CoI", "mt:ND1"),
    paste0("Cell_", 1:5)
  )
)

# Initialize the Seurat Object
seu_obj <- CreateSeuratObject(counts = sc_matrix, project = "Drosophila_Pericardial_Proj")

# Calculate mitochondrial QC metrics
# Note: Use "^mt:" for Drosophila, "^MT-" for Human, or "^mt-" for Mouse
seu_obj <- PercentageFeatureSet(seu_obj, pattern = "^mt:", col.name = "percent.mt")

print(seu_obj)
head(seu_obj@meta.data)
