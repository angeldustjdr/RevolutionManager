extends PanelContainer

@onready var Xaxis = $MarginContainer/VBoxContainer/HBoxContainer/Xaxis/OptionButton
@onready var Yaxis = $MarginContainer/VBoxContainer/HBoxContainer/Yaxis/OptionButton
@onready var listOptions = ["Follow Traditions","Open to Changes","Care for others","Self Fullfillment"]

func _ready():
	for axis in [Xaxis,Yaxis]:
		for opt in listOptions:
			axis.add_item(opt)

func _on_plot_pressed():
	SIGNAL.emit_signal("XYaxis",listOptions[Xaxis.selected],listOptions[Yaxis.selected])
