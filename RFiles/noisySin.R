# this script generates a sin with stanf=ewq=noise and then contains a function that selects a random sample from the noisy sine curve
#####
#
# Inputs
# pop = size of data to sample from
# sampleSize = size of sampled data to return
# noiseIndep optional argument 
#   DEFAULT: if FALSE outputs just a data frame with no noise in independent variable and noise in dependent variable
#   if TRUE a data frame will be returned with the independently sampled data in the first column and the dependent sample in the second column


sampleNoiseySine <- function(pop, sampleSize, startInt=0, endInt=2*pi, noiseIndep = FALSE){
  # initilize variables
  set.seed(1)
  t <- seq(startInt, endInt,, pop)   # if you don't want noise added to each data point change "n"
  noise_y <- rnorm(pop,0,1)
  noise_x <- rnorm(pop,0,1)
  
  # calculate function with noise only in dependent variable
  y_noiseDep <- sin(t) + noise_y
  # create sample index
  index <- 1:pop
  sampleIndex <- sample(index, sampleSize, replace = FALSE)
  # calculate noise in independent variable
  if (noiseIndep==TRUE){
    t_noise <- t + noise_x
    indepSample <- t_noise[sampleIndex]
    depSample <- y_noiseDep[sampleIndex]
    df <- data.frame(indepSample,depSample)
    return(df)
  } else {
    depSample <- y_noiseDep[sampleIndex]
    indep <- t[sampleIndex]
    df <- data.frame(indep,depSample)
    return(df)
  }
}  
  
  
  