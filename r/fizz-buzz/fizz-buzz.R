fizz_buzz <- function(n) {
  res <- c()
  for (i in 1:n) {
    if (i %% 15 == 0) {
      res <- append(res, "Fizz Buzz")
    } else if (i %% 3 == 0) {
      res <- append(res, "Fizz")
    } else if (i %% 5 == 0) {
      res <- append(res, "Buzz")
    } else {
      res <- append(res, as.character(i))
    }
  }
  res
}