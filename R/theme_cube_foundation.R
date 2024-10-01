#' Cube Foundation Theme
#'
#' This theme is designed to be a foundation from which to build new
#' themes, and not meant to be used directly. \code{theme_cube_foundation()}
#' is a complete theme with only minimal number of elements defined.
#' It is easier to create new Cube themes by extending this one rather
#' than \code{\link[ggplot2]{theme_gray}()} or \code{\link[ggplot2]{theme_bw}()},
#' because those themes define elements deep in the hierarchy.
#'
#' This theme takes \code{\link[ggthemes]{theme_foundations}()} and sets
#' base text family to `Open Sans``.
#'
#' @inheritParams ggthemes::theme_foundation
#'
#' @family cubethemes
#' @export
#' @importFrom ggplot2 theme
#' @importFrom ggthemes theme_foundation
#' @importFrom ggplot2 element_text
#' @importFrom ggplot2 element_rect
#' @importFrom ggplot2 element_line
#' @importFrom ggplot2 element_blank
#' @importFrom ggplot2 margin
#' @importFrom ggplot2 rel

theme_cube_foundation <-
  function(base_family = "Open Sans") {


  install_cube_fonts()

  thm <- ggthemes::theme_foundation(base_family = base_family)

  thm +
    ggplot2::theme(
      # Clear background for clean charts
      rect = element_blank(),
      line = element_blank(),
      panel.background = element_blank(),
      panel.border = element_blank(),
      # Define cube_founcation text parameters
      text =
        element_text(
          family=base_family
          ),
      plot.title =
        element_text(
          size=rel(1.2),
          face="bold",
          lineheight = 0.5,
          margin = margin(0, 0, .2, 0, "cm")
          ),
      plot.subtitle =
        element_text(
          lineheight = 0.5,
          margin = margin(0, 0, .5, 0, "cm")
        ),
      legend.text =
        element_text(
          size=rel(1)),
      legend.title =
        element_text(
          size=rel(1),
          lineheight=.3,
          vjust=.5,
          margin = margin(0,.2,0,.2,"cm")),
      axis.text =
        element_text(
          size=rel(1)
        ),
      plot.caption = element_text(size=rel(1),hjust = 0),
      strip.text = element_text(lineheight=.3, size=rel(1)),
      # Define axis foundation parameters
      axis.line =
        element_line(
          linewidth=1.1,
          lineend = "round"
          ),
      axis.ticks = element_blank(),
      # Define foundation legend parameters
      legend.background = ggplot2::element_blank(),
      legend.key = ggplot2::element_blank(),
      legend.key.size = unit(4,"mm"),
      legend.position = "bottom",
      legend.margin = ggplot2::margin(.1, .1, .1, .1, "cm"),
      legend.box.margin = ggplot2::margin(.1, .1, .1, .1, "cm"),
      # Define foundation margin parameters
      plot.margin = ggplot2::margin(.5, .5, 0, .5, "cm"),
      # Define foundation title parameters
      plot.title.position = "plot"
    )

}
