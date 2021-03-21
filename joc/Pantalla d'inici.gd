extends Node


func _ready():
	$MarginContainer2/VBoxContainer/TextureButton.grab_focus()



func _physics_process(delta):
	if $MarginContainer2/VBoxContainer/TextureButton.is_hovered() == true:
		$MarginContainer2/VBoxContainer/TextureButton.grab_focus()
	if $MarginContainer2/VBoxContainer/TextureButton3.is_hovered() == true:
		$MarginContainer2/VBoxContainer/TextureButton3.grab_focus()
	
func _on_TextureButton_pressed():
	get_tree().change_scene("res://primera_escena.tscn") # Replace with function body.


func _on_TextureButton3_pressed():
	get_tree().quit()
