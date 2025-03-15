number_type <- function(n){
    if(n < 1) stop("Number must be > 0")
    x <- 1:(n-1)
    x <- x[n %% x == 0]
    al_sum <- sum(x)
    
    if(length(x) == 2 || n == 1) return("deficient")
    if(al_sum == n) "perfect"
    else if(al_sum > n) "abundant"
    else "deficient"
}