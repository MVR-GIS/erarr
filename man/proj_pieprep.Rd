% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/proj_pieprep.R
\name{proj_pieprep}
\alias{proj_pieprep}
\title{Proj Pie Prep}
\usage{
proj_pieprep(riskdf, colname)
}
\arguments{
\item{riskdf}{data frame;}

\item{colname}{character; The column name containing the risk ranks. Ranks
values must be one of: "High", "Medium", "Low", or 
"Opportunity".}
}
\value{
A data.frame of colors for each risk rank.
}
\description{
Preps data for pie charts at project level reports. Counts the values and sets the 
color for each of the rank levels in the specified 'rankcol`.
}
