##' Returns a vector of colors to be used in plotting.
##'
##' Returns a vector of colors (hexadecimal representation), which are sourced
##' from RColorBrewer.
##' @title Colors used in Inferential Network Analysis
##' @param n Number of classes between 1 and 6 in the color vector.
##' @param paired logical, indicating whether to use the paired colors for
##'     qualitative data from from RColorBrewer.
##' @return A vector of colors.
##' @author Jason W. Morgan \email{jason.w.morgan@@gmail.com}
##' @export
Colors <- function(n=3, paired=TRUE)
{
    stopifnot(n %in% 1:12)

    if (isTRUE(paired)) {
        col <- RColorBrewer::brewer.pal(n=n, name="Paired")
    } else {
        col <- RColorBrewer::brewer.pal(n=n, name="Greens")
    }

    col
}
