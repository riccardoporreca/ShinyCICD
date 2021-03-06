#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @importFrom graphics hist
#' @noRd
app_server <- function(input, output, session) {

  x <- faithful[, 2]
  y <- faithful[, 3]

  # generate bins based on input$bins from ui.R
  bins <- reactive(seq(min(x), max(x), length.out = input$bins + 1))
  binsy <- reactive(seq(min(y), max(y), length.out = input$bins + 1))

  output$distPlot <- renderPlot({
    # draw the histogram with the specified number of bins
    hist(x, breaks = bins(), col = 'darkgray', border = 'white')
  })

  output$distPlot2 <- renderPlot({
    # draw the histogram with the specified number of bins
    hist(y, breaks = binsy(), col = 'darkgray', border = 'white')
  })

  output$table <- DT::renderDT(
    aggregate(faithful[, 1, drop = FALSE], list(cut(faithful[, 2], bins())), mean)
  )
}
