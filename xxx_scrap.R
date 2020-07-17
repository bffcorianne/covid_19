#### 04_data_transform

#### transform data from wide to long and drop excess columns.
us_cases <- cases %>%
  select(-c(countyFIPS, `County Name`, State, stateFIPS)) %>% 
  pivot_longer(cols = contains('/'),
               names_to = 'date',
               values_to = 'total') %>% 
  mutate(date = mdy(date)) %>% 
  arrange(date) %>% 
  group_by(date) %>%              # for aggregating total by date
  summarise(total_cases = sum(total)) %>% 
  mutate(x = total_cases - lag(total_cases, 1), 
         new_cases = coalesce(x, total_cases)) %>% 
  select(-c(x))



us_deaths <-  deaths %>% 
  select(-c(countyFIPS, `County Name`, State, stateFIPS)) %>% 
  pivot_longer(cols = contains('/'),
               names_to = 'date',
               values_to = 'total') %>% 
  mutate(date = mdy(date)) %>% # sets character date to proper date format
  arrange(date) %>% 
  group_by(date) %>%              # for aggregating total by date
  summarise(total_deaths = sum(total)) %>%
  mutate(x = total_deaths - lag(total_deaths, 1),
         new_deaths = coalesce(x, total_deaths)) %>% 
  select(-c(x))



# make one table with new cases and new deaths per day 
covid <- left_join(x = us_cases,
                   y = us_deaths)


# Need to super impose deaths onto daily w/ dual axis.
covid %>% 
  ggplot(aes(x = date)) +
  geom_line(aes(y = new_cases)) +
  geom_line(aes(y = new_deaths)) +
  scale_y_continuous(sec_axis = sec_axis(~. *5, name = deaths))

