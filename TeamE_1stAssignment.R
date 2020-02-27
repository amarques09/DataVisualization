#Viz Assignment

library(readxl)
library(readxl)
library(ggplot2)
library(scales)

data<-read_excel("/Users/amand/Documents/IE/2nd Term/Data Visualization/WorkedDataset_Berlin and Brandenburg Tourism (EN).xlsx")

#Part 1: General View on the data.

#Guests per Month in Berlin and Brandenburg

as.Date("Jan", format = "%b")
a <- data
data$Month <- as.factor(data$Month)
german <- levels(data$Month)
ordered_factors <- c("Januar", "Februar","März","April","Mai","Juni","Juli","August","September","Oktober","November","Dezember")
data$Month <- factor(data$Month, levels = ordered_factors, ordered= T)

ggplot(data, aes(x= Month, y=Guests)) + 
  geom_bar(stat = "identity", width = 0.5, fill="dark blue")+ 
  theme_minimal()+ 
  scale_fill_brewer(palette="Greens") +
  theme(axis.text.x = element_text(angle = 45))+
  scale_y_continuous(labels = unit_format(unit = 'M', scale = 1e-6))

  #Insights:  There is a clear trend from May to October for more guests than in Winter time.


#Guests per Year in Berlin and Brandenburg

#Part2:

#Evolution of Continent per Year (Interactive Graph)

#Small-multiples: countries from Europe (excluding Germany) that visit Berlin the most

#Map of countries of origin

#Part3:

#Districts where guests spend more nights

#Districts where guests spend more nights per Country of Origin

library(readxl)
data<-read_excel("/Users/amand/Documents/IE/2nd Term/Data Visualization/WorkedDataset_Berlin and Brandenburg Tourism (EN).xlsx")
bdata <- data[data$State == "Berlin",]

df <- data.frame(bdata)
view(df)
df2 <- subset(df, df$Country.of.Origin==c('UK','Netherlands','Spain','Italy','Denmark'),)
df2
df3 <- subset(df2,df2$County.District==c('Charlottenburg-Wilmersdorf','Mitte','Pankow','Friedrichshain-Kreuzberg','Tempelhof-Schöneberg'))
view(df3)
view(df2)

ggplot(df3, aes(x =County.District, 
                y =Country.of.Origin, 
                fill=Average.Night.by.Guest))+geom_tile() +
  scale_fill_gradient(low = "white", high = "steelblue")

#Insights: Guests visit more the District of "Mitte" however , they spend more nights at Pankow. Italians specially.

#Average Night spent per Guest per Year