##' Returns a vector of colors to be used in plotting.
##'
##' Returns a vector of colors (hexadecimal representation), which are sourced
##' from the http://colorbrewer2.org website.
##' @title Colors used in Inferential Network Analysis
##' @param classes Number of classes between 1 and 6 in the color vector.
##' @return A vector of colors.
##' @author Jason W. Morgan \email{jason.w.morgan@@gmail.com}
##' @export
Colors <- function(classes=3)
{
    stopifnot(classes %in% 1:6)

    base <- c("#a6cee3", "#1f78b4", "#b2df8a", "#33a02c", "#fb9a99", "#e31a1c")
    base[1:classes]
}
