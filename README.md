
<!-- README.md is generated from README.Rmd. Please edit that file -->

# erarr <img src="inst/app/www/erarr.png" align="right" width="170"/>

Enterprise Risk Analysis Reporting in R: A Shiny Application for
producing Risk Analysis Reports in `R`

## Package Status

[![Maturing](https://img.shields.io/badge/lifecycle-maturing-blue.svg)](https://www.tidyverse.org/lifecycle)
[![Project Status: WIP – Initial development is in progress, but there
has not yet been a stable, usable release suitable for the
public.](https://www.repostatus.org/badges/latest/wip.svg)](https://www.repostatus.org/#wip)
[![packageversion](https://img.shields.io/badge/Package%20version-0.0.1-orange.svg?style=flat-square)](commits/master)
[![Last-changedate](https://img.shields.io/badge/last%20change-2024--02--08-yellowgreen.svg)](/commits/master)
[![Licence](https://img.shields.io/badge/licence-CC0-blue.svg)](http://choosealicense.com/licenses/cc0-1.0/)

## Description

This package contains a set of functions to create a
[`shiny`](https://shiny.posit.co/) application that produces a variety
of Risk Analysis Reports. These functions help automate and standardize
report production using the [`rmarkdown`](https://rmarkdown.rstudio.com/lesson-1.html) 
package.

## Funding

Funding for development and maintenance of `erarr` has been provided by
the following US Army Corps of Engineers (USACE) programs:

- [Navigation and Ecosystem Sustainability Program
  (NESP)](https://www.mvr.usace.army.mil/Rock-Island-District/Programs/NESP/)

------------------------------------------------------------------------

## Latest Updates

Check out the [News](news/index.html) for details on the latest updates.

------------------------------------------------------------------------

## Authors

- [Barrie Chileen
  Martinez](mailto:barrie.v.chileenmartinez@usace.army.mil), Geographer,
  Rock Island District, U.S. Army Corps of Engineers
    <a itemprop="sameAs" content="https://orcid.org/0000-0002-6960-8167" href="https://0000-0002-6960-8167" target="orcid.widget" rel="me noopener noreferrer" style="vertical-align:top;">
  <img src="https://orcid.org/sites/default/files/images/orcid_16x16.png" alt="ORCID iD icon" style="width:1em;margin-right:.5em;"/>https://orcid.org/0000-0002-6960-8167</a>
  
- [Michael Dougherty](mailto:Michael.P.Dougherty@usace.army.mil), Geographer, 
  Rock Island District, U.S. Army Corps of Engineers
  <a itemprop="sameAs" content="https://orcid.org/0000-0002-1465-5927" href="https://0000-0002-1465-5927" target="orcid.widget" rel="me noopener noreferrer" style="vertical-align:top;">
  <img src="https://orcid.org/sites/default/files/images/orcid_16x16.png" alt="ORCID iD icon" style="width:1em;margin-right:.5em;"/>https://orcid.org/0000-0002-1465-5927</a>


------------------------------------------------------------------------

## Install

To install the `erarr` package, install from GitHub using the `remotes`
package:

    remotes::install_github(repo = "MVR-GIS/erarr")

## Run the application

To run the Risk Analysis and Reporting application, use the following
function:

    erarr::run_app()

## Bug Reports

If you find any bugs using `erarr`, please open an
[issue](https://github.com/MVR-GIS/erarr/issues).
