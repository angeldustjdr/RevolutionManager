extends Node2D

var citizen = preload("res://Citizen/citizen.tscn")

func _ready():
	for i in range(100): 
		var c = citizen.instantiate()
		c.initialize()
		add_child(c)
