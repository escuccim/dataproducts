library(shiny)
library(miniUI)

myGadget <- function(numbers1 = 1:100, numbers2 = 1:100) {
    ui <- miniPage(
        gadgetTitleBar("Multiply Two Numbers"),
        miniContentPanel(
            selectInput("num1", "First Number", choices=numbers1),
            selectInput("num2", "Second Number", choices=numbers2),
            h3("Result:"),
            textOutput("foobar")
         )
    )
    server <- function(input, output, session) {
        observeEvent(input$done, {
            num1 <- as.numeric(input$num1)
            num2 <- as.numeric(input$num2)
            output$foobar <- renderText(num1*num2)
        })
    }
    runGadget(ui, server)
}