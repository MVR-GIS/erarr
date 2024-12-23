% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data_update.R
\name{update_data}
\alias{update_data}
\title{Update Data}
\usage{
update_data(
  key_service = "egis-db-brandonroad",
  user_name = "BrandonRoad",
  host = "egis-db",
  port = "1521",
  sid = "B5SDEDP1",
  output_path = "../erarr/inst/app/data/"
)
}
\arguments{
\item{key_service}{A string representing the service name in the keyring where the password is stored.}

\item{user_name}{A string representing the username for the Oracle database.}

\item{host}{A string representing the host name of the Oracle database.}

\item{port}{A string representing the port number of the Oracle database.}

\item{sid}{A string representing the SID of the Oracle database.}

\item{output_path}{A string representing the directory where the CSV files will be saved.}
}
\value{
None. The function saves the imported tables as CSV files in the specified output path.
}
\description{
This function connects to an Oracle database, imports specified tables,
and saves them as CSV files in the specified output path.
}
