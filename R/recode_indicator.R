
#' A simple function for recoding qualitative variables.
#'
#' @description Use this function to recode Qualitative Yes/No data to 1/0.
#' Note this version converts all non-Yes answers to 0
#'
#' @param x the indicator variable to be recoded.
#'
#'
#' @returns a numeric value 1 or 0
#' @export
#'
#' @examples

#' indicators = c("Yes","No","Unsure","y","No")
#' recode_indicator(indicators)
#'
#' # To be added# Define function to recode indicators
recode_indicator = function(x) {if_else(x %in% c("Yes","yes","y","Y",TRUE,1), 1,0)}
