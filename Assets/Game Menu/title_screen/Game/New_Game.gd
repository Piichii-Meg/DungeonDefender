extends Control

"""
Temporary scene(place holder)
by David Van Den Diepstraten
Mar. 17, 2022
Version 1
"""

##stops menu music
func _ready():
	MusicController.stop_music()

##return to menu
func _on_Button_pressed():
	get_tree().change_scene("res://title_screen/TitleScreen.tscn")
