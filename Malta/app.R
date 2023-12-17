library(shiny)
library(leaflet)
library(shinythemes)
ui <- fluidPage(
  theme = shinytheme("readable"),
  titlePanel("Map of Malta and Island State Information"),
  tabsetPanel(
    tabPanel("Map", leafletOutput("map")),
    tabPanel("Key Facts", 
             fluidRow(
               column(6, 
                      wellPanel(
                        tags$h4("Official Languages"),
                        tags$p("Maltese, English")
                      )
               ),
               column(6, 
                      wellPanel(
                        tags$h4("Currency"),
                        tags$p("Euro")
                      )
               ),
               column(6, 
                      wellPanel(
                        tags$h4("Government"),
                        tags$p("Republic")
                      )
               ),
               column(6, 
                      wellPanel(
                        tags$h4("Area"),
                        tags$p("316 km²")
                      )
               ),
               column(6, 
                      wellPanel(
                        tags$h4("Population"),
                        tags$p("~514,564 (2022)")
                      )
               ),
               column(6, 
                      wellPanel(
                        tags$h4("Location"),
                        tags$p("Mediterranean Sea")
                      )
               )
             )
    ),
    
    tabPanel("Narrative Description", 
             fluidRow(
               column(12, 
                      wellPanel(
                        tags$h4("About Malta"),
                        tags$p("Malta is a small but historically rich island republic in the midst of the Mediterranean Sea."),
                        tags$p("Malta, with its intriguing blend of Maltese and English as official languages, has embraced its place as a cultural crossroads."),
                        tags$p("Malta, a nation with the Euro as its currency, has a strong legacy on display in its UNESCO World legacy site, Valletta."),
                        tags$p("Malta, with a surface size of 316 km2 and a population of about 514,564 people, offers a balanced blend of ancient heritage and modern vigor."),
                        tags$p("The Megalithic Temples, the azure waters of the Mediterranean, and the friendliness of its welcoming people captivate visitors."),
                        tags$p("Discover the stories inscribed in the limestone walls of this wonderful island by exploring the bustling streets, savoring the distinctive cuisine, and discovering the stories embedded in the limestone walls of this remarkable island.")
                      )
               )
             )
    ),
    tabPanel("Key Demographics", 
             fluidRow(
               column(6, 
                      wellPanel(
                        tags$h4("Population Density"),
                        tags$p("1,629 people/km²")
                      )
               ),
               column(6, 
                      wellPanel(
                        tags$h4("Median Age"),
                        tags$p("41 years")
                      )
               ),
               column(6, 
                      wellPanel(
                        tags$h4("Life Expectancy"),
                        tags$p("80.7 years")
                      )
               ),
               column(6, 
                      wellPanel(
                        tags$h4("Education"),
                        tags$p("94.4% Literacy Rate")
                      )
               ),
               column(6, 
                      wellPanel(
                        tags$h4("Employment"),
                        tags$p("Unemployment Rate: 4.4% (2022)")
                      )
               )
             )
    ),
    
    tabPanel("Comparison", 
             fluidRow(
               column(12, 
                      highchartOutput("comparisonChart")
               )
             )
    ),
    tabPanel("SWOT Analysis", 
             fluidRow(
               column(6, 
                      wellPanel(
                        tags$h4("Strengths"),
                        tags$p("- Rich historical and cultural heritage"),
                        tags$p("- Strategic location in the Mediterranean")
                      )
               ),
               column(6, 
                      wellPanel(
                        tags$h4("Weaknesses"),
                        tags$p("- Small land area limiting natural resources"),
                        tags$p("- Dependence on tourism")
                      )
               ),
               column(6, 
                      wellPanel(
                        tags$h4("Opportunities"),
                        tags$p("- Diversification of the economy"),
                        tags$p("- Sustainable tourism development")
                      )
               ),
               column(6, 
                      wellPanel(
                        tags$h4("Threats"),
                        tags$p("- Vulnerability to economic shocks"),
                        tags$p("- Environmental challenges due to tourism impact")
                      )
               )
             )
                               ),
    tabPanel("Citations",
             fluidRow(
               column(12, 
                      wellPanel(
                        tags$h4("Data Sources"),
                        tags$p("1. General Characteristics: UN Data"),
                        tags$p("2. Finances: World Bank Data"),
                        tags$p("3. Island State Information: Wikipedia"),
                        tags$p("4. Others: Chatgpt")
                        )
                      )
             )
    )
  )
)

server <- function(input, output, session) {
  output$map <- renderLeaflet({
    leaflet() %>%
      addTiles() %>%
      setView(lng = 14.51472, lat = 35.89972, zoom = 11) %>%
      addMarkers(
        lng = 14.51472,
        lat = 35.89972,
        popup = "Valletta - Capital City",
        icon = awesomeIcons(
          icon = 'star',
          markerColor = 'red',
          iconColor = 'white',
          library = 'fa'
        )
      ) %>%
      addCircles(
        lng = 14.51472,
        lat = 35.89972,
        radius = 8000,
        fillColor = 'salmon',
        color = 'salmon',
        weight = 2,
        opacity = 0.8,
        fillOpacity = 0.4
      )
  })
  
  output$comparisonChart <- renderHighchart({
    highchart() %>%
      hc_chart(type = "bar") %>%
      hc_title(text = "Comparison with Other Island States") %>%
      hc_xAxis(categories = c("Malta", "Cyprus", "Sicily", "Crete")) %>%
      hc_yAxis(title = list(text = "Population (millions)")) %>%
      hc_series(
        list(name = "Population", data = c(0.514, 1.18, 5, 0.63))
      )
  })
}

shinyApp(ui, server)
