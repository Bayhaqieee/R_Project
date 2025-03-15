handshake <- function(n) {
  code <- as.integer(intToBits(n))[1:5]
  sign <- c("wink", "double blink", "close your eyes", "jump")
  handshake <- sign[code[1:4]==1]
  if (length(handshake) == 0) return(c())
  if (code[5]==0) return(handshake)
  else return(rev(handshake))
}