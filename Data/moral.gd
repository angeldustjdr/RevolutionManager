extends Node

var coef = 10.0

# source : https://www.cairn.info/revue-francaise-de-sociologie-1-2006-4-page-929.htm
var AgeCorrelation = {
	"Follow Traditions" : load("res://Data/Correlations/Age_on_Tradition.tres"),
	"Open to Changes" : load("res://Data/Correlations/Age_on_Change.tres"),
	"Care for others" : load("res://Data/Correlations/Age_on_Care.tres"),
	"Self Fullfilement" : load("res://Data/Correlations/Age_on_Self.tres"),
	}

func calculateInitialMoralScores(myProfile):
	var myMoralScore = {
	"Follow Traditions" : 10.0,
	"Open to Changes" : 10.0,
	"Care for others" : 10.0,
	"Self Fullfilement" : 10.0,
	}
	
	for k in myMoralScore:
		#age
		myMoralScore[k] = clamp(myMoralScore[k] + coef * AgeCorrelation[k].sample(myProfile["Age"]/100.0),0.0,100.0)
		#gender
		#education
		#revenue
		#habitation
		#nbChildren
		#immigre
	
	return myMoralScore

