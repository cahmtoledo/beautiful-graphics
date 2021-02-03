### Using graphs for communication
library(tidyverse)

# 1. Labels
ggplot(mpg, aes(displ, hwy)) +
        geom_point(aes(color = class)) +
        geom_smooth(se = FALSE) +
        labs(
                title = paste(
                        "Fuel efficiency generally decreases with",
                        "engine size"
                ),
                subtitle = paste(
                        "Two seaters (sports cars) are an exception",
                        "because of their light weight"
                ),
                caption = "Data from fueleconomy.gov",
                x = "Engine displacement (L)",
                y = "Highway fuel economy (mpg)",
                colour = "Car type"
                
                
        )
                
# Annotations
best_in_class <- mpg %>%
        group_by(class) %>%
        filter(row_number(desc(hwy)) == 1)

ggplot(mpg, aes(displ, hwy)) +
        geom_point(aes(color = class)) +
        geom_text(aes(label = model), data = best_in_class)

ggplot(mpg, aes(displ, hwy)) +
        geom_point(aes(color = class)) +
        geom_label(
                aes(label = model),
                data = best_in_class,
                nudge_y = 2,
                alpha = 0.5,
        )

## use greppel!

ggplot(mpg, aes(displ, hwy)) +
        geom_point(aes(color = class)) +
        geom_point(size = 3, shape = 1, data = best_in_class) +
        ggrepel::geom_label_repel(nudge_y = 2,
                aes(label = model),
                data = best_in_class
        )

## display names in text
class_avg <- mpg %>%
        group_by(class) %>%
        summarize(
                displ = median(displ),
                hwy = median(hwy)
        )

ggplot(mpg, aes(displ, hwy, color = class)) +
        ggrepel::geom_label_repel(aes(label = class),
                                  data = class_avg,
                                  size = 6,
                                  label.size = 0,
                                  segment.color = NA
        ) +
        geom_point() +
        theme(legend.position = "none")

## Label in the plot
label <- mpg %>%
        summarize(
                displ = max(displ),
                hwy = max(hwy),
                label = paste(
                        "Increasing engine size is \nrelated to",
                        "decreasing fuel economy."
                )
        )
ggplot(mpg, aes(displ, hwy)) +
        geom_point() +
        geom_text(
                aes(label = label),
                data = label,
                vjust = "top",
                hjust = "right"
        )

presidential %>%
        mutate(id = 33 + row_number()) %>%
        ggplot(aes(start, id)) +
        geom_point() +
        geom_segment(aes(xend = end, yend = id)) +
        scale_x_date(
                NULL,
                breaks = presidential$start,
                date_labels = "'%y"
        )

# color pallets
ggplot(mpg, aes(displ, hwy)) +
        geom_point(aes(color = drv))

ggplot(mpg, aes(displ, hwy)) +
        geom_point(aes(color = drv)) +
        scale_color_brewer(palette = "Set1")

