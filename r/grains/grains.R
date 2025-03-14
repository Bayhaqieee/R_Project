square <- function(n) {
    if (n > 0 && n <= 64){
        2^(n - 1) 
    } 
    else stop("Square: n must be between 1 and 64")
}

total <- function() {
    sum(sapply(1:64, square))
}
