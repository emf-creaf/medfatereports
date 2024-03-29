% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/report_functions.R
\name{report_render}
\alias{report_render}
\title{Report generation function}
\usage{
report_render(type = "evaluation", output_file = NULL, output_dir = NULL, ...)
}
\arguments{
\item{type}{which kind of report must be generated, "evaluation"}

\item{output_file}{file name for the output report}

\item{output_dir}{destination folder (if it does not exist, it will be
created)}

\item{...}{Rmarkdown parameters}
}
\description{
Function for generating automatically the report
}
\details{
The parameters accepted by the rmarkdown template (\code{...} argument) are
the following:
\itemize{
  \item{wd: working directory (i.e. the route to the validation root folder)}
  \item{code: Site/Plot code for which the report must be generated}
  \item{model: Simulation model, either "spwb" or "growth"}
  \item{conf: Control configuration}
}
}
