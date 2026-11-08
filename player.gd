extends CharacterBody2D #make the script control our char
var nearby_object: Interactable = null # store object the cat can interact with(null = no obj nearby)

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
	
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ji_interact"): #press E
		if nearby_object != null: #if there is obj nearby
			nearby_object.interact() # interact with obj
		else:# no obj nearby
			print("nothing nearby") #implement later: output to the game

func _on_interaction_area_area_entered(area: Area2D) -> void:
	if area is Interactable: 
		nearby_object = area# remember the obj that entering cat's  detection circle
		print("Object detected")


func _on_interaction_area_area_exited(area: Area2D) -> void:
	if nearby_object ==area: # check whether the object leaving is the one we're tracking
		nearby_object =null #clears the reference bc the object is no longer neareby
		print("object left range")
