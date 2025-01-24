x<-as.integer(readline(“Enter first number:”))
y<-as.integer(readline(“Enter second number:”))
z<-as.integer(readline(“Enter third number:”))
if (x > y && x > z) {
  print(paste("The greatest number is:", x))
} else if (y > x && y > z) {
  print(paste("The greatest number is:", y))
} else {
  print(paste("The greatest number is:", z))
}
