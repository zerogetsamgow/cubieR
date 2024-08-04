## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
options(verbose=FALSE)
options(warn.conflicts=FALSE)
options(tidyverse.quiet = TRUE)


## -----------------------------------------------------------------------------
library(tidyverse)
library(scales, quietly = TRUE)


## -----------------------------------------------------------------------------
library(cubieR, quietly = TRUE)

## -----------------------------------------------------------------------------
knitr::kable(head(mtcars))

## ----simple_bar,  fig.height = 4, fig.width = 6-------------------------------
# Create plot in base style
ggplot(
  data = mtcars,
  aes(x = cyl)
  ) +
geom_bar()

## ----themed_bar,  fig.height = 4, fig.width = 6-------------------------------
# Create plot in Cube Group style 
ggplot(
  data = mtcars,
  aes(x = cyl)
  ) + 
  geom_bar(fill = cube.darkgreen) +
  theme_cube_grey()

## ----scaled_bar,  fig.height = 4, fig.width = 6-------------------------------
# Create plot in Cube Group style with formatted axes
ggplot(
  data = mtcars,  
  aes(x = cyl)) +
  geom_bar(fill = cube.darkgreen) +
  scale_x_continuous(
    name = "Number of cylinders",
    breaks = seq(4,8, by =2),
      )+
  scale_y_continuous(
    name = "Number of cars in dataset",
    expand = c(0,0),
    limits = c(0,15)
  )+
  theme_cube_grey() 

## ----aggregate_mtcars---------------------------------------------------------
# Create a summary of mtcars grouped by gear and cyl
mtcars.summary = 
  mtcars |> 
  group_by(gear, cyl) |> 
  summarise(count = n(), .groups = "drop")

knitr::kable(head(mtcars.summary))
  

## ----scaled_col,  fig.height = 4, fig.width = 6-------------------------------
# Create plot in Cube Group style with formatted axes
ggplot(
  data = mtcars.summary,  
  aes(x = cyl,
      # Add y to our aesthetics
      y = count)) +
  # Substitute `geom_col` for `geom_bar`
  geom_col(
    fill = cube.darkgreen) +
  scale_x_continuous(
    name = "Number of cylinders",
    breaks = seq(4,8, by =2),
      )+
  scale_y_continuous(
    name = "Number of cars in dataset",
    expand = c(0,0),
    limits = c(0,15)
  )+
  theme_cube_grey() 

## ----filled_col,  fig.height = 4, fig.width = 6-------------------------------
ggplot(
  data = mtcars.summary,  
  aes(x = cyl,
      y = count,
      # Add `fill` to our aesthetics, we need to convert it to 
      # a discrete variable to work with a discrete palette
      fill = factor(gear)
      )) +
  geom_col() +
  scale_x_continuous(
    name = "Number of cylinders",
    breaks = seq(4,8, by =2),
      )+
  scale_y_continuous(
    name = "Number of cars in dataset",
    expand = c(0,0),
    limits = c(0,15)
  )+
  # Add a fill scale that uses a cube palette
  scale_fill_manual(
    name = "Number of gears", 
    # Use index numbers to skip grey in the palette
    values = cube_palettes$other[c(1:2,4)]) +
  theme_cube_grey() +
  # Move legend to the right to match bar column
  theme(legend.position = "right",
        legend.direction = "vertical",
        legend.title = element_text(margin = margin(0,0,2,0,"mm")))

## ----labelled_col,  fig.height = 4, fig.width = 6-----------------------------
ggplot(
  data = mtcars.summary,  
  aes(x = cyl,
      y = count,
      fill = factor(gear),
      label = count
      )) +
  geom_col() +
  # Add labels using geom_text
  geom_text(
    # Use a colour that will stand out on the fills
    colour = cube.grey,
    # Use position stack to line up with bars (rather than at y values)
    # add vjust = .5 to place in middle of each fill
    position = position_stack(vjust =.5)
  ) +
  
  scale_x_continuous(
    name = "Number of cylinders",
    breaks = seq(4,8, by =2),
      )+
  scale_y_continuous(
    name = "Number of cars in dataset",
    expand = c(0,0),
    limits = c(0,15)
  )+
  # Add a fill scale that uses a cube palette
  scale_fill_manual(
    name = "Number of gears", 
    # Use index numbers to skip grey in the palette
    values = cube_palettes$other[c(1:2,4)]) +
  theme_cube_grey() +
  # Move legend to the right to match bar column
  theme(legend.position = "right",
        legend.direction = "vertical",
        legend.title = element_text(margin = margin(0,0,2,0,"mm")))

## ----princeton_original, fig.cap = "Original visualisation", fig.height = 3, fig.width = 6----
princeton_aid.tbl = 
  read_csv(
    "c:/r/training/data/princeton_aid_example.csv",
    show_col_types = FALSE) |> 
  mutate(non_share=1-aid_share) |> 
  pivot_longer(contains("share")) |> 
  mutate(name = factor(name, 
                       levels = c("non_share","aid_share"),
                       labels = c("Not receiving aid","Receiving aid"))
  )


# Create plot in Cube Group style 
ggplot(
  data = princeton_aid.tbl,
  aes(x = 1,
      y = value,
      fill = name,
      label = scales::label_percent(accuracy = 1)(value)
  )
  ) + 
  geom_col(width = 100) +
  geom_text(
    show.legend=FALSE,
    colour = cube.darkgreen,
    size = 4, 
    position = position_stack(vjust = 0.5),
    fontface = "bold") +
  facet_grid(cols=vars(aid_year), switch = "x")+
  # Using polar coordinates converts a col chart to a pie chart.
  coord_polar("y") +
  # We use theme_cube_map for a cleaner look
  theme_cube_map(base_colour = "grey") +
  labs(title = str_to_upper("Incoming Freshmen receiving aid"),
       caption = str_to_upper("Source: Office of Admission"))+
  scale_fill_manual(name = NULL, values = cube_palettes_discrete$base)+
  theme(strip.text = 
          element_text(
            colour = cube.darkgreen, 
            face = "bold",
            margin = margin(1,1,1,1,"mm")),
        legend.position = "bottom",
        legend.justification = "left",
        legend.margin = margin(5,0,0,0,"mm"))

## ----princeton_decomposed, fig.cap = "Decomposed visualisation", fig.height = 3, fig.width = 6----
# Create plot in Cube Group style  
ggplot(
  data = princeton_aid.tbl,  
  aes(
    x = 1,    
    y = value,  
    fill = name,      
    label = scales::label_percent(accuracy = 1)(value)
    ) 
  ) + 
  geom_col(width = 100) +   
  facet_grid(cols=vars(aid_year), switch = "x") + 
  coord_polar("y") +  
  theme_cube_map(base_colour = "grey") +  
  labs(title = str_to_upper("Incoming Freshmen receiving aid"),
       caption = str_to_upper("Source: Office of Admission"))+  
  scale_fill_manual(name = NULL, values = cube_palettes_discrete$base) +  
  theme(strip.text =
          element_text(     
            colour = cube.darkgreen,  
            face = "bold",      
            margin = margin(1,1,1,1,"mm")),  
        legend.position = "bottom",        
        legend.justification = "left",     
        legend.margin = margin(5,0,0,0,"mm"))

ggplot(
  data = princeton_aid.tbl |> filter(str_detect(name,"Rec")),
  aes(x = 1,
      y = value,
      fill = name,
      label = scales::label_percent(accuracy = 1)(value)
  )
  ) + 
  geom_col(width = 100) +
  geom_text(
    show.legend=FALSE,
    colour = cube.darkgreen,
    size = 5, 
    position = position_stack(vjust = 0.5),
    fontface = "bold") +
  facet_grid(cols=vars(aid_year), switch = "x")+
  theme_cube_map(base_colour = "grey") +
  labs(title = str_to_upper("Incoming Freshmen receiving aid"),
       caption = str_to_upper("Source: Office of Admission"))+
  scale_y_continuous(limits = c(0,1))+
  scale_fill_manual(name = NULL, 
                    values = (cube_palettes_discrete$base[1:2]),
                    drop = FALSE)+
  theme(strip.text = 
          element_text(
            colour = cube.darkgreen, 
            face = "bold",
            margin = margin(1,1,1,1,"mm")),
        legend.position = "bottom",
        legend.justification = "left",
        legend.margin = margin(5,0,0,0,"mm"))

## ----princeton_line,  fig.cap = "Simplified visualisation", fig.height = 3, fig.width = 6----
ggplot(
  data = princeton_aid.tbl|> filter(str_detect(name,"Rec")),
      aes(x = aid_year,
          y = value,       
          colour = name,   
          )
      ) + 
   # geom_line_cube(linejoin = "round")+
    geom_smooth(method = "loess",
                formula = 'y ~ x',
                se=FALSE, 
                linewidth = 2, 
                lineend = "round")+
    theme_cube_grey() +
    labs(title = ("Incoming Freshmen receiving aid"),
       caption = ("Source: Office of Admission"))+ 
    scale_y_continuous(
      labels = scales::label_percent(suffix = " %"), 
      name = NULL, 
      limits = c(.4,.7)) +
  
    scale_x_continuous(breaks = seq(1998,2023, by = 5), name = NULL) +
    scale_colour_manual(
      guide = NULL, name = NULL, values = cube_palettes_discrete$base[2]) +    
    theme(axis.line = element_blank(),
          plot.caption = element_text(margin = margin(2,0,0,0,"mm"),hjust=1))

