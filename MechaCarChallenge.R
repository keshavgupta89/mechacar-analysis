library(dplyr)

mechacar <- read.csv("Resources/MechaCar_mpg.csv")

reg <- lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,  data=mechacar)

reg2 <- lm(mpg ~ vehicle_length + ground_clearance,  data=mechacar)
summary(reg2)

summary(reg)
summary(reg)$r.squared

suspension_coil <- read.csv("Resources/Suspension_Coil.csv")

total_summary <- summarize(suspension_coil, Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI))

total_summary

lot_summary <- suspension_coil %>% group_by(Manufacturing_Lot) %>%  summarize(Mean=round(mean(PSI),2), Median=round(median(PSI),2), Variance=round(var(PSI),7), SD=round(sd(PSI),7)) %>% as.data.frame()

lot_summary

t.test(suspension_coil$PSI, mu=1500)
lot1 <- subset(suspension_coil, Manufacturing_Lot=="Lot1")
lot2 <- subset(suspension_coil, Manufacturing_Lot=="Lot2")
lot3 <- subset(suspension_coil, Manufacturing_Lot=="Lot3")
t.test(lot1$PSI, mu=1500)
t.test(lot2$PSI, mu=1500)
t.test(lot3$PSI, mu=1500)
