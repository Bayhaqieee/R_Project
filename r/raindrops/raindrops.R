raindrops <- function(number) {
    # Create a vector to store the sounds
    sounds <- c()
    
    # Check if the number is divisible by 3
    if (number %% 3 == 0) {
        sounds <- c(sounds, "Pling")
    }
    
    # Check if the number is divisible by 5
    if (number %% 5 == 0) {
        sounds <- c(sounds, "Plang")
    }
    
    # Check if the number is divisible by 7
    if (number %% 7 == 0) {
        sounds <- c(sounds, "Plong")
    }
    
    # If the number is not divisible by 3, 5, or 7, return the number as a string
    if (length(sounds) == 0) {
        return(as.character(number))
    }
    
    # Return the sounds as a single string
    return(paste(sounds, collapse = ""))
}
