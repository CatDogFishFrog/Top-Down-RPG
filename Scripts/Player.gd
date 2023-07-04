extends CharacterBody2D

@export var speed: int = 10000
@onready var animation = $AnimatedSprite2D
var _can_use = []

var inventory = {}

func _physics_process(delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * (speed*delta)
	move_and_slide()

	if Input.is_action_pressed("down"): animation.play("walk_down")
	elif Input.is_action_pressed("up"): animation.play("walk_up")
	elif Input.is_action_pressed("left"): animation.play("walk_left")
	elif Input.is_action_pressed("right"): animation.play("walk_right")
	else: animation.play("idle")

func _ready():
	name = "Player"
	$Area2D.connect("body_entered", Callable(self, "_on_body_entered"))
	$Area2D.connect("body_exited", Callable(self, "_on_body_exited"))

func _on_body_entered(body):
	if "pickup" in body.get_parent():
		if body.get_parent().pickup:
			_can_use.append(body.get_parent())
			print("I can pickup: " + body.get_parent().item["name"]) # Лог інвентаря

func _on_body_exited(body):
	if body.get_parent() in _can_use:
		_can_use.erase(body.get_parent())

func _item_picked_up(item_object):
	print("Я підібрав "+ item_object.item["name"] + ". Кількість: " + str(item_object.amount)) # Лог інвентаря
	
	if item_object.item["id"] in inventory.keys():
		inventory[item_object.item["id"]] += item_object.amount
	else:
		inventory[item_object.item["id"]] = item_object.amount
	
	get_parent().update_text(str(inventory)) # Лог інвентаря

	item_object.queue_free()

func _input(event):
	if event.is_action_pressed("e_key") and (_can_use.size() != 0):
		_item_picked_up(_can_use[0])
		_can_use.remove_at(0)
