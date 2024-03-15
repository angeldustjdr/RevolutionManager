extends CanvasLayer

var profileUI = load("res://UI/Profileviewer.tscn")

func _ready():
	UI.connect("showProfileUI",_on_showProfileUI)

func _on_showProfileUI(myProfile):
	var p = profileUI.instantiate()
	p.initializeProfileViewer(myProfile)
	add_child(p)
