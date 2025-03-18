library(shiny)
library(ggplot2)
library(DT)

function(input, output) {
  #Panel 1
  output$distPlot <- renderPlot({
    n <- input$n
    x <- 1:n
    prob <- input$prob
    
    y <- (1 - prob)^(x - 1) * prob  # Rumus manual distribusi geometrik
    
    ggplot(data = data.frame(x = x, y = y), aes(x = factor(x), y = y)) +
      geom_col(fill = input$warna_batang) +
      geom_line(aes(group = 1), color = input$warna_garis, size = 1) +
      theme_minimal() +
      theme(panel.background = element_rect(fill = input$warna_latar)) +
      labs(title = "Distribusi Geometrik",
           x = "Jumlah kegagalan sebelum sukses pertama (x)",
           y = "Peluang") +
      geom_text(aes(label = round(y, 3)), vjust = -0.5, size = 3) +
      geom_text(aes(label = as.character(x)), vjust = 1.2, size = 3)
  })
  
  #Panel 2 (tabel)
  output$dataTabel <- renderDT({
    n <- input$n
    x <- 1:n
    prob <- input$prob
    
    y <- (1 - prob)^(x - 1) * prob #rumus distribusi geometrik
    
    datatable(data.frame(Jumlah_Percobaan = x, Peluang = y),
              options = list(pageLength = 10))
  })
  
  #Ringkasan Statistik
  output$ringkasan <- renderPrint({
    prob <- input$prob
    mean_geom <- 1 / prob  # Mean distribusi geometrik
    var_geom <- (1 - prob) / (prob^2)  # Variansi
    sd_geom <- sqrt(var_geom)  # Standar deviasi
    
    cat("Rangkuman Statistik Distribusi Geometrik:\n")
    cat("Probabilitas Sukses (p):", input$prob, "\n")
    cat("Rata-rata (Mean):", round(mean_geom, 2), "\n")
    cat("Variansi:", round(var_geom, 2), "\n")
    cat("Standar Deviasi:", round(sd_geom, 2), "\n")
  })
}



