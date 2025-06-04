
library(tidyverse)
data3 <- read.csv("data3.csv")

EVpts <- data.frame(Shot = c("Layups/Dunks (Restricted Area)", "Midrange (5–22 ft)","3-Point Range (22 ft+)"), ExpectedPoints = c(1.331, 0.857, 1.136), stringsAsFactors = FALSE)

champions <- data.frame(year = c(2014, 2015, 2017, 2021), y = c(27.0, 31.2, 28.9, 39.4))
champions_pct <- data.frame(year = c(2014, 2015, 2017, 2021), y = c(0.398, 0.416, 0.391, 0.364))

ggplot(data3, aes(x = year, y = X3PA)) +
  geom_point() +
  labs(x="Year",y="3-Point Attempts (X3PA)", title = "Average 3-Point Attempts Per Game Over Time") +
  theme_bw()+
  theme(plot.title = element_text(face = "bold", hjust = 0.5), axis.text.x = element_text(size = 10, face = "bold"))

ggplot(EVpts, aes(x = Shot, y = ExpectedPoints)) +
  geom_col(fill = "lightblue", width = 0.5, color = "black") +
  labs(x = "Shot Ranges", y = "Expected Points Per Shot", title = "Expected Points Value Vs. Range")+
  theme_bw()+
  theme(plot.title = element_text(face = "bold", hjust = 0.5), axis.text.x = element_text(size = 10, face = "bold"))+
  geom_text(aes(label = sprintf("%.2f", ExpectedPoints)), vjust = -0.5)+
  scale_y_continuous(limits = c(0, 1.5), expand = c(0, 0))

ggplot(data3, aes(x = year)) +
  geom_point(aes(y = X3PA, color = "League Average")) +
  geom_line(aes(y = X3PA, color= "League Average")) +
  geom_point(aes(y = GSW3PA, color = "Golden State Warriors")) +
  geom_line(aes(y = GSW3PA, color= "Golden State Warriors")) +
  scale_color_manual(name = NULL, values = c("League Average" = "gray","Golden State Warriors" = "lightblue")) +
  labs(x="Year",y="3-Point Attempts (X3PA)", title = "Average 3-Point Attempts Per Game Over Time") +
  theme_bw()+
  theme(plot.title = element_text(face = "bold", hjust = 0.5), axis.text.x = element_text(size = 10, face = "bold"),aspect.ratio = 0.7) + 
  geom_text(data = champions, aes(x = year, y = y+2,label = "\U1F3C6"), color = "gold", size = 4, vjust = 0)
  
ggplot(data3, aes(x = year)) +
  geom_point(aes(y = X3PCT, color = "League Average")) +
  geom_line(aes(y = X3PCT, color= "League Average")) +
  geom_point(aes(y = GSW3pct, color = "Golden State Warriors")) +
  geom_line(aes(y = GSW3pct, color= "Golden State Warriors")) +
  scale_color_manual(name = NULL, values = c("League Average" = "gray","Golden State Warriors" = "lightblue")) +
  labs(x="Year",y="3 Point FG %", title = "Average 3-Point FG% Per Game Over Time") +
  theme_bw()+
  theme(plot.title = element_text(face = "bold", hjust = 0.5), axis.text.x = element_text(size = 10, face = "bold"),aspect.ratio = 0.7)+
  geom_text(data = champions_pct, aes(x = year, y = y+0.01,label = "\U1F3C6"), color = "gold", size = 4, vjust = 0)

