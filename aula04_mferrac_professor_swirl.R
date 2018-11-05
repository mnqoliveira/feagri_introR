library(swirl)

Sys.Date()
mean(c(2,4,5))

boring_function <- function(x) {
  x
}

boring_function('My first function!')

#1. Everything that exists is an object.
#2. Everything that happens is a function call.

my_mean <- function(my_vector) {
  sum(my_vector)/length(my_vector)
}

my_mean(c(4,5,10))

remainder <- function(num, divisor=2) {
  num %% divisor
}

remainder(4, div=2)

evaluate <- function(func, dat){
  func(dat)
}

vec = c(1.4, 3.6, 7.9, 8.8)
evaluate(sd,c(1.4, 3.6, 7.9, 8.8))

evaluate(function(x){x+1},6)

evaluate(function(x){x[length(x)]},c(8,4,0))

paste("Programming", "is", "fun!")


telegram <- function(...){
  paste("START",...,"STOP")
} 

telegram('message')

mad_libs <- function(...){
  args = list(...)
  place = args[['place']]
  adjective = args[['adjective']]
  noun = args[['noun']]
  paste("News from", place, "today where", adjective, "students took to the streets in protest of the new", noun, "being installed on campus.")
}

mad_libs(place = 'Brazil', adjective = 'numerous', noun='security system')

"%p%" <- function(arg1,arg2){ # Remember to add arguments!
  paste(arg1,arg2)
}

'I' %p% 'love' %p% 'R!'
