extends Control

@onready var PlotZone = $PlotZone

var citizen = preload("res://Citizen/Citizen.tscn")
var NbCitizen = 200

func _ready():
	UI.connect("XYaxis",_on_PlotXY)
	for i in range(NbCitizen): 
		var c = citizen.instantiate()
		c.position = Vector2(randi_range(0,int(PlotZone.size.x)),randi_range(0,int(PlotZone.size.y)))
		c.initialize()
		PlotZone.add_child(c)

func _on_PlotXY(XaxisName,YaxisName):
	clearLabels()
	
	#general labels
	$Title.text = XaxisName + " VS " + YaxisName
	$Xlabels/Xtitle.text = XaxisName
	$Ylabels/Ytitle.text = YaxisName
	
	#GetXY
	var X : Array = []
	var Y : Array = []
	for c in $PlotZone.get_children():
		X.append(c.profile[XaxisName])
		Y.append(c.profile[YaxisName])
	
	# check if string or integer and divide axis accordingly
	if typeof(X[0]) != TYPE_STRING : 
		var deltaX = X.max() - X.min()
		var X0 = createLabel(str(int(X.min())),Vector2(0.0,0.0),0.0)
		$Xlabels.add_child(X0)
		var X1 = createLabel(str(int(X.min() + 0.25*deltaX)),Vector2($Xlabels.size.x *0.25,0.0),0.0)
		$Xlabels.add_child(X1)
		var X2 = createLabel(str(int(X.min() + 0.5*deltaX)),Vector2($Xlabels.size.x * 0.5,0.0),0.0)
		$Xlabels.add_child(X2)
		var X3 = createLabel(str(int(X.min() + 0.75*deltaX)),Vector2($Xlabels.size.x * 0.75,0.0),0.0)
		$Xlabels.add_child(X3)
		var X4 = createLabel(str(int(X.max())),Vector2($Xlabels.size.x,0.0),0.0)
		$Xlabels.add_child(X4)

	if typeof(Y[0]) != TYPE_STRING : 
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
		var xPosition
		var yPosition
		if typeof(X[0]) != TYPE_STRING : xPosition = ((c.profile[XaxisName]-X.min())/(X.max()-X.min()))*$PlotZone.size.x
		if typeof(Y[0]) != TYPE_STRING : yPosition = (1-(c.profile[YaxisName]-Y.min())/(Y.max()-Y.min()))*$PlotZone.size.y
		c.position = Vector2(xPosition,yPosition)
		
func clearLabels():
	for l in $Xlabels.get_children():
		if l.name != "Xtitle" : l.queue_free()
	for l in $Ylabels.get_children():
		if l.name != "Ytitle" : l.queue_free()

func createLabel(myText,myPosition,myRotation):
	var l = Label.new()
	l.text = myText
	l.rotation_degrees = myRotation
	l.position = myPosition
	return l


