.onAttach <- function(...) {
  attached <- cubieverse_attach()
  if (!is_loading_for_tests()) {
    inform_startup(cubieverse_attach_message(attached))
    ggplot2::update_geom_defaults("line", list(linewidth = 1.2, lineend="round"))

  }

}

is_loading_for_tests <- function() {
  !interactive() && identical(Sys.getenv("DEVTOOLS_LOAD"), "cubieR")
}
