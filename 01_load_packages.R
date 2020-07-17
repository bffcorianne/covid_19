
#### 01_load_packages

# Load necessary packages
pacman::p_load(tidyverse, # manipulation, cleansing, modeling, graphs
               devtools,  # installing packages from source where necessary (tidytuesdayR)
               Hmisc,     # EDA summaries, cleansing. describe(), 
               hms,       # fixing dates
               lubridate, # working with dates
               # DataExplorer,
               moderndive,
               summarytools)

options(scipen = 20)

