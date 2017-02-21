# this code computes the persis homology of noisy sine
pop <- 10000
sampleSize <- 1000
df_1varnoise <- sampleNoiseySine(pop,sampleSize)
df_2varnoise <- sampleNoiseySine(pop,sampleSize, noiseIndep = TRUE)


library("TDA")
Xlim <- c(-2,8)
Ylim <- c(-4,4)
by <- 0.05
Xseq <- seq(Xlim[1], Xlim[2], by = by)
Yseq <- seq(Ylim[1], Ylim[2], by = by)
Grid <- expand.grid(Xseq, Yseq)

# Let's find out what it can do with noise in 1-d
# create confidence interval band
h <- 0.3
band <- bootstrapBand(X = df_1varnoise, FUN = kde, Grid = Grid, B = 100, parallel = FALSE, alpha = 0.1, h = h)
# compute persistent homology
Diag <- gridDiag(X = df_1varnoise, FUN = kde, h = .5, lim = cbind(Xlim, Ylim), by = by, sublevel = TRUE, library = "Dionysus", printProgress = TRUE)
plot(Diag[["diagram"]], band = band[["width"]], main = "KDE Diagram")
# nice it tells us we have 1 c.c. and 1 tunnel

# Let's see what it does with noise in 2-d
# create confidence interval band
h <- 0.3
band <- bootstrapBand(X = df_1varnoise, FUN = kde, Grid = Grid, B = 100, parallel = FALSE, alpha = 0.1, h = h)

Diag <- gridDiag(X = df_1varnoise, FUN = kde, h = .5, lim = cbind(Xlim, Ylim), by = by, sublevel = TRUE, library = "Dionysus", printProgress = TRUE)
plot(Diag[["diagram"]], band = band[["width"]], main = "KDE Diagram")
