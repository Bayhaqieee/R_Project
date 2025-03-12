leap <- function(year) {
    if (year %% 4 == 0) {
        if (year %% 100 == 0) {
        if (year %% 400 == 0) {
            return(TRUE)
        } else {
            return(FALSE)
        }
        } else {
        return(TRUE)
        }
    } else {
        return(FALSE)
    }
}
