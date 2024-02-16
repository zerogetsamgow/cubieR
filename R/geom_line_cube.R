#' Line plots in the Cube Group style rounded tops
#'
#' @description Create a line plot with rounded ends using
#'   'ggplot2'. `geom_line_cube()` is a wrapper function utilising
#'   the [ggplot2::geom_line()] with defaults that produce line charts that match
#'   the Cube Group Brand Guidelines.
#'
#'   This is achieved by setting defaults for two parameters `lineend` and `linewidth`
#'
#' @param lineend defaults to `"round"`to match the brand guidelines.
#'
#' @param linewidth defaults to 1.2 to produce generally clearer charts.
#'
#' @param ... Other arguments passed on to [ggplot2::geom_line()] . These are
#'   often aesthetics, used to set an aesthetic to a fixed value, like
#'   `colour = "red"` . They may also be parameters to the paired geom/stat.
#' @returns A ggplot object.
#' @export
#'
#' @examples
#' library(ggplot2)
#'
#' # To be added
#'

geom_line_cube <-
  function(
    lineend = "round",
    linewidth = 1.2,
    ...
  )
  {
    ggplot2::geom_line(lineend=lineed, linewidth=linewidth, ...)
  }

#' Path plots in the Cube Group style rounded tops
#'
#' @description Create a path plot with rounded ends using
#'   'ggplot2'. `geom_path_cube()` is a wrapper function utilising
#'   the [ggplot2::geom_path()] with defaults that produce line charts that match
#'   the Cube Group Brand Guidelines.
#'
#'   This is achieved by setting defaults for two parameters `lineend` and `linewidth`
#'
#' @param lineend defaults to `"round"`to match the brand guidelines.
#'
#' @param linewidth defaults to 1.2 to produce generally clearer charts.
#'
#' @param ... Other arguments passed on to [ggplot2::geom_path()] . These are
#'   often aesthetics, used to set an aesthetic to a fixed value, like
#'   `colour = "red"` . They may also be parameters to the paired geom/stat.
#' @returns A ggplot object.
#' @export
#'
#' @examples
#' library(ggplot2)
#'
#' # To be added
#'

geom_path_cube <-
  function(
    lineend = "round",
    linewidth = 1.2,
    ...
  )
  {
    ggplot2::geom_path(lineend=lineed, linewidth=linewidth, ...)
  }

