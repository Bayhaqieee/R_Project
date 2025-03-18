is_isogram <- function(word) {
    word <- tolower(word)
    word <- gsub("[^a-z]", "", word)
    unique_chars <- unique(strsplit(word, "")[[1]])
    length(unique_chars) == nchar(word)
}
