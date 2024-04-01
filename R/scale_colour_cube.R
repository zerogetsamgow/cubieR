#' ggplots in the Cube Group palette
#'
#' @description Use the cube palette in 'ggplot2'.
#'   `scale_colour_cube()` is a wrapper function utilising
#'   the [ggplot2::scale_colour_manual()] that utilises a switch function to select a palette
#'   that works with the cube themes.
#'
#' @param cube_theme defaults to `"white"`to select colours that work on a white background
#'
#' @param ... Other arguments passed on to [ggplot2::scale_colour_manual()].
#'
#' @returns A ggplot object.
#' @export
#'
#' @examples
#' library(ggplot2)
#'
#' # To be added
#'

scale_colour_cube = function(cube_theme=c("green","orange","white","grey")){
  if(length(cube_theme)>1) {cube_theme="green"}
  if(is.null(cube_theme)) {cube_theme="green"}
  if(str_detect(cube_theme,"cube\\.")) {str_remove(cube_theme,"cube\\.")}

  .values =
    switch(cube_theme,
           "green"=cube_palettes_discrete$light,
           "orange"=cube_palettes_discrete$other,
           "white"=cube_palettes_discrete$dark,
           "grey"=cube_palettes_discrete$grey)

  scale_colour_manual(values=.values)

}
