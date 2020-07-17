
#### scrap





###### 
###### 
###### 
###### scrap work
###### 
###### 
###### 

cases %>%
  select(drop_cols) #  %>%
pivot_longer(cols = contains('/'),
             names_to = 'date',
             values_to = 'total',
             names_ptypes = list(date = convert_to_date()))



%>% 
  
  mutate(date = mdy(date)) %>% 
  arrange(date) %>% 
  group_by(date) %>%              # for aggregating total by date
  summarise(total_cases = sum(total)) %>% 
  mutate(x = total_cases - lag(total_cases, 1), 
         new_cases = coalesce(x, total_cases)) %>% 
  select(-c(x))




# clean names during import
deaths <- janitor::clean_names(readr::read_csv('https://usafactsstatic.blob.core.windows.net/public/data/covid-19/covid_deaths_usafacts.csv'))

glimpse(deaths)

columns <- c('county_fips', 'county_name', 'state', 'state_fips')

data = deaths,
cols = -columns,
names_to = 'date',
names_prefix = 'x',



deaths %>% select(-columns)



# ------------------------
# 
billboard

billboard %>%
  pivot_longer(
    cols = starts_with("wk"),
    names_to = "week",
    names_prefix = "wk",
    values_to = "rank",
    values_drop_na = TRUE)


who %>% pivot_longer(
  cols = new_sp_m014:newrel_f65,
  names_to = c("diagnosis", "gender", "age"),
  names_pattern = "new_?(.*)_(.)(.*)",
  values_to = "count")


us_deaths <- deaths %>% 
  select(-c('county_fips', 'county_name', 'state', 'state_fips')) %>% 
  pivot_longer(cols = starts_with('x'),
               names_to = 'date',
               names_prefix = 'x',
               values_to = 'total') %>% 
  mutate(date = mdy(date)) %>% 
  arrange(date) %>% 
  group_by(date) %>%              # for aggregating total by date
  summarise(total_cases = sum(total)) %>% 
  mutate(x = total_cases - lag(total_cases, 1), 
         new_cases = coalesce(x, total_cases)) %>% 
  select(-c(x))



