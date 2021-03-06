% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/main.R
\name{generate.complete.graph}
\alias{generate.complete.graph}
\title{Generates a complete graph}
\usage{
generate.complete.graph(nodes.list, distance.matrix)
}
\arguments{
\item{nodes.list}{A vector with a subset of nodes (objects) of the data matrix for which the complete graph must be generated.}

\item{distance.matrix}{A distance matrix between each pair of objects in \code{nodes.list}. It is used as the edges costs to generate the complete graph.}
}
\value{
\item{edges.complete.graph}{A object of class "data.frame" with three columns (\emph{object_i}, \emph{object_j}, \emph{d_ij}) representing the distance between object \emph{i} and object \emph{j} of the distance matrix. For instance:}
\tabular{llc}{
 \emph{object_i} \tab  \emph{object_j} \tab  \emph{d_ij}\cr
 1 \tab 2 \tab 1.60\cr
 1 \tab 3 \tab 0.08\cr
 1 \tab 4 \tab 1.21\cr
 ... \tab ... \tab ...\cr
 n-1 \tab n \tab ...\cr
}
}
\description{
This function generates a complete graph. Where each node represents a object_i and the edges have a cost representing the distance d_ij between object_i and other object_j.
}
\examples{

set.seed(1987)

##Generates a data matrix of dimension 50X13

n=50; m=13
x <- matrix(runif(n*m, min = -5, max = 10), nrow=n, ncol=m)

##Computes a distance matrix of x.

library("stats")
d <- base::as.matrix(stats::dist(x, method="euclidean"))

##Generates complete graph (CG)

cg <- generate.complete.graph(1:nrow(x),d)

head(cg)

##Visualizing CG graph
library("igraph")
cg.network=igraph::graph.adjacency(d, mode="undirected", weighted=TRUE)
plot(cg.network, edge.label=round(E(cg.network)$weight, 2), main="Complete Graph")

}
\author{
Mario Inostroza-Ponta, Jorge Parraga-Alava, Pablo Moscato
}
\keyword{internal}
