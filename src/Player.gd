extends TextureRect

func update_ui():
	print("Player(HP=%d/%d, shield=%d)"%[PlayerInfo.HP,PlayerInfo.maxHP,PlayerInfo.shield])
	
	var HPBar=self.get_node("../PlayerHP")
	var HPLabel=self.get_node("../PlayerHP/Label")
	var ShieldLabel=self.get_node("../PlayerBuffs/Def/Label")
	HPBar.value = PlayerInfo.HP
	HPLabel.text = str(PlayerInfo.HP) + "/" + str(PlayerInfo.maxHP)
	ShieldLabel.text = str(PlayerInfo.shield)
	

func add_shield(value):
	PlayerInfo.shield+=value
	self.update_ui()

func subtract_shield(dmg):
	var subtracted_dmg=clamp(dmg,0,PlayerInfo.shield)
	PlayerInfo.shield-=subtracted_dmg
	return dmg-subtracted_dmg

func damage(value):
	value=subtract_shield(value)
	
	PlayerInfo.HP = clamp(PlayerInfo.HP - value, 0, PlayerInfo.maxHP)
	if(PlayerInfo.HP==0):
		get_tree().change_scene("res://src/Lost/Lost.tscn")
		# FUCKING DIE
		
	self.update_ui()

