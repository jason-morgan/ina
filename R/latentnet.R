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
##' \code{\link{latentnet}} package.
##'
##' \code{loc} returns a matrix of posterior means for the latent locations of
##' each vertex as estimated by \code{\link[latentnet]{ergmm}}.
##' @title Extract Estimated Locations from Latent Space Model
##' @param object Model object returned by \code{\link[latentnet]{ergmm}}.
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
    colnames(z) <- paste0("Z", 1:ncol(z))
    z
}

##' Extract the postertior samples of the distances between two vertices as
##' estimated in a latent space model.
##'
##' \code{mcmc_distance} returns an \code{\link[coda]{mcmc}} object containing
##' the distances between the two specified vertices.
##' @title Extract Posterior Samples of the Distances Between Two Vertices
##' @param object \code{\link[latentnet]{ergmm}} model object
##' @param i integer, representing the index of the first vertex
##' @param j integer, representing the index of the second vertex
##' @return Returns an \code{\link[coda]{mcmc}} object
##' @author Jason W. Morgan \email{jason.w.morgan@@gmail.com}
##' @export
mcmc_distance <- function(object, i, j)
{
    UseMethod("mcmc_distance")
}

##' @rdname mcmc_distance
##' @export
mcmc_distance.ergmm <- function(object, i, j)
{
    position_matrix <- function(x)
    {
        x <- split(x, rep(c(1, 2), each=length(x)/2))
        rbind(x[[1]], x[[2]])
    }

    smry <- summary(object)
    d <- smry$model$d

    keep <- cbind(rep(c(i, j), each=d), rep(1:d, 1))
    samples <- as.matrix(as.mcmc.list(object, which.vars=list(Z=keep)))
    samples <- lapply(1:nrow(samples),
                      function(i) position_matrix(samples[i,]))

    s <- matrix(sapply(samples, dist), ncol=1)
    colnames(s) <- paste0("d_", i, "_", j)
    as.mcmc(s)
}


##' Returns a performance object for a model estimates with
##' \code{\link[latentnet]{ergmm}}.
##'
##' Returns a performance object for a model estimates with
##' \code{\link[latentnet]{ergmm}}. Predictions from the supplied model are
##' based on the posterior mean of the parameter estimates.
##' @title Return the Model Performance of an Latent Space Model
##' @param object \code{\link[latentnet]{ergmm}} model object
##' @param measure Performance measure to use for the evaluation. See
##'     \code{\link[ROCR]{performance}}.
##' @param x.measure A second performance measure. See
##'     \code{\link[ROCR]{performance}}.
##' @param ... Additional arguments, not used
##' @return A \code{\link[ROCR]{performance}} object.
##' @author Jason W. Morgan \email{jason.w.morgan@@gmail.com}
##' @export
model_performance <- function(object, measure, x.measure="cutoff",
                              ...)
{
    UseMethod("model_performance")
}

##' @rdname model_performance
##' @export
model_performance.ergmm <- function(object, measure, x.measure="cutoff",
                                    ...)
{
    extractor <- function(x, directed=FALSE) {
        if (isTRUE(directed)) {
            c(x[lower.tri(x)], x[upper.tri(x)])
        } else {
            x[lower.tri(x)]
        }
    }

    G <- summary(object)$model$Yg
    y <- extractor(as.matrix(G), is.directed(G))
    pred <- ROCR::prediction(extractor(predict(object, type="pmean"),
                                       is.directed(G)), y)
    ROCR::performance(pred, measure, x.measure)
}
