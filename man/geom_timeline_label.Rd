% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dataproc.R
\name{geom_timeline_label}
\alias{geom_timeline_label}
\title{Function that draw the earthquake timeline label}
\usage{
geom_timeline_label(mapping = NULL, data = NULL, stat = "identity",
  position = "identity", na.rm = FALSE, n_max = NULL, show.legend = NA,
  inherit.aes = TRUE, ...)
}
\arguments{
\item{mapping}{Set of aesthetic mappings created by \code{\link{aes}} or
\code{\link{aes_}}. If specified and \code{inherit.aes = TRUE} (the
default), it is combined with the default mapping at the top level of the
plot. You must supply \code{mapping} if there is no plot mapping.}

\item{data}{The data to be displayed in this layer. There are three
   options:

   If \code{NULL}, the default, the data is inherited from the plot
   data as specified in the call to \code{\link{ggplot}}.

   A \code{data.frame}, or other object, will override the plot
   data. All objects will be fortified to produce a data frame. See
   \code{\link{fortify}} for which variables will be created.

   A \code{function} will be called with a single argument,
   the plot data. The return value must be a \code{data.frame.}, and
   will be used as the layer data.}

\item{stat}{The statistical transformation to use on the data for this
layer, as a string.}

\item{position}{Position adjustment, either as a string, or the result of
a call to a position adjustment function.}

\item{na.rm}{If \code{FALSE}, the default, missing values are removed with
a warning. If \code{TRUE}, missing values are silently removed.}

\item{n_max}{A integer describing the maximum numer of labels to display}

\item{show.legend}{logical. Should this layer be included in the legends?
\code{NA}, the default, includes if any aesthetics are mapped.
\code{FALSE} never includes, and \code{TRUE} always includes.}

\item{inherit.aes}{If \code{FALSE}, overrides the default aesthetics,
rather than combining with them. This is most useful for helper functions
that define both data and aesthetics and shouldn't inherit behaviour from
the default plot specification, e.g. \code{\link{borders}}.}

\item{...}{other arguments passed on to \code{\link{layer}}. These are
often aesthetics, used to set an aesthetic to a fixed value, like
\code{color = "red"} or \code{size = 3}. They may also be parameters
to the paired geom/stat.}
}
\description{
Function that draw the earthquake timeline label
}
\details{
In a typical use case, the x aesthetic is already inherited from the previous layer, the
    user only have to specify the dimension to be used as label, as well as the maximum number of
    labels to be displayed
}
\examples{
\dontrun{
    read_eq_clean_data() \%>\%
        dplyr::filter(YEAR > 2000 & !IS_BC & COUNTRY \%in\% c("USA", "CANADA")) \%>\%
        dplyr::mutate(TOTAL_DEATHS = as.numeric(TOTAL_DEATHS),
                      EQ_PRIMARY = as.numeric(EQ_PRIMARY)) \%>\%
        ggplot2::ggplot(ggplot2::aes(x = DATE,
                                     y = COUNTRY,
                                     colour = TOTAL_DEATHS,
                                     size = EQ_PRIMARY
                                     )) +
        geom_timeline() +
        theme_timeline() +
        labs(size = "Richter scale value", color = "# deaths") +
        geom_timeline_label(ggplot2::aes(label = LOCATION_NAME), n_max = 3)
}

}
