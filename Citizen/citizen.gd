extends Node2D

var profile : Dictionary = {}
var satisfaction : float = 0.0 #Am I satisfied with my current situation (from -100 to 100)
var spark : float = 0.0 #Am I willing to act to change my situation (from -100 to 100)

var myMoralValuesScore : Dictionary = {}
# source : https://www.cairn.info/revue-francaise-de-sociologie-1-2006-4-page-929.htm
var moralValues : Array = ["Autonomy","Stimulation","Hedonism","Sucess","Power","Security","Conformity/Tradition","Kindness","Universalism"]

func initialize():
	profile = INSEE.createCitizen()
	$NameLabel.text = profile["Name"]



func _on_hover_area_mouse_entered():
	$NameLabel.visible = true
	self.modulate = Color(0.7, 0.3, 0.0, 1)
	self.z_index = 10

func _on_hover_area_mouse_exited():
	$NameLabel.visible = false
	self.modulate = Color(1, 1, 1, 1)
	self.z_index = 0

func _on_hover_area_input_event(_viewport, event, _shape_idx):
	if event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT :
		UI.emit_signal("showUI",profile)
