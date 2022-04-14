extends Node2D
signal game_fin(result)

var money = 40
var wave = 0
var mobs_left = 0
var wave_mobs = [1,5,5,5,10,0]
var wave_speed = [1,2,3,4,5,100]

var player_health = 100
onready var hp_bar = get_node("GUI/Crystal_healthbar")
onready var hp_bar_tween = get_node("GUI/Crystal_healthbar/Tween")

var instance
var enemy = preload("res://Scenes/Enemy.tscn")
var tower = preload("res://Scenes/Tower.tscn")
var building = false

func _ready():
	$WaveTimer.start()
	MusicController.stop_music()
	MusicController.play_map1_music()

##function is run everytime a tower is placed
func tower_built():
	building = false
	money -= 25


##this is where our label for money is
func _process(delta):
	$GUI/ColorRect/Gold/TextureRect/Label.text = "  " + str(money)
	$GUI/ColorRect/Crystal_healthbar/Label.text = " " + str(player_health)

##enemy spawn
func _on_WaveTimer_timeout():
	mobs_left = wave_mobs[wave]
	$EnemyTimer.wait_time = wave_speed[wave]
	$EnemyTimer.start()

func _on_EnemyTimer_timeout():
	instance = enemy.instance()
	instance.connect("player_damage", self, 'on_player_damage')
	$Path2D.add_child(instance)
	mobs_left -= 1
	if mobs_left <= 0:
		$EnemyTimer.stop()
		wave += 1
		if wave < len(wave_mobs):
			$WaveTimer.start()
		else:
			get_tree().change_scene("res://Win.tscn")

##limit to tower purchase
func _on_TextureButton_pressed():
	if building == false and money >= 25:
		instance = tower.instance()
		add_child(instance)

##player damage effect
func on_player_damage(damage):
	player_health -= damage
	if player_health <= 0:
		emit_signal("game_fin", false)
	else:
		update_health_bar(player_health)

func update_health_bar(player_health):
		hp_bar_tween.interpolate_property(hp_bar, 'value', hp_bar.value, player_health, 0.1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		hp_bar_tween.start()

##When enemy exits the screen, player health takes damage
func _on_Area2D_area_entered(area):
	if area.is_in_group("Enemy"):
		area.queue_free()
		player_health -=25
		#if player_health > 0:
		#	update_health_bar(player_health)
		#else:
		#	emit_signal("game_fin", false)




