extends Node2D

var profile : Dictionary = {}
var selected = false

func _ready():
	UI.connect("clearSelected",clearSelected)

func initialize():
	profile = INSEE.createCitizen()
	$NameLabel.text = profile["Name"]
	profile["Satisfaction"]=0.0 #Am I satisfied with my current situation (from 0 to 100)
	profile["Spark"]=0.0 #Am I willing to act to change my situation (from 0 to 100)
	profile["Resistance"]=0.0 #How easily convienced am I ? (from 0 to 100)
	var moralScore = MORAL.calculateInitialMoralScores(profile)
	profile.merge(moralScore)

func switchColor(ON_OFF):
	if ON_OFF: 
		$NameLabel.visible = true
		self.modulate = Color(1.0, 0.0, 0.0, 1.0)
		self.z_index = 10
	else : 
		if !selected :
			$NameLabel.visible = false
			self.modulate = Color(1.0, 1.0, 1.0, 1.0)
			self.z_index = 1

func clearSelected():
	selected = false
	switchColor(false)

func move(where):
	var tween = create_tween()
	tween.set_ease(Tween.EASE_OUT)
	tween.tween_property(self,"position",where,0.5)
	


func _on_area_2d_mouse_entered():
	switchColor(true)


func _on_area_2d_mouse_exited():
	switchColor(false)


func _on_area_2d_input_event(_viewport, event, _shape_idx):
	if event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT :
		UI.emit_signal("clearSelected")
		UI.emit_signal("showProfileUI",profile)
		selected = true
		switchColor(true)
