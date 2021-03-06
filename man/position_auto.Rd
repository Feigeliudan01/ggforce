% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/position_auto.R
\name{position_auto}
\alias{position_auto}
\title{Jitter based on scale types}
\usage{
position_auto(jitter.width = 0.75, bw = "nrd0", scale = TRUE,
  seed = NA)
}
\arguments{
\item{jitter.width}{The maximal width of the jitter}

\item{bw}{The smoothing bandwidth to use in the case of sina jittering. See
the \code{bw} argument in \link[stats:density]{stats::density}}

\item{scale}{Should the width of jittering be scaled based on the number of
points in the group}

\item{seed}{A seed to supply to make the jittering reproducible across layers}
}
\description{
This position adjustment is able to select a meaningful jitter of the data
based on the combination of positional scale types. IT behaves differently
depending on if none, one, or both the x and y scales are discrete. If both
are discrete it will jitter the datapoints evenly inside a disc, if one of
them is discrete it will jitter the discrete dimension to follow the density
along the other dimension (like a sina plot). If neither are discrete it will
not do any jittering.
}
\examples{
# Continuous vs continuous: No jitter
ggplot(mpg) + geom_point(aes(cty, hwy), position = 'auto')

# Continuous vs discrete: sina jitter
ggplot(mpg) + geom_point(aes(cty, drv), position = 'auto')

# Discrete vs discrete: disc-jitter
ggplot(mpg) + geom_point(aes(fl, drv), position = 'auto')

# Don't scale the jitter based on group size
ggplot(mpg) + geom_point(aes(cty, drv), position = position_auto(scale = FALSE))
ggplot(mpg) + geom_point(aes(fl, drv), position = position_auto(scale = FALSE))

}
\seealso{
\link{geom_autopoint} for a point geom that uses auto-position by default
}
