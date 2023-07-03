extends Node2D

func update_text(text):
	get_node("UI/Control/Text").text = str(text)

func _ready():
	pass 
