bob <- function(input) {
  silence <- "Fine. Be that way!"
  yelling_question <- "Calm down, I know what I'm doing!"
  yelling <- "Whoa, chill out!"
  question <- "Sure."
  nonsense <- "Whatever."
  
  is_upper <- function (s) identical(s , toupper(s)) && grepl("[A-Z]", s)
  is_silence <- function(s) identical(gsub("^\\s*|\\s*$", "", s) , "")
  is_question <- function(s) grepl("\\?\\s*$", s)
  
  if (is_silence(input)) silence
  else if (is_upper(input) && is_question(input)) yelling_question
  else if (is_upper(input)) yelling
  else if (is_question(input)) question
  else (nonsense)
  
}