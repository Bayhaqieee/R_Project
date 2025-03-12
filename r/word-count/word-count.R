word_count <- function(input) {
    words <- strsplit(input, "[^[:alnum:]]+", perl = TRUE)[[1]]
    words <- words[words != ""]
    words <- tolower(words)
    words <- table(words)
    as.data.frame(words)
}
