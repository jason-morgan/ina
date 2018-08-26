## =============================================================================
## Supplemental tools for dealing with latentnet objects
## =============================================================================

##' @rdname AIC
##' @export
BIC.ergmm <- function(object, ...)
{
    summary(object)$bic
}

##' @rdname coef
##' @export
coef.ergmm <- function(object, ...)
{
    smry <- summary(object)
    b <- smry$pmean$coef.table
    nm <- rownames(b)
    b <- b[,1]
    names(b) <- nm
    b
}

##' Extracts the estimated posterior means for the vertices as estimated in the
##' \link{\code{latentnet}} package.
##'
##' \code{loc} returns a matrix of posterior means for the latent locations of
##' each vertex as estimated by \link{\code{ergmm}}.
##' @title Extract Estimated Locations from Latent Space Model
##' @param object Model object returned by \link{\code{ergmm}}.
##' @param ... Additional arguments, unused.
##' @return Matrix of posterior means of the vertices as estimated in the latent
##'     space model.
##' @author Jason W. Morgan \email{jason.w.morgan@@gmail.com}
##' @export
loc <- function(object, ...)
{
    UseMethod("loc")
}

##' @rdname loc
##' @export
loc.ergmm <- function(object, ...)
{
    smry <- summary(object)
    nm <- network.vertex.names(smry$model$Yg)
    z <- smry$pmean$Z
    rownames(z) <- nm
    z
}
