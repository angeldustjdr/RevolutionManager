extends Node2D

@onready var PlotZone = $PlotZone

@export var PlotZoneX = 1066
@export var PlotZoneY = 494

func _ready():
	UI.connect("XYaxis",_on_PlotXY)
	
	var NbCitizen = 200
	var citizen = preload("res://Citizen/Citizen.tscn")
	for i in range(NbCitizen): 
		var c = citizen.instantiate()
		c.position = Vector2(randi_range(0,PlotZoneX),randi_range(0,PlotZoneY))
		c.initialize()
		PlotZone.add_child(c)

func _on_PlotXY(XaxisName,YaxisName):
	clearLabels()
	
	#general labels
	$Title.text = XaxisName + " VS " + YaxisName
	$Xlabels/Xtitle.text = XaxisName
	$Ylabels/Ytitle.text = YaxisName
	
	var values = { #Valeur des labels à placer sur l'axe
		"Occupation" : {"Retired" : 100.0,
		"Unemployed - under Solidarity income benefit" : 87.5,
		"Unemployed - under Unemployment benefit" : 75.0,
		"Farmer" : 62.5,
		"Worker" : 50.0,
		"Employee" : 37.5,
		"Intermediate occupation" : 25.0,
		"Executive" : 12.5},
		
		"Lives in" : {
			"Paris" : 100.0,
			"Metropolis" : 82.5,
			"Big town" : 66.0,
			"Small town" : 49.5,
			"Village" : 33.0,
			"Tiny village" : 16.5 
		},
		
		"Number of children" : {
			"No children" : 100.0, 
			"1 child" : 75.0, 
			"2 children" : 50.0,
			"3 children" : 25.0,
			"4 children or more" : 5.0
		},
		
		"Gender" : {
			"Female" : 25.0,
			"Male" : 75.0
		}
	}
	
	var X : Array = []
	var Y : Array = []
	for c in $PlotZone.get_children():
		X.append(c.profile[XaxisName])
		Y.append(c.profile[YaxisName])
	
	match typeof($PlotZone.get_children()[0].profile[XaxisName]):
		TYPE_STRING :
			for v in values[XaxisName]:
				var X0 = createLabel(v,Vector2(values[XaxisName][v]/100 * $Xlabels.size.x,0.0),0.0)
				X0.position -= Vector2(X0.size.x/2,0.0)
				$Xlabels.add_child(X0)
		_ : # if we want to display numbers
			var deltaX = X.max() - X.min()
			var X0 = createLabel(str(int(X.min())),Vector2(0.0,0.0),0.0)
			X0.position -= Vector2(X0.size.x/2,0.0)
			$Xlabels.add_child(X0)
			var X1 = createLabel(str(int(X.min() + 0.25*deltaX)),Vector2($Xlabels.size.x *0.25,0.0),0.0)
			X1.position -= Vector2(X1.size.x/2,0.0)
			$Xlabels.add_child(X1)
			var X2 = createLabel(str(int(X.min() + 0.5*deltaX)),Vector2($Xlabels.size.x * 0.5,0.0),0.0)
			X2.position -= Vector2(X2.size.x/2,0.0)
			$Xlabels.add_child(X2)
			var X3 = createLabel(str(int(X.min() + 0.75*deltaX)),Vector2($Xlabels.size.x * 0.75,0.0),0.0)
			X3.position -= Vector2(X3.size.x/2,0.0)
			$Xlabels.add_child(X3)
			var X4 = createLabel(str(int(X.max())),Vector2($Xlabels.size.x,0.0),0.0)
			X4.position -= Vector2(X4.size.x/2,0.0)
			$Xlabels.add_child(X4)
		
	
	match typeof($PlotZone.get_children()[0].profile[YaxisName]):
		TYPE_STRING :
			for v in values[YaxisName]:
				var Y0 = createLabel(v,Vector2(0.0,(1-values[YaxisName][v]/100) * $Ylabels.size.y),-90.0)
				Y0.position += Vector2($Ylabels.size.x/2,Y0.size.x/2)
				$Ylabels.add_child(Y0)
		_ :
			var deltaY = Y.max() - Y.min()
			var Y0 = createLabel(str(int(Y.min())),Vector2(0.0,$Ylabels.size.y),-90.0)
			Y0.position += Vector2($Ylabels.size.x/2,Y0.size.x/2)
			$Ylabels.add_child(Y0)
			var Y1 = createLabel(str(int(Y.min() + 0.25*deltaY)),Vector2(0.0, $Ylabels.size.y *0.75),-90.0)
			Y1.position += Vector2($Ylabels.size.x/2,Y0.size.x/2)
			$Ylabels.add_child(Y1)
			var Y2 = createLabel(str(int(Y.min() + 0.5*deltaY)),Vector2(0.0, $Ylabels.size.y * 0.5),-90.0)
			Y2.position += Vector2($Ylabels.size.x/2,Y0.size.x/2)
			$Ylabels.add_child(Y2)
			var Y3 = createLabel(str(int(Y.min() + 0.75*deltaY)),Vector2(0.0, $Ylabels.size.y * 0.25),-90.0)
			Y3.position += Vector2($Ylabels.size.x/2,Y0.size.x/2)
			$Ylabels.add_child(Y3)
			var Y4 = createLabel(str(int(Y.max())),Vector2(0.0, 0.0),-90.0)
			Y4.position += Vector2($Ylabels.size.x/2,Y0.size.x/2)
			$Ylabels.add_child(Y4)
		
	#move citizen on the plot
	for c in $PlotZone.get_children():
		var xPosition = 0.0
		var yPosition = 0.0
		if typeof(X[0]) != TYPE_STRING : 
			xPosition = ((c.profile[XaxisName]-X.min())/(X.max()-X.min()))*PlotZoneX
		else :
			xPosition = values[XaxisName][c.profile[XaxisName]]/100.0 *PlotZoneX
		if typeof(Y[0]) != TYPE_STRING : 
			yPosition = (1-(c.profile[YaxisName]-Y.min())/(Y.max()-Y.min()))*PlotZoneY
		else :
			yPosition = (1-values[YaxisName][c.profile[YaxisName]]/100.0)*PlotZoneY
		c.move(Vector2(xPosition,yPosition))
		
func clearLabels():
	for l in $Xlabels.get_children():
		if l.name != "Xtitle" : l.queue_free()
	for l in $Ylabels.get_children():
		if l.name != "Ytitle" : l.queue_free()

func createLabel(myText,myPosition,myRotation):
	var l = Label.new()
	l.tooltip_text = myText
	if len(myText)>5 : myText = myText.left(4)+"(.)"
	l.text = myText
	l.rotation_degrees = myRotation
	l.position = myPosition
	l.mouse_filter = Control.MOUSE_FILTER_STOP
	return l


