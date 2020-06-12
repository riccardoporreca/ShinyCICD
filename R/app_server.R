#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @importFrom graphics hist
#' @noRd
app_server <- function(input, output, session) {

  x <- faithful[, 2]

  # generate bins based on input$bins from ui.R
  bins <- reactive(seq(min(x), max(x), length.out = input$bins + 1))

  output$distPlot <- renderPlot({
    # draw the histogram with the specified number of bins
    hist(x, breaks = bins(), col = 'darkgray', border = 'white')
  })

  output$table <- DT::renderDT(
    aggregate(faithful[, 1, drop = FALSE], list(cut(faithful[, 2], bins())), mean)
  )
}
