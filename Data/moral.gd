extends Node

var coef = 25.0

# source : https://www.cairn.info/revue-francaise-de-sociologie-1-2006-4-page-929.htm
var AgeCorrelation = {
	"Follow Traditions" : load("res://Data/Correlations/Age_on_Tradition.tres"),
	"Open to Changes" : load("res://Data/Correlations/Age_on_Change.tres"),
	"Care for others" : load("res://Data/Correlations/Age_on_Care.tres"),
	"Self Fullfillment" : load("res://Data/Correlations/Age_on_Self.tres"),
	}
	
var GenderCorrelation = {
	"Follow Traditions" : load("res://Data/Correlations/Gender_on_Tradition.tres"),
	"Open to Changes" : load("res://Data/Correlations/Gender_on_Change.tres"),
	"Care for others" : load("res://Data/Correlations/Gender_on_Care.tres"),
	"Self Fullfillment" : load("res://Data/Correlations/Age_on_Self.tres"),
	}

var EducationCorrelation = {
	"Follow Traditions" : load("res://Data/Correlations/Education_on_Tradition.tres"),
	"Open to Changes" : load("res://Data/Correlations/Education_on_Change.tres"),
	"Care for others" : load("res://Data/Correlations/Education_on_Care.tres"),
	"Self Fullfillment" : load("res://Data/Correlations/Education_on_Self.tres"),
	}

var RevenueCorrelation = {
	"Follow Traditions" : load("res://Data/Correlations/Revenue_on_Tradition.tres"),
	"Open to Changes" : load("res://Data/Correlations/Revenue_on_Change.tres"),
	"Care for others" : load("res://Data/Correlations/Revenue_on_Care.tres"),
	"Self Fullfillment" : load("res://Data/Correlations/Revenue_on_Self.tres"),
	}
	
var HabitationCorrelation = {
	"Follow Traditions" : load("res://Data/Correlations/Habitation_on_Tradition.tres"),
	"Open to Changes" : load("res://Data/Correlations/Habitation_on_Change.tres"),
	"Care for others" : load("res://Data/Correlations/Habitation_on_Care.tres"),
	"Self Fullfillment" : load("res://Data/Correlations/Habitation_on_Self.tres"),
	}

func calculateInitialMoralScores(myProfile):
	var myMoralScore = {
	"Follow Traditions" : 10.0,
	"Open to Changes" : 10.0,
	"Care for others" : 10.0,
	"Self Fullfillment" : 10.0,
	}
	
	for k in myMoralScore:
		#age
		myMoralScore[k] = clamp(myMoralScore[k] + coef * AgeCorrelation[k].sample(myProfile["Age"]/100.0),0.0,100.0)
		#gender
		var gender01 = 0.0 + randf_range(0.0,0.25)
		if myProfile["Gender"] == "Female" : gender01 = 1 - randf_range(0.0,0.25)
		myMoralScore[k] = clamp(myMoralScore[k] + coef * GenderCorrelation[k].sample(gender01),0.0,100.0)
		#education
		var EducationLevel = {
			"Retired" : randf_range(0.0,1.0),
			"Unemployed - under Unemployment benefit" : randf_range(0.0,0.2) ,
			"Unemployed - under Solidarity income benefit" : randf_range(0.0,0.3) ,
			"Worker" : 0.1 + randf_range(0.0,0.2) ,
			"Farmer" : 0.0 + randf_range(0.0,0.3) ,
			"Employee" : 0.3 + randf_range(0.0,0.3) ,
			"Intermediate occupation" : 0.5 + randf_range(0.0,0.2) ,
			"Executive" : 1.0 - randf_range(0.0,0.1)
		}
		myMoralScore[k] = clamp(myMoralScore[k] + coef * EducationCorrelation[k].sample(EducationLevel[myProfile["Occupation"]]),0.0,100.0)
		#revenue
		myMoralScore[k] = clamp(myMoralScore[k] + coef * RevenueCorrelation[k].sample(myProfile["Monthly income (€)"]/5000.),0.0,100.0)
		#habitation
		var HabitationLevel = {
			"Paris" : 0.0 + randf_range(0.0,0.1),
			"Metropolis" : 0.1 + randf_range(0.0,0.1),
			"Big town" : 0.2 + randf_range(0.0,0.1),
			"Small town" : 0.5 + randf_range(0.0,0.1),
			"Village" : 0.7 + randf_range(0.0,0.1),
			"Tiny village" : 1.0  - randf_range(0.0,0.1)
		}
		myMoralScore[k] = clamp(myMoralScore[k] + coef * HabitationCorrelation[k].sample(HabitationLevel[myProfile["Lives in"]]),0.0,100.0)
	
	# Renormalization
	var sum1 = myMoralScore["Follow Traditions"]+myMoralScore["Open to Changes"]
	myMoralScore["Follow Traditions"] = 100*myMoralScore["Follow Traditions"]/sum1
	myMoralScore["Open to Changes"] = 100*myMoralScore["Open to Changes"]/sum1
	
	var sum2 = myMoralScore["Care for others"]+myMoralScore["Self Fullfillment"]
	myMoralScore["Care for others"] = 100*myMoralScore["Care for others"]/sum2
	myMoralScore["Self Fullfillment"] = 100*myMoralScore["Self Fullfillment"]/sum2
	
	return myMoralScore

