acronym <- function(input) {
  input <- gsub("'", "", input, perl = TRUE)
  input <- gsub("[^[:alpha:]]", ' ', input, perl = TRUE)
  input <- gsub('\\b(\\pL)|.', '\\U\\1', input, perl = TRUE)
  return(input)
}