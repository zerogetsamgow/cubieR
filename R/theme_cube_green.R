#' Cube Green Theme
#'
#' This theme takes \code{\link[cubieR]{theme_cube_foundation}()} and sets
#' background colour to green and line and text colours to pink.
#'
#' Colours are sourced from `cubepalette` and are Cube Brand Guidelines compliant.
#'
#' @family cubieR
#' @export
#' @importFrom ggplot2 theme
#' @importFrom ggplot2 element_text
#' @importFrom ggplot2 element_rect
#' @importFrom ggplot2 element_line
#' @importFrom cubepalette cube.lightorange
#' @importFrom cubepalette cube.darkgreen


theme_cube_green <-
  function(
    base.colour = cube.darkgreen,
    base.size = 10,
    line.colour = cube.lightorange,
    text.colour = cube.lightorange) {

  thm <- theme_cube_foundation()

  thm +
    ggplot2::theme(
      # Set colours
      text =
        ggplot2::element_text(
          size=base.size,
          colour = text.colour),
      plot.background =
        ggplot2::element_rect(
          fill=base.colour,
          colour = NA),
      axis.line = ggplot2::element_line(colour=line.colour),
      axis.text = ggplot2::element_text(colour=text.colour)
    )

}
