
#### 02_load_data


# confirmed cases

cases <- readr::read_csv('https://usafactsstatic.blob.core.windows.net/public/data/covid-19/covid_confirmed_usafacts.csv')

deaths <- readr::read_csv('https://usafactsstatic.blob.core.windows.net/public/data/covid-19/covid_deaths_usafacts.csv')

summary(deaths)
glimpse(deaths)
# this data is wide and will need to be changed to long.
# state info | date 1/22/20 | 1/23/20 | ...n
# I want to only look at aggregates because I want to see if the cyclic nature 
# 
# want column 1: dates. col 2: sums. 

# transform wide to long, drop unneeded cols, convert date to date. change 


