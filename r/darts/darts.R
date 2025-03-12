score <- function(x, y) {
    # Calculate the distance from the center
    distance <- sqrt(x^2 + y^2)
    
    # Determine the score
    if (distance <= 1) {
        return(10)
    } else if (distance <= 5) {
        return(5)
    } else if (distance <= 10) {
        return(1)
    } else {
        return(0)
    }
}
