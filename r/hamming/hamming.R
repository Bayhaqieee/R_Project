# This is a stub function to take two strings
# and calculate the hamming distance
hamming <- function(strand1, strand2) {
    # Check if the strands are the same length
    if (nchar(strand1) != nchar(strand2)) {
        stop("The strands must be of equal length.")
    }
    
    # Initialize the distance
    distance <- 0
    
    # Loop through the strands and compare the characters
    for (i in 1:nchar(strand1)) {
        if (substr(strand1, i, i) != substr(strand2, i, i)) {
            distance <- distance + 1
        }
    }
    
    return(distance)
}
