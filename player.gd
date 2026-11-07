extends CharacterBody2D #make the script control our char


const SPEED = 80.0 #set movement speed to 80pixels/s
@onready var sprite =$AnimatedSprite2D

#update movement every physics frams
func _physics_process(_delta: float) -> void:

	# Get the input direction and handle the movement/deceleration.
	
	var direction = Input.get_vector("ui_left", "ui_right","ui_up","ui_down")
	velocity =direction * SPEED
	if direction != Vector2.ZERO: #if x or y are not 0, char move
		if abs(direction.x) > abs(direction.y):#decide wether the horizontal or vertilcal movment is dominant
			if direction.x > 0:
				sprite.play("walk_right")
			else:
				sprite.play("walk_left")
		else:
			if direction.y > 0:
				sprite.play("walk_down")
			else:
				sprite.play("walk_up")
	else:
		#not moving
		sprite.stop()
		sprite.frame = 0
	
	
	move_and_slide() 
