extends Node2D




# Called when the node enters the scene tree for the first time.
func _ready():
	$personatge/TextureProgress.margin_top-=220
func _process(delta):
	$personatge/Camera2D.offset_v = -2

	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
