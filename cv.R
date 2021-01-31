pckgs<- c("readr", "tidyr", "ggplot2", "gganimate")
for(i in pckgs){
  if(!require(i, character.only = TRUE))
    install.packages(i)
  library(i, character.only = TRUE)
}



d<- paste("https://api.coronavirus.data.gov.uk/v2/data?areaType=overview&metric=newDeaths28DaysByDeathDate&format=csv")

data<- read_csv(d)


chart2<- ggplot(data = data, aes(x = date, y = newDeaths28DaysByDeathDate, group = 1)) +
  geom_line(size = 2)+
  geom_point(color = "black", size = 2) +
  scale_x_date(date_breaks = "10 days") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  theme(legend.position = "top", legend.title = element_blank(),legend.key = element_blank()) +
  labs(title = "date:{frame_along}") +
  transition_reveal(date)

chart2