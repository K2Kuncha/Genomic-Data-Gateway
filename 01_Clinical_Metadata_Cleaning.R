# =========================================================================
# MODULE 1: Clinical Metadata & Phenotypic Cleaning
# AUTHOR: Kuncha Shashidhar
# 
# 🧬 ABOUT THE DATA:
# Format: .csv, .tsv, or .txt 
# Description: Tabular data connecting molecular findings to patient 
#              phenotypes, experimental conditions, or clinical outcomes. 
#              Often requires heavy cleaning to standardize nomenclature 
#              and handle missing values before statistical modeling.
# 
# 🔍 WHERE TO FIND PUBLIC DATA:
# cBioPortal for Cancer Genomics or NCBI Gene Expression Omnibus (GEO) Metadata.
# URL: https://www.cbioportal.org/
# =========================================================================

library(tidyverse)

cat("\n--- Loading & Cleaning Clinical Metadata ---\n")

# To run locally, replace the path with your clinical dataset (e.g., DRGenedata.csv)
# clinical_dat <- read_csv("path/to/your/clinical_data.csv") %>%
#   
#   # Standardize column names (lowercase, replace spaces with underscores)
#   rename_with(~ tolower(gsub(" ", "_", .x))) %>%
#   
#   # Remove patients/samples with missing phenotypic conditions
#   drop_na(condition) %>%
#   
#   # Filter for specific cohorts (e.g., Disease vs. Normal)
#   filter(condition %in% c("Disease_State", "Control")) %>%
#   
#   # Convert character columns to factors for linear modeling (lm)
#   mutate(condition = as.factor(condition))

# summary(clinical_dat)
