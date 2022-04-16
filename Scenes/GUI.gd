extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Continue_pressed():
	$ColorRect/Setting_button/menu.hide()
	get_tree().paused = false


func _on_Restart_pressed():
	get_tree().change_scene("res://Scenes/Game.tscn")
	get_tree().paused = false


func _on_quit_pressed():
	get_tree().change_scene("res://Scenes/title_screen/TitleScreen.tscn")
	get_tree().paused = false
	

