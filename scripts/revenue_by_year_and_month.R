³library(DBI)
library(ggplot2)
library(plotly)

# Establish the connection with chinook database

con <-  dbConnect(RSQLite::SQLite(),
                  "chinook.db")

# Get sum of invoices values grouped by year

yearly <- dbGetQuery(con,"
SELECT
     strftime('%Y',InvoiceDate) AS year
    ,ROUND(SUM(Total),2) AS revenue

FROM 
    invoices
    
GROUP BY year
")

# Get sum of invoice values grouped by year and month
monthly <- dbGetQuery(con,"
SELECT
     strftime('%Y',InvoiceDate) AS year
    ,strftime('%m',InvoiceDate) AS month
    ,ROUND(SUM(Total),2) AS revenue

FROM 
    invoices
    
GROUP BY year, month")


# End connection with Chinook database

dbDisconnect(con)

# Create year by year revenue chart

yearly_plot <- ggplot(yearly,aes(x = year, y = revenue)) +
  geom_col(fill = "slategray",width = 0.7) +
  theme_minimal() + labs(
    title = "Shop revenue by years",
    y ="")


ggplotly(yearly_plot)

# Create monthly revenue chart

monthly_plot <- ggplot(monthly,aes(x = month, y = revenue,group = year)) +
  geom_line(color = "slategray") +
  facet_wrap(~ year, ncol = 3,nrow = 2) +
  theme_minimal() + labs(
    title = "Shop revenue by months",
    x ="",
    y ="")

ggplotly(monthly_plot, tooltip = c("month","revenue"))
