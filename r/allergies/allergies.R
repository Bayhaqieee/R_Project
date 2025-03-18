allergy <- function(num) {
    allergen_list <- list(
        'eggs',
        'peanuts',
        'shellfish',
        'strawberries',
        'tomatoes',
        'chocolate',
        'pollen',
        'cats'
    )
    
    masks <- bitwShiftL(1, 1:length(allergen_list) - 1)
    allergen_list[bitwAnd(num, masks) != 0]
}

allergic_to <- function(allergy_object, allergy) {
    allergy %in% allergy_object
}

list_allergies <- function(allergy_object) {
    as.character(allergy_object)
}