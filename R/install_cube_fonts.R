#' Install Cube Fonts
#'
#' Themes in this package use the Google Open Sans font as an alternative to Agenda.
#' This is required to enable easy loading of the package and deployment.
#'
#' This function allows these to be installed within the package
#'
#'
#' @family cubethemes
#' @export
#' @importFrom sysfonts font_add_google
#' @importFrom showtext showtext_auto

install_cube_fonts <- function(...) {
  # Add fonts
  sysfonts::font_add_google("Open Sans")
  # Tell R to render text using showtext by calling the showtext_auto() function
  showtext::showtext_auto()

}
