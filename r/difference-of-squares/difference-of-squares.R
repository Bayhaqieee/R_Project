# this is a stub function that takes a natural_number
# and should return the difference-of-squares as described
# in the README.md
difference_of_squares <- function(natural_number) {
  square_of_sum <- sum(1:natural_number)^2
  sum_of_squares <- sum((1:natural_number)^2)
  
  return(square_of_sum - sum_of_squares)
}
