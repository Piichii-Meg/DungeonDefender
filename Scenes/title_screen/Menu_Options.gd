extends Control

"""
The options menu for the menu which will have control over the sounds and fulscreen
options for the game.
by David Van Den Diepstraten
Mar. 17, 2022
Version 1
"""

##does nothing right now
func _ready():
	pass

##return to menu
func _on_Button_pressed():
	get_tree().change_scene("res://Scenes/title_screen/TitleScreen.tscn")

##option settings will be added here later
