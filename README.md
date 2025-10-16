# MLS 2024 Revised Stock Synthesis Model

Download MLS 2024 revised assessment report:
- **Revised 2024 stock assessment of striped marlin in the southwestern Pacific Ocean: Part 1 - integrated assessment in Stock Synthesis**\
  **[WCPFC-SC21-2025/SA-WP-06](https://meetings.wcpfc.int/node/26682)**
  **Note:** This assessment was not used for management advice.

Download MLS 2024 revised Stock Synthesis model:
- Clone the **[mls-2025-stock-synthesis](https://github.com/PacificCommunity/ofp-sam-mls-2025-stock-synthesis)** repository or download as **[main.zip](https://github.com/PacificCommunity/ofp-sam-swo-2025-diagnostic/archive/refs/heads/main.zip)** file

## Explore data, model settings, and results

The `ss3.zip` archive includes all the Stock Synthesis (SS3) input files, model settings, and output files. 

The **TAF** folder extracts the data and results from SS3 format to CSV format that can be examined using Excel, R, or other statistical software. [TAF](https://cran.r-project.org/package=TAF) is a standard reproducible format for stock assessments that is practical for making the SS3 **[data](TAF/data)** and **[output](TAF/output)** tables available in a format that is easy to examine. The **[report](TAF/report)** folder contains formatted tables and example plots.

## Run the assessment model

The MLS 2024 revised Stock Synthesis model takes around 20 minutes to run. Executables are provided for Windows and Linux.

### Run in TAF format

Anyone can run the assessment analysis in TAF format. First, install TAF and r4ss if they are not already installed:
```r
install.packages("TAF")
remotes::install_github("r4ss/r4ss")
```

The full assessment model can be run as a TAF analysis. Start R, make sure the TAF folder is the working directory, and then run:
```r
library(TAF)
taf.boot()
source.taf("data.R")
source.taf("model_full.R")
source.taf("model_rds.R")
source.taf("output.R")
source.taf("report.R")
```

A shortcut script is provided to run the TAF analysis in 1 minute rather than 20 minutes:
```r
library(TAF)
taf.boot()
source.taf("data.R")
source.taf("model.R")
source.taf("output.R")
source.taf("report.R")
```

The TAF shortcut analysis runs on all platforms: Windows, Linux, and macOS. It extracts the data and output from the SS3 files and makes them available as CSV files that can be examined and analyzed further.
