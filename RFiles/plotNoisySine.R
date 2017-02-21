# this code tests the noisySin function

pop <- 1000
sampleSize <- 100
df_1varnoise <- sampleNoiseySine(pop,sampleSize)
df_2varnoise <- sampleNoiseySine(pop,sampleSize, noiseIndep = TRUE)

# generate sine curve
t <- seq(0,2*pi, , 200)
y <- sin(t)

# plot graphes side by side
par(mfrow=c(2,1)) 
# plot 1 var noise overlayed with curve
plot(df_1varnoise$indep, df_1varnoise$depSample, xlab = "x", ylab = "y", main = "Sine curve dep. noise")
lines(t,y, col="red")
#plot 2 var noise overlayed with sine curve
plot(df_2varnoise$indepSample, df_2varnoise$depSample, xlab = "x", ylab = "y", main = "Sine curve dep. & indep. noise")
lines(t,y, col="red")
