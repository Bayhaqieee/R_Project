sieve <- function(limit) {
  primes <- c()
  nums <- seq_len(limit)
  prime_candidates <- nums
  for (i in nums) {
    if (i %in% prime_candidates & i > 1) {
      i_multiples <- i * (1:((limit %/% i) + 1))
      prime_candidates <- setdiff(prime_candidates, i_multiples)
      primes <- c(primes, i_multiples[1])
    }
  }
  primes <- setdiff(primes, 1)
  if (length(primes) == 0) {
    return(c())
  }
  primes
}