extends CharacterBody2D

const SPEED = 10000
@onready var animation = $AnimatedSprite2D
var _can_use = []

# The inventory of the player as an array of item names
var inventory = 0

func _physics_process(delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * (SPEED*delta)
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
			print("I can pickup: " + body.get_parent().item)

func _on_body_exited(body):
	if body.get_parent() in _can_use:
		_can_use.erase(body.get_parent())

func _item_picked_up(item_body):
	print("Я підібрав "+ item_body.item)
	inventory+=1
	print("Інвентар: %s" % str(inventory))
	item_body.queue_free()


func _input(event):
	if event.is_action_pressed("e_key") and (_can_use.size() != 0):
		_item_picked_up(_can_use[0])
		_can_use.remove_at(0)
