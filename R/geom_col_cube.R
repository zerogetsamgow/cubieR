#' Column plot with rounded tops
#'
#' @description Create a column plot with rounded tops using
#'   'ggplot2'. `geom_col_cube()` is a wrapper function utilising
#'   the [ggrounded::geom_col_rounded()] to produce column charts that match
#'   the Cube Group Brand Guidelines.
#'
#'   This is achieved by setting defaults for two parameters `radius` and `position`
#'
#' @param radius The radius of the rounded corners, given as a unit object.
#' This defaults to `grid::unit(.5, "npc")`, where `"npc"` is "Normalised Parent Coordinates".
#' This effectively make the radius half the width of the column (the parent).
#'
#' @param position The position is set to `position_dodge()` so colours are positioned side by
#' side. The results of [ggrounded::geom_col_rounded()] with the default `position_stack`
#' are aesthetically questionable.
#'
#' @param ... Other arguments passed on to [ggrounded::geom_col_rounded()]. These are
#'   often aesthetics, used to set an aesthetic to a fixed value, like
#'   `colour = "red"` or `size = 3`. They may also be parameters
#'   to the paired geom/stat.
#' @returns A ggplot object.
#' @export
#'
#' @examples
#' library(ggplot2)
#'
#' ggplot(data.frame(x = letters[1:3], y = c(2.3, 1.9, 3.2)), aes(x, y)) +
#'   geom_col_cube()
#'

geom_col_cube <-
  function(
    radius = grid::unit(.5, "npc"),
    position = ggplot2::position_dodge(),
    ...
    )
  {
    ggrounded::geom_col_rounded(radius=radius, position=position, ...)
  }
