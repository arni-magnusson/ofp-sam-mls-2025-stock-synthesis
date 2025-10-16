# Run analysis, write model results

# Before: ss3, ss3.exe (boot/software/ss3),
#         forecast.ss, starter.ss, control.ss, data.ss (boot/data/ss3)
# After:  CompReport.sso, covar.sso, Forecast-report.sso, Report.sso,
#         warning.sso, wtatage.ss_new (model)

library(TAF)

mkdir("model")

# Get model executable
exefile <- if(os.linux()) "ss3" else "ss3.exe"
cp(file.path("boot/software/ss3", exefile), "model")

# Get model input files
cp("boot/data/ss3/starter.ss", "model")
cp("boot/data/ss3/forecast.ss", "model")
cp("boot/data/ss3/control.ss", "model")
cp("boot/data/ss3/data.ss", "model")

# Run model
setwd("model")
system("./ss3 -cbs 2000000000 -gbs 5000000000 -maxfn 200")
setwd("..")
