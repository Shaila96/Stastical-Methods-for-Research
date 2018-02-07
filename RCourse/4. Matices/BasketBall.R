Games

rownames(Games)
colnames(Games)

Games["LeBronJames", "2013"]


FieldGoals
GoalPerMatch <- round(FieldGoals/Games, 1)
GoalPerMatch


MinutesPlayed
MinutesPlayedPerMatch <- round(MinutesPlayed/Games)  #same as round(data, 0)
MinutesPlayedPerMatch