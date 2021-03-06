% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/margins.R
\name{compute_margins}
\alias{compute_margins}
\alias{margin_to_df}
\title{Compute margins for a weighting of a multi-level fitting problem}
\usage{
compute_margins(ml_problem, weights, verbose = FALSE)

margin_to_df(controls, count = NULL, verbose = FALSE)
}
\arguments{
\item{ml_problem}{A fitting problem created by
\code{\link[=ml_problem]{ml_problem()}} or returned by \code{\link[=flatten_ml_fit_problem]{flatten_ml_fit_problem()}}.}

\item{weights}{A vector with one entry per row of the original reference
sample}

\item{verbose}{If \code{TRUE}, print diagnostic output.}

\item{controls}{Margins as returned by \code{compute_margins} or as passed
to the \code{controls} parameter of \code{\link[=ml_problem]{ml_problem()}}.}

\item{count}{Name of control total column, autodetected by default.}
}
\value{
\code{compute_margins()} returns a named list with two components,
\code{individual} and \code{group}. Each contains a list of margins as \code{data.frame}s.

\code{margins_to_df()} returns a data frame with the following columns:
\describe{
\item{\code{..control.type..}}{Type of the control total: either \code{individual} or \code{group}.}
\item{\code{..control.name..}}{Name of the control total, if exists.}
\item{\code{..id..}}{Name of the control category.}
\item{\code{..count..}}{Count of the control category.}
}
}
\description{
These functions allows checking a fit in terms of the original input data.
}
\details{
\code{compute_margins()} computes margins in the format used for the input
controls (i.e., as expected by the \code{controls} parameter of the
\code{\link[=ml_problem]{ml_problem()}} function), based on a reference sample and a weight vector.

\code{margins_to_df()} converts margins to a data frame for easier comparison.
}
\examples{
path <- toy_example("Tiny")
problem <- readRDS(path)
fit <- ml_fit(ml_problem = problem, algorithm = "entropy_o")
margins <- compute_margins(problem, fit$weights)
margins

margin_to_df(problem$controls)
margin_to_df(margins)
}
\seealso{
\code{\link[=ml_fit]{ml_fit()}}
}
