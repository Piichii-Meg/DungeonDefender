extends Control

"""
The main menu of the final project to navigate through the game options.
Project < Project Settings < General < Application < Main Scene
by David Van Den Diepstraten
Mar. 22, 2022
Version 1.2
"""

##Plays the music
func _ready():
	MusicController.stop_music()
	MusicController.play_menu_music()

##transition for going to a new game (temporay scene for now)
func _on_NewGame_pressed():
	get_tree().change_scene("res://Scenes/Game.tscn")


##transition for going to options
func _on_Options_pressed():
	var options = load("res://Scenes/title_screen/Menu_Options.tscn").instance()
	get_tree().current_scene.add_child(options)

##closes the game
func _on_Quit_pressed():
	get_tree().quit()


