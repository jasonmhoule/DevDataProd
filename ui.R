shinyUI(fluidPage(
    tags$head(
        tags$style(HTML("
                        td {
                        padding: 20px;
                        vertical-align: top;
                        }
                        "))
        ),
    headerPanel("Anscombe wishes he'd had Shiny!"),
    mainPanel(
        p('Anscombe\'s quartet is a data set that shows that summary statistics can be deceiving.'),
        p('It must have been difficult to build these sets to match one another just so.'),
        p('However, with Shiny, the work becomes a bit easier.'),
        p('Manipulate the data sets using inputs below to obtain the same summary statistics as Data Set 1.'),
        tags$table(
            tags$tr(
                tags$td(
                    h2('Data Set 1'),
                    p('This is what you need to match. The summary statistics are below the plot.'),
                    plotOutput('plot1',height = "200px"),
                    textOutput('slope1'),
                    textOutput('int1')),
                tags$td(
                    h2('Data Set 2'),
                    p('This slider manipulates the quadratic coefficient of the set of points.
                      Change this variable so that the linear fit matches Data Set 1.'),
                    sliderInput("text2", label = "Value for 2", -.4, .1, 0, 0.001),
                    plotOutput('plot2',height = "200px"),
                    textOutput('slope2'),
                    textOutput('int2'))
            ),
            tags$tr(
                tags$td(
                    h2('Data Set 3'),
                    p('This slider manipulates the y-value of one point.
                      Change this variable so that the linear fit matches Data Set 1.'),
                    sliderInput("text3", label = "Value for 3", 6, 15, 8.5, 0.01),
                    plotOutput('plot3',height = "200px"),
                    textOutput('slope3'),
                    textOutput('int3')),
                tags$td(
                    h2('Data Set 4'),
                    p('This slider manipulates the x-value of one point.
                      Change this variable so that the linear fit matches Data Set 1.'),
                    sliderInput("text4", label = "Value for 4", 0, 30, 8, 0.1),
                    plotOutput('plot4',height = "200px"),
                    textOutput('slope4'),
                    textOutput('int4'))
            )
        )
    )
))