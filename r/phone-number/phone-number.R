parse_phone_number <- function(number_string) {
  cleaned_string <- gsub("[^0-9]", "", number_string)
  if (nchar(cleaned_string) == 11 & substr(cleaned_string, 1, 1) == 1) {
    cleaned_string <- substr(cleaned_string, 2, 11)
  }
  if (nchar(cleaned_string) == 10) {
    if (substr(cleaned_string, 1, 1) %in% 2:9) {
      if (substr(cleaned_string, 4, 4) %in% 2:9) {
        return(cleaned_string)
      }
    }
  }
  return(NULL)
}