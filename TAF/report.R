# Produce plots and tables for report

# Before: biology.csv, likelihoods.csv, stats.csv, timeseries_area.csv,
#         summary.csv (output)
# After:  biology.csv, likelihoods.csv, stats.csv, timeseries_area.png,
#         summary.csv (report)

library(TAF)

mkdir("report")

# Read tables
biology <- read.taf("output/biology.csv")
likelihoods <- read.taf("output/likelihoods.csv")
stats <- read.taf("output/stats.csv")
timeseries.area <- read.taf("output/timeseries_area.csv")
summary <- read.taf("output/summary.csv")

# Plot time series of SB
taf.png("timeseries")
plot(SB~Yr, timeseries.area, ylim=c(0,25e3), type="n", xlab="Year",
     ylab="Spawning biomass (t)", bty="n")
abline(h=seq(0, 25e3, 5e3), col="gray", lty=3)
box()
lines(SB~Yr, timeseries.area, subset=Area==1, lwd=3, col=5)
dev.off()

# Format tables
biology <- rnd(biology, c("M", "Len", "Wt", "Mat"), c(3, 1, 1, 3))
likelihoods <- data.frame(component=names(likelihoods),
                          value=unlist(likelihoods), row.names=NULL)
likelihoods <- rnd(likelihoods, "value", 3)
stats <- data.frame(info=names(stats), value=unlist(stats), row.names=NULL)
summary <- rnd(summary, c("Rec", "Catch", "TB", "SB"))
summary <- rnd(summary, c("F", "SB_SBmsy", "SB_SBF0", "F_Fmsy"), 2)
biology <- format(biology)          # retain trailing zeros
likelihoods <- format(likelihoods)  # retain trailing zeros
summary <- format(summary)          # retain trailing zeros

# Write tables
write.taf(biology, dir="report")
write.taf(likelihoods, dir="report")
write.taf(stats, dir="report", quote=TRUE)
write.taf(summary, dir="report")
