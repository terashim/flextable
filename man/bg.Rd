% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/styles.R
\name{bg}
\alias{bg}
\title{Set background color}
\usage{
bg(x, i = NULL, j = NULL, bg, part = "body", source = j)
}
\arguments{
\item{x}{a flextable object}

\item{i}{rows selection}

\item{j}{columns selection}

\item{bg}{color to use as background color. If a function, function need to return
a character vector of colors.}

\item{part}{partname of the table (one of 'all', 'body', 'header', 'footer')}

\item{source}{if bg is a function, source is specifying the dataset column to be used
as argument to \code{bg}. This is only useful if j is colored with values contained in
other columns.}
}
\description{
Change background color of selected rows and
columns of a flextable. A function can be used instead of
fixed colors.

When \code{bg} is a function, it is possible to color cells based on values
located in other columns, using hidden columns (those not used by
argument \code{colkeys}) is a common use case. The argument \code{source}
has to be used to define what are the columns to be used for the color
definition and the argument \code{j} has to be used to define where to apply
the colors and only accept values from \code{colkeys}.
}
\note{
Word does not allow you to apply transparency to table cells or paragraph shading.
}
\examples{
ft_1 <- flextable(head(mtcars))
ft_1 <- bg(ft_1, bg = "wheat", part = "header")
ft_1 <- bg(ft_1, i = ~ qsec < 18, bg = "#EFEFEF", part = "body")
ft_1 <- bg(ft_1, j = "drat", bg = "#606060", part = "all")
ft_1 <- color(ft_1, j = "drat", color = "white", part = "all")
ft_1

if (require("scales")) {
  ft_2 <- flextable(head(iris))
  colourer <- col_numeric(
    palette = c("wheat", "red"),
    domain = c(0, 7)
  )
  ft_2 <- bg(ft_2,
    j = c(
      "Sepal.Length", "Sepal.Width",
      "Petal.Length", "Petal.Width"
    ),
    bg = colourer, part = "body"
  )
  ft_2
}
}
\seealso{
Other sugar functions for table style: 
\code{\link{align}()},
\code{\link{bold}()},
\code{\link{color}()},
\code{\link{empty_blanks}()},
\code{\link{fontsize}()},
\code{\link{font}()},
\code{\link{highlight}()},
\code{\link{italic}()},
\code{\link{keep_with_next}()},
\code{\link{line_spacing}()},
\code{\link{padding}()},
\code{\link{rotate}()},
\code{\link{valign}()}
}
\concept{sugar functions for table style}
