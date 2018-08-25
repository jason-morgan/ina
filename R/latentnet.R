## =============================================================================
## Supplemental tools for dealing with latentnet objects
## =============================================================================

##' @rdname AIC
##' @export
BIC.ergmm <- function(object, ...)
{
    summary(object)$bic
}
