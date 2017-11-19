## This package provides an R wrapper to the Data Science Toolkit API

[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](http://www.repostatus.org/badges/latest/active.svg)](http://www.repostatus.org/#active)
[![Build Status](https://travis-ci.org/rtelmore/ballr.svg?branch=master)](https://travis-ci.org/rtelmore/RDSTK)
[![Coverage Status](https://img.shields.io/codecov/c/github/rtelmore/ballr/master.svg)](https://codecov.io/github/rtelmore/RDSTK?branch=master)
[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/ballr)](https://cran.r-project.org/package=RDSTK)
[![CRAN RStudio mirror downloads](http://cranlogs.r-pkg.org/badges/RDSTK)](http://www.r-pkg.org/pkg/RDSTK)

For more information on the these APIs see http://www.datasciencetoolkit.org

### Contact

Ryan Elmore

- Email: rtelmore@gmail.com

### Installation

To install this package from the source code available here, download the RDSTK.*.tar.gz file and R CMD INSTALL from the command line.

### History

Last update: 2013-Jan-31

- Made API more dynamic, since the DSTK allows you to locally clone their server. Custom APIs can be set using `options("RDSTK_api_base"="http://localhost:8080")`

2011-May-03

- Added getCurlHandle as an argument to function calls
- Updated source to V1.0
- Modified documentation

2011-Apr-30

- Uploaded original source code and tarball

### License

Copyright (c) 2013, under the Simplified BSD License.
For more information on FreeBSD see: http://www.opensource.org/licenses/bsd-license.php
All rights reserved.