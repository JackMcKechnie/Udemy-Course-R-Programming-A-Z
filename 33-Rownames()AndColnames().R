#Named vectors
Charlie <- 1:5
Charlie

#Give names
names(Charlie) <- c("a","b","c","d","e")
Charlie
Charlie["d"]
names(Charlie)

#clear names
names(Charlie) <- NULL
Charlie

#---------------

#Naming matrix dimesions 1
temp.vec <- rep(c("a","B","zZ"),each=3)
temp.vec

Bravo <- matrix(temp.vec,3,3)
Bravo

rownames(Bravo) <- c("How","are","you?")
Bravo

colnames(Bravo) <- c("x","y","z")
Bravo

Bravo["are","y"] <- 0
Bravo

rownames(Bravo) <- NULL
Bravo
