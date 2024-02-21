

scale_colour_cube = function(cube.theme=c("green","pink","white")){
  if(is.null(cube.theme)) {cube.theme=green}
  if(str_detect(cube.theme,"cube\\.")) {str_remove(cube.theme,"cube\\.")}

  .values =
    switch(cube.theme,
           "green"=cube_palettes_discrete$light)

}
