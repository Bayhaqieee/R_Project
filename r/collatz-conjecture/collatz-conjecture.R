collatz_step_counter <- function(num) {
  if (any(num <= 0)) stop("Should be greater than 0")
  sapply(num, collatz_count_steps);
}

collatz_count_steps <- function(n, count=0) {
  if (n > 1) {
    n <- ifelse(n %% 2 == 0, n %/% 2, 3 * n + 1)
    count <- collatz_count_steps(n, count + 1)
  }
  count
}