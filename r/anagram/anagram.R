anagram <- function(subject, candidates) {
    subject <- tolower(subject)
    subject <- gsub("[^[:alpha:]]", "", subject)
    subject <- sort(unlist(strsplit(subject, "")))
    subject <- paste(subject, collapse = "")
    candidates <- lapply(candidates, function(x) {
        x <- tolower(x)
        x <- gsub("[^[:alpha:]]", "", x)
        x <- sort(unlist(strsplit(x, "")))
        x <- paste(x, collapse = "")
        return(x)
    })
    return(candidates[subject == candidates])
}
