extends Node

"""
The Music controller for the game used to control which music is used
for each scene and when to stop and change it. Can accest it in
Project < Project Settings < Autoload
by David Van Den Diepstraten
Mar. 20, 2022
Version 1.1
"""

##loads menu music (more music to be added for other scenes)
var menu_music = load("res://Assets/Audio/Music/MenuMusic.wav")
var map1_music = load("res://Assets/Audio/Music//Map1Song.wav")
##does nothing right now
func _ready():
	pass

##plays the menu music when called in other scenes code ex TitleScreen.gd
func play_menu_music():
	$Music.stream = menu_music
	$Music.play()

##plays the map1 music when called in other scenes code
func play_map1_music():
	$Music.stream = map1_music
	$Music.play()

##stops the current playing track
func stop_music():
	$Music.stop()
