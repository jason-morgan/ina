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
##' @param type Prediction type to pass to \code{\link{predict.ergmm}}. Unlike
##'     in that function, "pmean" is the default.
##' @param ... Additional arguments, not used
##' @return A \code{\link[ROCR]{performance}} object.
##' @author Jason W. Morgan \email{jason.w.morgan@@gmail.com}
##' @export
model_performance <- function(object, measure, x.measure="cutoff",
                              type="pmean", ...)
{
    UseMethod("model_performance")
}

##' @rdname model_performance
##' @export
model_performance.ergmm <- function(object, measure, x.measure="cutoff",
                                    type="pmean", ...)
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
    pred <- ROCR::prediction(extractor(predict(object, type=type),
                                       is.directed(G)), y)
    ROCR::performance(pred, measure, x.measure)
}

##' Recover the weighted adjacency matrix for a network.
##'
##' Recover the weighted adjacency matrix for a network.
##' @title Return Weighted Adjacency Matrix
##' @param network \code{\link[network]{network}} object.
##' @param covariate string, the covariate to extract
##' @return Adjacency matrix.
##' @author Jason W. Morgan \email{jason.w.morgan@@gmail.com}
##' @export
to_sociomatrix <- function(network, covariate)
{
    e <- as.edgelist(network, covariate)
    n <- attr(e, "n")
    y <- matrix(0, ncol=n, nrow=n)

    if (!is.directed(network)) {
        for (i in 1:nrow(e)) {
            r <- e[i,]
            y[r[1], r[2]] <- y[r[2], r[1]] <- r[3]
        }
    } else {
        for (i in 1:nrow(e)) {
            r <- e[i,]
            y[r[1], r[2]] <- r[3]
        }
    }

    y
}

##' Simulate edge outcomes from an estimated \code{\link[latentnet]{ergmm}} model.
##'
##' Simulate edge outcomes from an estimated \code{\link[latentnet]{ergmm}} model.
##' @title Simulate Outcomes from Latent Space Model
##' @param model \code{\link[latentnet]{ergmm}} model object
##' @param n integer, number of simulations
##' @param x string, the covariate outcome of interest
##' @param i integer, sender id
##' @param j integer, receiver id
##' @param seed integer, random seed for replicability
##' @return vector of simulated values
##' @author Jason W. Morgan \email{jason.w.morgan@@gmail.com}
##' @export
simulate_edge <- function(model, n, x, i, j, seed=NULL)
{
    ## no loops
    stopifnot(i != j)

    get_edge <- function(s, x, i, j) {
        to_sociomatrix(s, x)[i, j]
    }

    sims <- simulate(model, nsim=n, seed=seed)[[2]]
    sapply(sims, function(s) { get_edge(s, x, i, j)})
}

##' Simulates and then plots outcomes between specified nodes.
##'
##' Simulates and then plots outcomes between specified nodes from an estimated
##' latent space model.
##' @title Simulate and Plot Histogram of Outcomes from Latent Space Model
##' @param model \code{\link[latentnet]{ergmm}} model object
##' @param network \code{\link[network]{network}} object from which the model
##'     was estimated.
##' @param x string, the covariate outcome of interest
##' @param i integer, sender id
##' @param j integer, receiver id
##' @param n integer, number of simulations
##' @param barplot boolean, plot a barplot instead of a histogram. Useful for
##'     discrete outcomes.
##' @author Jason W. Morgan \email{jason.w.morgan@@gmail.com}
##' @export
predict_response_hist <- function(model, network, x, i, j, n=1000, barplot=FALSE)
{
    sims <- simulate_edge(model, n, x, i, j)
    truth <- to_sociomatrix(network, x)[i, j]

    if (isTRUE(barplot)) {
        barplot(table(sims), col=ina::Colors()[1], border="white",
                main=paste0("Predicted edge values from ", i, " to ", j),
                space=0)
        shift <- 0.5
    } else {
        hist(sims, col=ina::Colors()[1], border="white",
             main=paste0("Predicted edge values from ", i, " to ", j))
        shift <- 0
    }

    abline(v=truth + shift, col=ina::Colors(8)[8], lty=2, lwd=2)
    abline(v=mean(sims) + shift, col=ina::Colors(2)[2], lty=2, lwd=2)
}
