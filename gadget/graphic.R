library(shiny)
library(miniUI)

pickTrees <- function() {
    ui <- miniPage(
        gadgetTitleBar("Select Points"),
        miniContentPanel(
            plotOutput("plot", brush="brush"),
            textOutput("data")
        )
    )
    
    server <- function(input, output, session) {
        output$plot <- renderPlot({
            plot(trees$Girth, trees$Volume, main="Trees", xlab="Girth", ylab="Volume")
        })
        observeEvent(input$done, {
            points <- brushedPoints(trees, input$brush, xvar="Girth",yvar="Volume")
            output$data <- renderPrint(points)
        })
    }
    runGadget(ui, server)
}