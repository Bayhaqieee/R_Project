rotate <- function(text, key) {
  textVector <- unlist(strsplit(text, ""))
  upperCase <- toupper(textVector) == textVector
  rotationIndex <- (match(tolower(textVector), letters) + key - 1) %% 26 + 1
  rotatedVector <- letters[rotationIndex]
  rotatedVector[is.na(rotatedVector)] <- textVector[is.na(rotatedVector)]
  rotatedVector[upperCase] <- toupper(rotatedVector[upperCase])
  paste(rotatedVector, collapse = "") 
}