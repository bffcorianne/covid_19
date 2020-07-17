
#### 03_eda

# 03_cleanse_and_explore
# 


# basic exploration
# 
# 
# summary
summary(covid)

# notable: year. median is 1996. 
glimpse(covid)

DataExplorer::plot_density(covid)


# multivariate / correlations -- unnecessary
DataExplorer::plot_correlation(covid)

# categorical bars -- no categorical features

# make a whole report
DataExplorer::create_report(covid)

covid %>% 
  ggplot(aes(x = date,
             y = new_cases)) +
  geom_col()

