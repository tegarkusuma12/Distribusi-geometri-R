library(shiny)
library(DT)

fluidPage(
  
  titlePanel("Visualisasi Distribusi Geometrik"),
  
  tabsetPanel(
    #Navigasi Panel
    tabPanel("Grafik Plot",
      column(3,
             #Pengaturan distribusi
             wellPanel(
               sliderInput(inputId = "prob", 
                           label = "Probabilitas Sukses (p)", 
                           min = 0, max = 1, value = 0.5),
               
               numericInput(inputId = "n", 
                            label = "Jumlah Maks. Percobaan", 
                            min = 1, value = 15),
               
             ),
             
             # Pengaturan warna
             wellPanel(
               radioButtons(inputId = "warna_garis",
                            label = "Pilih Warna Garis:",
                            choices = c("Biru" = "blue", "Merah" = "red", 
                                        "Kuning" = "yellow", "Hijau" = "green"),
                            selected = "red"),
               
               radioButtons(inputId = "warna_batang",
                            label = "Pilih Warna Batang:",
                            choices = c("Biru Muda" = "lightblue", "Pink" = "pink", 
                                        "Lavender" = "lavender", "Golden" = "goldenrod"),
                            selected = "lightblue"),
               
               radioButtons(inputId = "warna_latar",
                            label = "Pilih Warna Latar:",
                            choices = c(
                              "Putih" = "white", 
                              "Mint" = "#F5FFFA", #Mint
                              "Beige" = "#F5F5DC" # Beige
                            ),
                            selected = "white")
             )
      ),
        #Grafik
        column(9,
             h4("Visualisasi Distribusi Geometrik"),
             plotOutput("distPlot")
        )
      ),
    
      tabPanel("Tabel & Ringkasan Statistik",
               fluidRow(
                 column(6,
                       h4("Tabel Data Distribusi Geometrik"),
                       DTOutput("dataTabel")
                        ),
                 column(6,
                        h4("Ringkasan Statistik"),
                        verbatimTextOutput("ringkasan")
                        )
               )
        
      )
    )
    
  
  
  )
  

