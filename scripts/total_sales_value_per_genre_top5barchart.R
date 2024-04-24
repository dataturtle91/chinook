# The script is based on the result of the total_sales_value_per_genre_sql query
# and generates a bar chart of the 5 for which the highest sales were recorded.
# The query result was exported to the genres.csv file,
# which is located in the working directory
#------------------------------------------------------------------------------

# set working directory and load the file
df <- read.csv("genre.csv", header = TRUE, sep = ",")

#Set the appropriate vector types

df$genre <- as.factor(df$genre)
df$total_sales <- as.integer(df$total_sales)
class(df[, 1])
class(df[, 2])

#make a plot of top 5 genres and sales. First bar in different colour.
attach(df)
top5genre <- genre[1:5]
top5total_sales <- total_sales[1:5]
barplot(
  height = top5total_sales,
  names.arg = top5genre,
  main = 'Chinook - most popular genres',
  col = c('blue', 'darkgray', 'darkgray', 'darkgray', 'darkgray')
)

