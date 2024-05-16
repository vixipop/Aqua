extends CharacterBody2D

var speed = 200
@onready var animated_sprite = $AnimatedSprite2D

func _physics_process(delta):
	var x_direction = Input.get_axis("move_left","move_right")
	var y_direction = Input.get_axis("move_up","move_down")
	# Sprite Flipping
	if x_direction != 0:
		animated_sprite.flip_h = (x_direction == -1)
	
	# Player movement
	velocity = Vector2(x_direction * speed, y_direction * speed)
	if (velocity > Vector2(0,0)):
		animated_sprite.play("move")
	move_and_slide()
