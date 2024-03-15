extends Node2D

var citizen = preload("res://Citizen/Citizen.tscn")
var NbCitizen = 200

func _ready():
	for i in range(NbCitizen): 
		var c = citizen.instantiate()
		c.position = Vector2(int(randf_range(-1152./2,1152./2)),int(randf_range(-648./2,648./2)))
		c.initialize()
		add_child(c)
