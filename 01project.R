library(rvest)

base_url <- "https://www.bruhome.com/v3/buy.asp?p_=buy&offset="
page_numbers <- 1:170

rumah123_urls <- paste0(base_url,page_numbers)
rumah123_urls

# Create an empty list to store the extracted data
scrapped_title <- data.frame()

#Loop through the URLs 
for (url in rumah123_urls) {print(url)
  #Read the HTML page
  pages <- read_html(url)
  
  #Extract the desired information from the page
  title <- pages
  html_nodes("span.property-prices")
  html_text() %>%
    
    title_data <- data.frame(url = url, title = title)
  
  #Store the extracted data in the list
  scraped_title <- rbind(scrapped_title,title_data)
  
  title
  }




