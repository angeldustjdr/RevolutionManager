class_name citizen

var profile : Dictionary = {}
var satisfaction : float = 0.0 #Am I satisfied with my current situation (from -100 to 100)
var spark : float = 0.0 #Am I willing to act to change my situation (from -100 to 100)

var myMoralValuesScore : Dictionary = {}
var listOfValues : Array = []

func initialize():
	profile = {
		"Name" : INSEE.pickName(),
		"Age" : INSEE.pickAge()
	}
	print(profile)
