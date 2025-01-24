num=readline("Enter a Number:")
num=as.integer(num)
factorial=1
if(num<0){
   print("Factorial does not exisit")
} else if(num==0){
  print("Factorial of 0 is 1")
} else{
  for(i in 1:num){
    factorial=factorial*i
  }
  print(paste("Factorial of the Given Number:" ,factorial))
}
