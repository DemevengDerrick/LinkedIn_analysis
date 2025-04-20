if(!require("pacman")) install.packages("pacman")

pacman::p_load(tidyverse, readxl, ggiraph)


lindkedin_data <- readxl::read_xlsx("input/Content_2024-04-21_2025-04-20_DerrickDEMEVENG.xlsx", sheet = "ENGAGEMENT")


line_plot <- lindkedin_data |>
  dplyr::mutate(Date = lubridate::as_date(Date, format = "%m/%d/%Y")) |>
  ggplot2::ggplot() +
  ggiraph::geom_line_interactive(aes(x = Date, y = Impressions, tooltip = Impressions, data_id = Date), color = "blue4") +
  ggiraph::geom_line_interactive(aes(x = Date, y = Engagements, tooltip = Impressions, data_id = Date), color = "green4")

ggiraph::girafe(ggobj = line_plot)




lindkedin_data |>
  dplyr::mutate(Date = lubridate::as_date(Date, format = "%m/%d/%Y")) |>
  ggplot2::ggplot(aes(x = Engagements, y = Impressions)) +
  ggplot2::geom_point() +
  ggplot2::geom_smooth(method = "glm")
