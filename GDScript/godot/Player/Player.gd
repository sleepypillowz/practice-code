extends KinematicBody2D #no idea


const ACCELERATION = 500 #change of movement over time
const MAX_SPEED = 80
const FRICTION = 500 #holds acceleration

var velocity = Vector2.ZERO #VVector2 is an x and y position

	
func _physics_process(delta): #runs every tick
	#movement
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized() #fixes diagonal movement being faster by adding some circle
	print(input_vector)
	
	if input_vector != Vector2.ZERO:
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
		
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	
	velocity = move_and_slide(velocity)
