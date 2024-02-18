.onAttach <- function(...) {
  attached <- cubieverse_attach()
  if (!is_loading_for_tests()) {
    inform_startup(cubieverse_attach_message(attached))
  }

}

is_loading_for_tests <- function() {
  !interactive() && identical(Sys.getenv("DEVTOOLS_LOAD"), "tidyverse")
}
