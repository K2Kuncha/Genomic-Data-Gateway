# =========================================================================
# MODULE 1: Clinical Metadata & Phenotypic Cleaning
# AUTHOR: Kuncha Shashidhar
# 
# ABOUT THE DATA:
# Format: .csv, .tsv, or .txt 
# Description: Tabular data connecting molecular findings to patient 
#              phenotypes, experimental conditions, or clinical outcomes. 
#              Often requires heavy cleaning to standardize nomenclature 
#              and handle missing values before statistical modeling.
# 
# WHERE TO FIND PUBLIC DATA:
# cBioPortal for Cancer Genomics or NCBI Gene Expression Omnibus (GEO) Metadata.
# URL: https://www.cbioportal.org/
# =========================================================================

library(tidyverse)

cat("\n--- Loading & Cleaning Clinical Metadata ---\n")

# Helper function to read .csv, .tsv, or delimited .txt files automatically
load_clinical_data <- function(file_path, delim = "\t") {
  ext <- tolower(tools::file_ext(file_path))
  
  if (ext == "csv") {
    read_csv(file_path, show_col_types = FALSE)
  } else if (ext == "tsv") {
    read_tsv(file_path, show_col_types = FALSE)
  } else if (ext == "txt") {
    read_delim(file_path, delim = delim, show_col_types = FALSE)
  } else {
    stop("Unsupported file format. Please provide a .csv, .tsv, or .txt file.")
  }
}

# To run on your own data, uncomment the matching line below:
# raw_clinical <- load_clinical_data("path/to/clinical_data.csv")
# raw_clinical <- load_clinical_data("path/to/clinical_data.tsv")
# raw_clinical <- load_clinical_data("path/to/clinical_data.txt", delim = "\t") # or delim = " " / ";"

# Mock clinical dataset so this script runs out of the box
raw_clinical <- tibble(
  `Sample ID` = c("PT01", "PT02", "PT03", "PT04", "PT05"),
  `Condition` = c("Disease_State", "Control", NA, "Disease_State", "Excluded_Cohort"),
  `Age At Diagnosis` = c(54, 48, 61, 59, 42)
)

clinical_dat <- raw_clinical %>%
  # Standardize column names (lowercase, replace spaces with underscores)
  rename_with(~ tolower(gsub(" ", "_", .x))) %>%
  
  # Remove patients/samples with missing phenotypic conditions
  drop_na(condition) %>%
  
  # Filter for specific cohorts (e.g., Disease vs. Control)
  filter(condition %in% c("Disease_State", "Control")) %>%
  
  # Convert character columns to factors for linear modeling (lm)
  mutate(condition = as.factor(condition))

print(clinical_dat)
summary(clinical_dat)
summary(clinical_dat)
str(clinical_dat)
