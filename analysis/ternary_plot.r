# This script will generate a ternary plot for the marine bed analysis

# Packages
pacman::p_load(
    "ggplot2",
    "ggtern")

# Read data
df <- read.csv("./raw/sample_data.csv")

# Create visualization
ternplot <- ggtern(
    data = df,
    mapping = aes(
        x = sands,
        y = clays,
        z = silts)) +
    labs(
        x = "Sand",
        y = "Clay",
        z = "Silt") +
    geom_point(
        mapping = aes(shape = locations, color = reps),
        size = 6) +
    guides(
        color = guide_legend(title = "Station"),
        shape = guide_legend(title = "Locations")) +
    scale_color_viridis_c(option = 'inferno') +
    theme_classic(base_size = 24)

# Display visualization
ternplot

# Save visualization
ggtern::ggsave(
  "ternary_plot.jpeg",
  device = "jpeg",
  path = "./plots",
  dpi = 1200)


# --------------------- Implement next feature ---------------------

# Script taken from http://www.ggtern.com/d/2.2.0/data_USDA.html
# Load the Libraries
library(ggtern)
library(plyr)

#Load the Data.
data(USDA)

#Put tile labels at the midpoint of each tile.
USDA.LAB <- ddply(USDA,"Label",function(df){
  apply(df[,1:3],2,mean)
})

#Tweak
USDA.LAB$Angle = sapply(as.character(USDA.LAB$Label),function(x){
    switch(x,"Loamy Sand"=-35,0)
})

#Construct the plot.
plot <- ggtern(data=USDA,aes(Sand,Clay,Silt,color=Label,fill=Label)) +
  geom_polygon(alpha=0.75,size=0.5,color="black") +
  geom_mask() +  
  geom_text(data=USDA.LAB,aes(label=Label,angle=Angle),color="black",size=3.5) +
  theme_rgbw() + 
  theme_showsecondary() +
  theme_showarrows() +
  weight_percent() + 
  guides(fill='none') + 
  theme_legend_position("topleft") + 
  labs(title = "USDA Textural Classification Chart",
       fill  = "Textural Class",
       color = "Textural Class")

plot

# https://www.rdocumentation.org/packages/ggtern/versions/1.0.2.0/topics/ggtern
# https://stackoverflow.com/questions/38160110/ggtern-contour-plot-in-r
# https://bitbucket.org/nicholasehamilton/ggtern/src/master/
