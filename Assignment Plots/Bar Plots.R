library(tidyverse)

# read in the results (all constraints)
results_const <- read_csv('df_plot.csv') %>% 
  subset(select = -c(X1))    # to remove the index column

names(results_const)[2] <- "Allocated"



# convert from wide to long format. This way we can add a legend
library(reshape2)
results_const_long <- melt(results_const, id.vars = c("Name"))

# plot
p <- ggplot(data=results_const_long, aes(x=Name, y=value, fill=variable, color=variable, alpha=variable)) +
          geom_bar(stat="identity", position ="identity") +
            scale_colour_manual(values=c("lightblue4","red")) +
            scale_fill_manual(values=c("lightblue","pink")) +
            scale_alpha_manual(values=c(.8, .1)) +
            coord_flip()

# Change the titles  
p <-  p + ggtitle("Depot Utilization") +
        ylab("No. of Buses") 
# Remove y axis title
p <- p + theme(axis.title.y = element_blank(),
               legend.title=element_blank())

p

ggsave(path = "Plots", file="depot_utilozation.png", p)

# facet plot
# combined <- arrangeGrob(cases, pop, ncol=2) #generates g   
