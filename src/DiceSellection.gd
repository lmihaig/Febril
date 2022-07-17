extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var sellected=[]
var dice_faces=[]

func start_sellection(dice_faces):
	self.sellected=[]
	self.dice_faces=dice_faces
	for face_id in [1,2,3]:
		get_child(face_id).icon=dice_faces[face_id-1].get_texture()
		get_child(face_id).get_child(0).visible=false
		
	self.visible=true

# Called when the node enters the scene tree for the first time.
func _ready():
	self.visible=false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func activate_selected():
	self.visible=false
	
	var player=get_node("/root/Combat/PlayerContainer/PlayerStats/Player")
	var enemy=get_node("/root/Combat/EnemyContainer/EnemyStats/Enemy")
	
	for face_id in sellected:
		var face=dice_faces[face_id-1]
		face.activate(player, enemy)

func _on_Face1_pressed():
	var face_id=1
	var sprite=self.get_child(face_id).get_child(0)
	if face_id in sellected:
		sellected.erase(face_id)
		sprite.visible=false
	else:
		if len(sellected)<2:
			sellected.append(face_id)
			sprite.visible=true

func _on_Face2_pressed():
	var face_id=2
	var sprite=self.get_child(face_id).get_child(0)
	if face_id in sellected:
		sellected.erase(face_id)
		sprite.visible=false
	else:
		if len(sellected)<2:
			sellected.append(face_id)
			sprite.visible=true
	
func _on_Face3_pressed():
	var face_id=3
	var sprite=self.get_child(face_id).get_child(0)
	if face_id in sellected:
		sellected.erase(face_id)
		sprite.visible=false
	else:
		if len(sellected)<2:
			sellected.append(face_id)
			sprite.visible=true


func _on_Lock_in_pressed():
	if len(sellected)!=2:
#		alert()
		pass
	else:
		print(sellected)
		self.activate_selected()
		
