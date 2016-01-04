library(rmarkdown)
library(knitr)
files <- dir(pattern = '[.]Rmd$', recursive = TRUE)
files = files[ files != "index.Rmd" ]


renderFile <- function(file) {
  output = gsub(".Rmd", ".R", file)
  ## Extract R code
  purl(file, output = output)
  
  ## Make presentation
  render(file, output_format = 'all')
}

## Render all Rmd files in this directory
for (file in files) {
  renderFile(file)
}
