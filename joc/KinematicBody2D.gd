extends KinematicBody2D
var velocitat := Vector2(0,0)
export var velocitat_max = 750

func _ready():
	
	position = Vector2(200,200)  
	#flip_v=true

func _process(delta):
	velocitat=Vector2.ZERO
	 #delta temps entre successives
	if Input.is_action_pressed("ui_right"):
		velocitat += Vector2.RIGHT
	if Input.is_action_pressed("ui_left"):
		velocitat += Vector2.LEFT
	if Input.is_action_pressed("ui_up"):
		velocitat += Vector2.UP
	if Input.is_action_pressed("ui_down"):
		velocitat += Vector2.DOWN
	if Input.is_action_pressed("gira"):
		rotation_degrees+=15
	if Input.is_action_pressed("gira2"):
		rotation_degrees-=15
	velocitat = velocitat.normalized() * velocitat_max
	position += velocitat * delta