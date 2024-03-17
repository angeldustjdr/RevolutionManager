extends PanelContainer

@onready var Xaxis = $MarginContainer/VBoxContainer/HBoxContainer/Xaxis/OptionButton
@onready var Yaxis = $MarginContainer/VBoxContainer/HBoxContainer/Yaxis/OptionButton
@onready var listOptions = [
	"Follow Traditions","Open to Changes","Care for others","Self Fullfillment","Age",
	"Gender","Monthly income (€)","Occupation","Lives in","Number of children"
	]

func _ready():
	for axis in [Xaxis,Yaxis]:
		for opt in listOptions:
			axis.add_item(opt)

func _on_plot_pressed():
	UI.emit_signal("XYaxis",listOptions[Xaxis.selected],listOptions[Yaxis.selected])
