What's what?

The project consists of exercises from the "Six Sigma Step-by-Step guide" book by CSSC (https://www.sixsigmacouncil.org/) and/or Aveta Business Institute.

CSSC does not allow to reproduce texts from their books, so all files refer to the chapter number and page number in the book. All page numbers are from the July 2018 edition of the book.

Why?

All exercises are supposed to be performed in Minitab. Minitab price is over $1000 per license, which is a little bit high for a product supposed to be used as a part of the learning process.

However, there is the open-source R programming language that offers even better implementation of the statistic calculation and has decent capabilities to create plots and charts. There is absolutely no reason to waste money on Minitab when a more flexible solution exists.

License

The source code is distributed under Apache 2.0 license (https://www.apache.org/licenses/LICENSE-2.0).

The license covers the source code ONLY. It does not cover the book itself or its content. 

How to start:

1. Download and install `R`

https://cran.r-project.org/bin/windows/base/

2. Add `bin` folder in `R` installation to environment path `PATH` variable

3. [Optional] Download and Install Visual Studio Code and install R language support

4. Install `tidyverse` library by running `install-tidyverse.r` in the root

Note: if you installed R under Program Files folder the library installation
may fail because of insufficient permissions. Give full control over R folder
to all users. 

5. To run R scripts use `R --file=...` where `...` is R file name.

