to_rna <- function(dna) {
  dna_to_rna_map <- c('G' = 'C', 'C' = 'G', 'T'= 'A', 'A' = 'U')
  dna_split <- unlist(strsplit(dna, ''))
  stopifnot(all(is.element(dna_split, names(dna_to_rna_map))))
  rna_list <- unname(dna_to_rna_map[dna_split])
  rna_collapsed <- paste(rna_list, collapse = '')
  return(rna_collapsed)
}