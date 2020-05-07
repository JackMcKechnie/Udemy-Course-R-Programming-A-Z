n <- 1000000
count <- 0 

for(i in 1:n){
  random <- rnorm(1)
  if(random < 1 & random > -1){
    count <- count + 1
  }
  rm(random)
}

(count/n)*100



