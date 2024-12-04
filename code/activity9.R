library(ggplot2)
ggplot(diamonds, aes(x = carat, y = price, color = cut)) +
  geom_point(alpha = 0.5, size=1.5) +
  scale_color_brewer(palette = "Set1") +
  labs(title = "Diamond Price by Carat and Cut", x = "Carat", y = "Price")

library(palmerpenguins)
ggplot(penguins, aes(x = species, y = bill_length_mm, fill = island)) +
  geom_boxplot(alpha = 0.7, outlier.shape = NA) +
  geom_jitter(aes(color = island), width = 0.2, alpha = 0.5) +
  labs(title = "Penguin Bill Length by Species and Island", x = "Species", y = "Bill Length (mm)")

library(babynames)
library(dplyr)

names <-c("Emma","Ethan","Mary")
babynames_filtered <- babynames %>%
  filter(name %in% names) %>%
  group_by(year,name,sex) %>%
  summarise(count=sum(n), .groups='drop')

ggplot(babynames_filtered, aes(x = year, y = count, color = name, linetype = sex)) +
  geom_line() +
  facet_wrap(~sex) +
  labs(
    title = "Popularity of Selected Baby Names Over Time",
    x = "Year",
    y = "Count",
    color = "Name",
    linetype = "Sex"
  ) +
  theme(
    legend.position="top",
    plot.title=element_text(face="bold", size=15),
    plot.subtitle=element_text(size=12)
  )