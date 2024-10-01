#' Cube Map Theme
#'
#' This theme is designed to be a foundation from which to build new
#' themes, and not meant to be used directly. \code{theme_cube_map()}
#' is a complete theme with only minimal number of elements defined.
#' It is easier to create new Cube themes by extending this one rather
#' than \code{\link[ggplot2]{theme_gray}()} or \code{\link[ggplot2]{theme_bw}()},
#' because those themes define elements deep in the hierarchy.
#'
#' This theme takes \code{\link[ggthemes]{theme_map}()} and sets
#' base text family and size to `Agenda` and `15`.
#'
#' @inheritParams ggthemes::theme_foundation
#'
#' @family cubethemes
#' @export
#' @importFrom ggplot2 theme
#' @importFrom ggthemes theme_foundation
#' @importFrom cubepalette cube.lightorange
#' @importFrom cubepalette cube.darkgreen
#' @importFrom cubepalette cube.lightorange
#' @importFrom cubepalette cube.darkgreen

theme_cube_map <-
  function(
    base_colour = c("white","green", "orange", "grey"),
    base_size = 10,
    base_family = "Open Sans") {


  install_cube_fonts()

  thm <- ggthemes::theme_map(base_size = base_size, base_family = base_family)

  if(is.null(base_colour)) {base_colour="white"}
  if(length(base_colour)>1) {base_colour="white"}
  .base_colour = switch(
      base_colour,
      "white" = cubepalette::cube.white,
      "green" = cubepalette::cube.darkgreen,
      "orange" = cubepalette::cube.lightorange,
      "grey" = cubepalette::cube.grey)

  .text_colour=switch(
    base_colour,
    "white" = cubepalette::cube.darkgreen,
    "green" = cubepalette::cube.lightorange,
    "orange" = cubepalette::cube.darkgreen,
    "grey" = cubepalette::cube.darkgreen)

  .line_colour=switch(
    base_colour,
    "white" = cubepalette::cube.darkgreen,
    "green" = cubepalette::cube.lightorange,
    "orange" = cubepalette::cube.darkgreen,
    "grey" = cubepalette::cube.darkgreen)



  thm +
    ggplot2::theme(
      # Clear background for clean charts
      rect = ggplot2::element_blank(),
      line = ggplot2::element_blank(),
      panel.background = element_rect(colour="transparent",fill=.base_colour),
      plot.background = element_rect(colour="transparent",fill=.base_colour),
      panel.border = ggplot2::element_blank(),
      # Define cube_founcation text parameters
      text =
        ggplot2::element_text(
          family=base_family,
          size=base_size,
          colour=.text_colour
        ),
      plot.title =
        ggplot2::element_text(
          size=ggplot2::rel(1.2),
          face="bold",
          lineheight = 0.5,
          margin = margin(0, 0, .5, 0, "cm")
        ),
      legend.text =
        element_text(
          size=rel(1),
          margin = margin(0.1,0.1,0.1,0.1,"cm")),
      legend.title =
        element_text(
          size=rel(1),
          lineheight=.3,
          vjust=1,
          margin = margin(0,0,0,0,"cm")),
      # Define legend parameters
      legend.background = ggplot2::element_blank(),
      legend.key = ggplot2::element_blank(),
      legend.key.size = unit(4,"mm"),
      legend.position.inside = c(0,0),
      legend.title.position = "top",
      legend.direction = "horizontal",
      legend.margin = ggplot2::margin(.1, .1, 0, .1, "cm"),
      legend.spacing.y = unit(0, "cm"),
      # Define foundation margin parameters
      plot.margin = ggplot2::margin(.5, .5, 0, .5, "cm"),
      # Define foundation title parameters
      plot.title.position = "plot"
    )

}
