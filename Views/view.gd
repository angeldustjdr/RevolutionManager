extends Node2D

var spawningTuples : Array = []
@export var type : String

func _ready():
	for line in $SpwanPoints.get_children():
		var tuple = [line.get_point_position(0)+Vector2(-576,-324),line.get_point_position(1)+Vector2(-576,-324)]
		spawningTuples.append(tuple)
	SIGNAL.emit_signal("ViewReady",spawningTuples,type)
