library(tidyverse)
library(nycflights13)

#pipe

#group_by & summarise

#no groups
summarise(flights, delay = mean(dep_delay, na.rm = TRUE))


#group by day
by_day <- group_by(flights, year, month, day)
summarise(by_day, delay = mean(dep_delay, na.rm = TRUE))


#remove rows with at leas one na
voos = drop_na(flights)

#1.Which day had the greatest mean departure delay?

#2.Which day had the lowest mean arrival delay?

#3.Which month had the lowest mean departure delay?

#4.Which destination has the longest air time?

#5.Which carrier travels the greatest distances, on average?


# sequence of operations --------------------------------------------------
voos = flights

#6.select the columns, carrier, distance, airtime, dep_delay, arr_delay

#7.creat a column "speed" = distance/airtime*60

#8.group by carrier and check mean speed by carrier


#start piping ---------------------------------------------------

#6.use the pipe for question 4

#7.use the pipe for question 5

#8.use the pipe for questions 6:8
flights %>% mutate(speed = distance/air_time*60) %>% group_by(carrier) %>% 
  summarise(avg_speed = mean(speed,na.rm = T)) %>% arrange(avg_speed)

# pipe it all -------------------------------------------------------------

#count elements per group
flights %>% group_by(carrier) %>% summarise(counts = n())
#9.explain the output

#10. Which destination was more popular?

#11. create a new column "route" by pasting 'origin' and 'dest'
paste(flights$origin,flights$dest,sep = '-') %>% head(5)

#13. whats the most popular route?

#12. whats the route with the highest speed?

#13. whats the route with the lowest mean departure delays?


#14. count stuff like a pro
flights %>% count(carrier, dest) 

#stil 14: get the most frequent dest for each carrier


#15.get the most frequent route for each carrier


# olympic dataset ---------------------------------------------------------
#download data from link
#https://www.dropbox.com/s/dj30dopdqreqdfh/athlete_events.csv?dl=0

df = read.csv('~/data/athlete/athlete_events.csv')

#1. How old were the youngest male and female participants of the 1996 Olympics?
df %>% drop_na('Age') %>% filter(Year == 1996) %>% group_by(Sex) %>% summarise(min(Age),max(Age))

#2. What are the mean and standard deviation of height for female basketball
# players participated in the 2000 Olympics? Round the answer to the first decimal.

#3.What was the percentage of male gymnasts among all the male participants of the 2000 Olympics?
#Round the answer to the first decimal.
df %>% filter(Sex=='M' & Sport=='Gymnastics' & Year==2000) %>% dim()
df %>% filter(Sex=='M' & Year == 2000) %>% dim()

#4.Find a sportsperson participated in the 2002 Olympics, with the highest weight among other participants of the same Olympics.
#What sport did he or she do?

#5.How many times did Pawe Abratkiewicz participate in the Olympics held in different years?
df %>% filter(Name == 'Pawe Abratkiewicz')


#6. How many silver medals in tennis did Australia win at the 2000 Olympics?
df %>% filter(Year == 2000 & Team == 'Australia' & Sport=='Tennis') %>% select(Medal) %>% table()

#7. Is it true that Switzerland won fewer medals than Serbia at the 2016 Olympics?
#Do not consider NaN values in _Medal_ column.
df %>% filter((Team == 'Serbia' | Team == 'Switzerland') & Year == 2016) %>% 
  mutate(has_medal  = !is.na(Medal)) %>% group_by(Team) %>% 
  summarise(medal_total = sum(has_medal))

  
