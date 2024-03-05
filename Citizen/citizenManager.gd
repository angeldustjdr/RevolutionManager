extends Node2D

var citizen = preload("res://Citizen/citizen.tscn")
var NbCitizen = 200

func _ready():
	SIGNAL.connect("ViewReady",_onViewReady)
	for i in range(NbCitizen): 
		var c = citizen.instantiate()
		c.position = Vector2(int(randf_range(-1152./2,1152./2)),int(randf_range(-648./2,648./2)))
		c.initialize()
		add_child(c)

func _onViewReady(spawningTuples,type):
	match type:
		"Default":
			var x0 = spawningTuples[0][0].x
			var x1 = spawningTuples[0][1].x
			var y0 = spawningTuples[0][0].y
			var y1 = spawningTuples[0][1].y
			for c in get_children() : 
				c.position = Vector2(randi_range(x0,x1),min(y0,y1))
				c.gravity_scale = 1
		
	return
