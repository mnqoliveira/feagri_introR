install.packages('nycflights13')
install.packages('tidyverse')

library(nycflights13)
library(tidyverse)

voo = flights
df_flights = as.data.frame(flights)
df_flights

# filter ------------------------------------------------------------------
unique(voo$year)

df1 = filter(voo, month==2, day == 20)
filter(voo, month == 11 | month == 12)

# Find all flights that:
# 
# Had an arrival delay of two or more hours
filter(voo, arr_delay >= 120)

# Flew to Houston (IAH or HOU)
filter(voo, dest=="HOU" | dest == "IAH")

# Were operated by United, American, or Delta
filter(voo, carrier == "UA" | carrier == "AA" | carrier == "DL")
# Departed in summer (July, August, and September)
filter(voo, month == 7 | month == 8 | month == 9)
# Arrived more than two hours late, but didn’t leave late
filter(voo,arr_delay>120 & dep_delay <=0)
#voos que sairam com mais de uma hora de atraso mas nao chegaram com
#mais de 30min de atraso
filter(voo, dep_delay >= 60 & arr_delay < 30) 
# Departed between midnight and 6am (inclusive)
filter(voo, dep_time >= 0 & dep_time<=600)
#   
#How many flights have a missing dep_time?
filter(voo,is.na(dep_time))


# arrange -----------------------------------------------------------------
arrange(voo, carrier)
arrange(voo, year, month, day)
arrange(voo, desc(carrier))

# Sort flights to find the most delayed flights.
arrange(voo, desc(arr_delay))
#Find the flights that left earliest.
arrange(voo, dep_delay)
# Sort flights to find the fastest flights.
arrange(voo, air_time)
# Which flights travelled the longest?
arrange(voo, desc(air_time))
#Which travelled the shortest?
arrange(voo, distance)
# select ------------------------------------------------------------------
select(voo,year,month,day)
select(voo, year:arr_time)
select(voo, -(year:day))
rename(voo, tail_num = tailnum)
select(voo, starts_with('a'))
select(voo, ends_with('e'))
select(voo, contains('_'))
select(voo, contains('dep'))



#Brainstorm as many ways as possible to select dep_time, dep_delay, arr_time,
#and arr_delay from flights.
select(voo, dep_time, dep_delay, arr_time, arr_delay)
select(voo, contains("dep"), contains("arr"))


#What happens if you include the name of a variable multiple times in a select() call?



# mutate -----------------------------------------------------------------

#create a new column ("total_delay") by summing arr_delay and dep_delay
#create a new column ("speed", in miles/hour) using air_time (minutes) and distance (miles)


# group_by and summarise ------------------------------------------------
  

# gráfico chique ----------------------------------------------------------

by_dest <- group_by(flights, dest)
delay <- summarise(by_dest,
                   count = n(),
                   dist = mean(distance, na.rm = TRUE),
                   delay = mean(arr_delay, na.rm = TRUE)
)
delay <- filter(delay, count > 20, dest != "HNL")

# It looks like delays increase with distance up to ~750 miles 
# and then decrease. Maybe as flights get longer there's more 
# ability to make up delays in the air?
ggplot(data = delay, mapping = aes(x = dist, y = delay)) +
  geom_point(aes(size = count), alpha = 1/3) +
  geom_smooth(se = FALSE)






