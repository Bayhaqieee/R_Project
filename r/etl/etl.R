etl <- function(input) {
	res <- list()
	for(key in names(input)) {
		for (v in input[key]) {
			res[tolower(v)] <- strtoi(key)
		}
	}
	res <- res[order(names(res))]
}