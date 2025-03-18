rm(list=ls())

is_valid <- function(Digit) {
  digit <- gsub("[[:blank:]]","",Digit) 
  if (nchar(digit) <= 1){return(FALSE)}
  if (grepl("[a-zA-Z]",digit)){return(FALSE)}
  if (nchar(gsub("[[:alnum:]]","",digit)) > 0){return(FALSE)}
  
  digit <- as.integer(unlist(strsplit(digit,"")))
  
  digit <- rev(digit)
  digit[seq(2,length(digit),2)] <- digit[seq(2,length(digit),2)]*2
  
  digit_final <- ifelse (digit > 9, digit - 9, digit)
  
  all_sum <- sum(digit_final)
  
  ifelse(all_sum %% 10 == 0, return(TRUE),return(FALSE))
}