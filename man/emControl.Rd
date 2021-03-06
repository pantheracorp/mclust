\name{emControl}
\alias{emControl}

\title{Set control values for use with the EM algorithm}

\description{
  Supplies a list of values including tolerances for singularity and
  convergence assessment, for use functions involving EM within \emph{MCLUST}.
}
\usage{
emControl(eps, tol, itmax, equalPro) 
}
\arguments{
  \item{eps}{
    A scalar tolerance associated with deciding when to terminate
    computations due to computational singularity in
    covariances. Smaller values of \code{eps} allow computations to
    proceed nearer to singularity. The default is the relative machine
    precision \code{.Machine$double.eps}, which is approximately
    \eqn{2e-16} on IEEE-compliant machines. 
  }
  \item{tol}{
    A vector of length two giving relative convergence tolerances for the 
    log-likelihood and for parameter convergence in the inner loop for models
    with iterative M-step ("VEI", "EVE", "VEE", "VVE", "VEV"), respectively.
    The default is \code{c(1.e-5,sqrt(.Machine$double.eps))}.
    If only one number is supplied, it is used as the tolerance 
    for the outer iterations and the tolerance for the inner
    iterations is as in the default.
  }
  \item{itmax}{
    A vector of length two giving integer limits on the number of EM
    iterations and on the number of iterations in the inner loop for
    models with iterative M-step ("VEI", "EVE", "VEE", "VVE", "VEV"),
    respectively. The default is 
    \code{c(.Machine$integer.max, .Machine$integer.max)} 
    allowing termination to be completely governed by \code{tol}. 
    If only one number is supplied, it is used as the iteration
    limit for the outer iteration only.
  }
  \item{equalPro}{
    Logical variable indicating whether or not the mixing proportions are
    equal in the model. Default: \code{equalPro = FALSE}.
  }
}
\value{
  A named list in which the names are the names of the arguments
  and the values are the values supplied to the arguments.
}
\details{
  \code{emControl} is provided for assigning values and defaults
  for EM within \emph{MCLUST}.
}

\seealso{
  \code{\link{em}}, 
  \code{\link{estep}}, 
  \code{\link{me}}, 
  \code{\link{mstep}}, 
  \code{\link{mclustBIC}}
}
\examples{
irisBIC <- mclustBIC(iris[,-5], control = emControl(tol = 1.e-6))
summary(irisBIC, iris[,-5])
}
\keyword{cluster}
