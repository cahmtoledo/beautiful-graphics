library(tidyverse)
mpg <- mpg
ggplot(data = mpg) +
        geom_point(mapping = aes(x = displ, y= hwy))

# ggplot(data = <DATA>) +
#         <GEOM_FUNCTION>(mapping = aes(mappings))

head(mpg)

ggplot(data = mpg) +
        geom_point(mapping = aes(x = drv, y = hwy))

ggplot(data = mpg) +
        geom_point(mapping = aes(x = displ, y= hwy, color = class))

ggplot(data = mpg) +
        geom_point(mapping = aes(x = displ, y= hwy, color = class, color = drv))

ggplot(data = mpg) +
        geom_point(mapping = aes(x = displ, y= hwy,# color = class, 
                                 stroke = rep(c(T,F), 117)
                                 )
                   )
ggplot(data = mpg) +
        geom_point(mapping = aes(x = displ, y = hwy)) +
        facet_wrap(~ drv, nrow = 2)

ggplot(data = mpg) +
        geom_point(mapping = aes(x = displ, y = hwy)) +
        facet_grid(drv ~ cyl)

## Testing different geoms

ggplot(data = mpg) +
        geom_point(mapping = aes(x = displ, y = hwy))

ggplot(data = mpg) +
        geom_smooth(mapping = aes(x = displ, y = hwy))

## geom_smooth with another aes parameter
ggplot(data = mpg) +
        geom_smooth(mapping = aes(displ, hwy, linetype = as.factor(cyl))) +
        geom_point(mapping = aes(displ, hwy, colour = as.factor(cyl)))

# to see other geoms https://www.ggplot2-exts.org

## it's possibçe to add mapping in ggplot so we have a globa mapping

ggplot(data = mpg, mapping = aes(displ, hwy)) + 
        geom_smooth() +
        geom_point(mapping = aes(colour = as.factor(cyl)))

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
        geom_point(mapping = aes(color = class)) +
        geom_smooth(
                data = filter(mpg, class == "subcompact"),
        )
### Bar plot
ggplot(data = diamonds) +
        geom_bar(mapping = aes(x = cut, y = ..prop.., group = 1))
?geom_bar

ggplot(data = diamonds) +
        geom_bar(mapping = aes(x = cut, fill = clarity))


### stat summary
ggplot(data = diamonds) +
        stat_summary(
                mapping = aes(x = cut, y = depth),
                fun.ymin = min,
                fun.ymax = max,
                fun.y = median
        )

### position
ggplot(
        data = diamonds,
        mapping = aes(x = cut, fill = clarity)
) +
        geom_bar(alpha = 1/5, position = "identity")

ggplot(
        data = diamonds,
        mapping = aes(x = cut, color = clarity)
) +
        geom_bar(fill = NA, position = "dodge")


