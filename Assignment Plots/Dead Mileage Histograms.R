library(tidyverse)
library(ggplot2)

# read in the results (all constraints)
deadMilePerTrip <- read_csv('df_deadMilePlot.csv') %>% 
  subset(select = -c(X1))    # to remove the index column

# Rename the column
names(deadMilePerTrip)[1] <- "Dead_Mileage"

# Add column of dead mileage in km
deadMilePerTrip$DeadMileKM = deadMilePerTrip$Dead_Mileage / 1000

# Plot histogram
plot1 <- ggplot(deadMilePerTrip, aes(x=DeadMileKM)) + 
            geom_histogram(color="black", fill="lightgrey") + 
            labs(x="Dead Mileage (Km)", y = "No. of Trips")

plot1

ggsave(path = "Plots", file="deadMilePerTrip.png", plot1)

# let's plot a histogram showing the dead mileage on all buses (trips weighted by number of buses per trip)
deadMilePerBus <- read_csv('df_deadMilePlotRep.csv')  %>% 
  subset(select = -c(X1))    # to remove the index column

# Rename the column
names(deadMilePerBus)[1] <- "Dead_Mileage"

# Add column of dead mileage in km
deadMilePerBus$DeadMileKM = deadMilePerBus$Dead_Mileage / 1000

# Plot histogram
plot2 <- ggplot(deadMilePerBus, aes(x=DeadMileKM)) + 
            geom_histogram(color="black", fill="lightgrey") + 
            labs(x="Dead Mileage (Km)", y = "No. of Buses")

plot2

ggsave(path = "Plots", file="deadMilePerBus.png", plot2)
