library(shiny)
library(dplyr)
library(ggplot2)
library(DT)

data <- read.csv('df_hw7.csv')

ui <- fluidPage(
  fluidRow(
    column(3, textOutput("kpi_na")),
    column(3, textOutput("kpi_eu")),
    column(3, textOutput("kpi_jp")),
    column(3, textOutput("kpi_other"))
  ),
  plotOutput("line_chart"),
  plotOutput("bar_chart"),
  DTOutput("data_table"),
  selectInput("platform_filter", "Выберите платформу", choices = unique(data$Platform)),
  sliderInput("year_filter", "Выберите диапазон годов", min(data$Year), max(data$Year), value = c(min(data$Year), max(data$Year)))
)

server <- function(input, output) {
  kpi_na <- mean(data$NA_Sales, na.rm = TRUE)
  kpi_eu <- mean(data$EU_Sales, na.rm = TRUE)
  kpi_jp <- mean(data$JP_Sales, na.rm = TRUE)
  kpi_other <- mean(data$Other_Sales, na.rm = TRUE)
  output$kpi_na <- renderText(kpi_na)
  output$kpi_eu <- renderText(kpi_eu)
  output$kpi_jp <- renderText(kpi_jp)
  output$kpi_other <- renderText(kpi_other)
  output$line_chart <- renderPlot({
    ggplot(data, aes(x = Year)) +
      geom_line(aes(y = NA_Sales, color = "NA Sales")) +
      geom_line(aes(y = EU_Sales, color = "EU Sales")) +
      geom_line(aes(y = JP_Sales, color = "JP Sales")) +
      geom_line(aes(y = Other_Sales, color = "Other Sales")) +
      labs(title = "Динамика продаж", y = "Продажи", x = "Год")
  })
  output$bar_chart <- renderPlot({
    data_genre <- data %>% group_by(Genre) %>% summarise(
      NA_Sales = sum(NA_Sales, na.rm = TRUE),
      EU_Sales = sum(EU_Sales, na.rm = TRUE),
      JP_Sales = sum(JP_Sales, na.rm = TRUE),
      Other_Sales = sum(Other_Sales, na.rm = TRUE)
    )
    ggplot(data_genre, aes(x = Genre)) +
      geom_bar(aes(y = NA_Sales, fill = "NA Sales"), stat = "identity") +
      geom_bar(aes(y = EU_Sales, fill = "EU Sales"), stat = "identity") +
      geom_bar(aes(y = JP_Sales, fill = "JP Sales"), stat = "identity") +
      geom_bar(aes(y = Other_Sales, fill = "Other Sales"), stat = "identity") +
      labs(title = "Продажи по жанрам", y = "Продажи", x = "Жанр") +
      theme(axis.text.x = element_text(angle = 45, hjust = 1))
  })
  output$data_table <- renderDT({
    datatable(data)
  })
}

shinyApp(ui, server)
