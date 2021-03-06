% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pca2tsne.R
\name{pca2tsne}
\alias{pca2tsne}
\title{Mapping principal components onto a 2D map via tSNE.}
\usage{
pca2tsne(Z, perp = 50, n.samples = 1, n.iter = 1000)
}
\arguments{
\item{Z}{A matrix with axes of variation (typically PCs) as columns and subjects as rows.}

\item{perp}{Perplexity value. Defaults to 50.}

\item{n.samples}{Number of times the algorithm from different random initial conditions. Defaults to 1.}

\item{n.iter}{Number of iterations for each run of the algorithm. Defaults to 1000.}
}
\value{
Returns the tSNE (output of function 'Rtsne::Rtsne') with the smallest error across the 'n.samples' random starts.
}
\description{
This function is called by moss whenever 'moss(tSNE=TRUE)'. However, it can be used on any generic data matrix. The function uses the Barnes-Hut tSNE algorithm from Rtsne package, and uses an iterative procedure to select a tSNE map minimizing the projection cost across several random initial conditions.
The function is inspired by the iterative procedure discussed in Taskesen et al. 2016 and code originally provided with the publication.
}
\examples{
\dontrun{
library("MOSS")
library("Rtsne")
sim_blocks <-simulate_data()$sim_blocks

#Example of pca2tsne usage.
Z <- pca2tsne(sim_blocks$`Block 3`,perp=50,n.samples=1,n.iter=1e3)$Y
plot(Z,xlab="x_tSNE(X)",ylab="y_tSNE(X)")

#Example of use within moss.
moss(sim_blocks[-4],
     tSNE=list(perp=50,
               n.samples=1,
               n.iter=1e3),
               plot=TRUE)$tSNE.plot
}
}
\references{
Taskesen, E., Huisman, S. M. H., Mahfouz, A., et al. Pan-cancer subtyping in a 2D-map shows substructures that are driven by specific combinations of molecular characteristics. Sci. Rep. 6, 24949 (2016).
}
