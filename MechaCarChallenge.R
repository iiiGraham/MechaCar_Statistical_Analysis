# MechCarChallenge
# read mpg data into dataframe
mpg_data <- read.csv("MechaCar_mpg.csv", check.names = F, stringsAsFactors = F)

# run linear regression on all car variables to see if any are statistically significant
mpg_analysis_1 <- lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=mpg_data)

#summarize the data to get statistical measures
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=mpg_data))

summary(mpg_analysis_1)
summary(mpg_analysis_1)$coefficient

# remove variables which are not significant
mpg_analysis_2 <- lm(mpg ~ vehicle_length + ground_clearance,data=mpg_data)
summary(mpg_analysis_2)


# Suspension Coil Analysis ----------------------------------
# load data into R dataframe
suspension <- read.csv("Suspension_Coil.csv", check.names = F, stringsAsFactors = F)

# summarize data in total_summary df
total_summary <- suspension %>% summarize(Mean=mean(PSI), Meadian=median(PSI), Variance=var(PSI), SD=sd(PSI))

# summarize statistics by lot
lot_summary <- suspension %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI), Meadian=median(PSI), Variance=var(PSI), SD=sd(PSI))

# T-Testing -------------------------------------------------
# requires x, mu, alternative
population_mean = 1500 # mu
#sample_mean = mean(suspension[["PSI"]])
sample_PSI = suspension[["PSI"]]
mean(sample_PSI)

# t-test on entire sample dataset
t.test(sample_PSI, mu=population_mean) # p-value = 0.06028

# t-test with subsets of samples based on manufacturing lot
t.test(subset(suspension, Manufacturing_Lot == "Lot1", select = c(PSI)), mu=population_mean) # p-value = 1
t.test(subset(suspension, Manufacturing_Lot == "Lot2", select = c(PSI)), mu=population_mean) # p-value = 0.6072
t.test(subset(suspension, Manufacturing_Lot == "Lot3", select = c(PSI)), mu=population_mean) # p-value = 0.4168
