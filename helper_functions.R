
# LIBRARIES ---------------------------------------------------------------
if(!require("pacman")) install.packages("pacman")

pacman::p_load(tidyverse, readxl, ggiraph)

# FUNCTIONS ---------------------------------------------------------------

#' line_plot
#'
#' @param data 
#'
#' @returns Interactive ggplot
#' @export
#'
#' @examples
#' 
#' 
line_plot <- function(data){
  data |>
    dplyr::mutate(Date = lubridate::as_date(Date, format = "%m/%d/%Y")) |>
    ggplot2::ggplot() +
    ggplot2::geom_line(aes(x = Date, y = Impressions), color = "blue") +
    ggplot2::geom_line(aes(x = Date, y = Engagements), color = "green4") +
    ggplot2::theme_minimal()
}


#' scatter_plot_eng_imp
#'
#' @param data 
#'
#' @returns
#' @export
#'
#' @examples
scatter_plot_eng_imp <- function(data){
  data |>
    dplyr::mutate(Date = lubridate::as_date(Date, format = "%m/%d/%Y")) |>
    ggplot2::ggplot(aes(x = Engagements, y = Impressions)) +
    ggplot2::geom_point() +
    ggplot2::geom_smooth(method = "glm") +
    ggplot2::theme_minimal()
}













