extends PanelContainer

func _ready():
	self.visible = false
	UI.connect("showUI",_on_showUI)

func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == MOUSE_BUTTON_RIGHT:
			self.visible = false
			UI.emit_signal("clearSelected")

func _on_showUI(profile) : 
	%Name.text = profile["Name"] + " ("+profile["Gender"][0]+")"
	%Satisfaction.text = str(profile["Satisfaction"])
	%Spark.text =str(profile["Spark"])
	%Resistance.text =str(profile["Resistance"])
	%Age.text = str(profile["Age"])+" years old"
	%Children.text = profile["Number of children"]
	%Occupation.text = profile["Occupation"]
	%Income.text = "Monthly income: "+str(profile["Monthly income (€)"])+"€"
	%City.text = "Lives in "+profile["Lives in"]
	%Country.text = "Born in "+profile["Born in"]
	%TraditionBar.value = profile["Follow Traditions"]
	%ChangeBar.value = profile["Open to Changes"]
	%CareBar.value = profile["Care for others"]
	%FullfilmentBar.value = profile["Self Fullfillment"]
	self.visible = true
	


func _on_close_button_button_down():
	self.visible = false
	UI.emit_signal("clearSelected")
