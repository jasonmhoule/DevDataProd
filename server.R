shinyServer(
    function(input, output) {
        library(ggplot2)
        # Static set 1 output plot
        output$plot1 <- renderPlot(ggplot(anscombe,aes(x1,y1)) +
                                       geom_point() +
                                       geom_smooth(method="lm", se = FALSE))
        mod1 <- lm(y1 ~ x1, anscombe)
        output$slope1 <- renderText({paste("Slope: ",
                                           round(mod1$coefficients[2],2))})
        output$int1 <- renderText({paste("Intercept: ",
                                         round(mod1$coefficients[1],2))})

        # Initiate reactive values for data sets 2-4
        values <- reactiveValues(df2 = data.frame(x2=anscombe$x2,
                                                    y2=anscombe$y2),
                                 df3 = data.frame(x3=anscombe$x3,
                                                    y3=anscombe$y3),
                                 df4 = data.frame(x4=anscombe$x4,
                                                    y4=anscombe$y4)
        )
        models <- reactiveValues(mod2 = NULL,
                                 mod3 = NULL,
                                 mod4 = NULL)

        # observeEvents for each set
        observeEvent(input$text2, {
            values$df2 <- data.frame(x2=anscombe$x2,
                                       y2=-5.9957 + 
                                           2.7808*anscombe$x2 + 
                                           as.numeric(input$text2)*anscombe$x2^2)
            models$mod2 <- lm(y2 ~ x2, values$df2)
            output$slope2 <- renderText({paste("Slope: ",
                                               round(models$mod2$coefficients[2],2))})
            output$int2 <- renderText({paste("Intercept: ",
                                             round(models$mod2$coefficients[1],2))})
        })
        observeEvent(input$text3, {
            values$df3[3,2] <- as.numeric(input$text3)
            models$mod3 <- lm(y3 ~ x3, values$df3)
            output$slope3 <- renderText({paste("Slope: ",
                                               round(models$mod3$coefficients[2],2))})
            output$int3 <- renderText({paste("Intercept: ",
                                             round(models$mod3$coefficients[1],2))})
            
        })
        observeEvent(input$text4, {
            values$df4[8,1] <- as.numeric(input$text4)
            models$mod4 <- lm(y4 ~ x4, values$df4)
            output$slope4 <- renderText({paste("Slope: ",
                                               round(models$mod4$coefficients[2],2))})
            output$int4 <- renderText({paste("Intercept: ",
                                             round(models$mod4$coefficients[1],2))})
            
        })
        
        # renderPlots
        output$plot2 <- renderPlot(ggplot(values$df2, aes(x2,y2)) +
                                       geom_point() +
                                       geom_smooth(method = "lm", se = FALSE))
        output$plot3 <- renderPlot(ggplot(values$df3, aes(x3,y3)) +
                                       geom_point() +
                                       geom_smooth(method = "lm", se = FALSE) +
                                       ylim(limits = c(5,15)))
        output$plot4 <- renderPlot(ggplot(values$df4, aes(x4,y4)) +
                                       geom_point() +
                                       geom_smooth(method = "lm", se = FALSE) +
                                       xlim(limits = c(0,30)))
        
    }
)