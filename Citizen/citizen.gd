extends Node2D

var profile : Dictionary = {}
var satisfaction : float = 0.0 #Am I satisfied with my current situation (from -100 to 100)
var spark : float = 0.0 #Am I willing to act to change my situation (from -100 to 100)

var myMoralValuesScore : Dictionary = {}
# source : https://www.cairn.info/revue-francaise-de-sociologie-1-2006-4-page-929.htm
var moralValues : Array = ["Autonomy","Stimulation","Hedonism","Sucess","Power","Security","Conformity/Tradition","Kindness","Universalism"]

func initialize():
	profile = INSEE.createCitizen()

