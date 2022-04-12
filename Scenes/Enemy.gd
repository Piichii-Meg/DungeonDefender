extends PathFollow2D

signal player_damage(damage)

var health = 7
var speed = 32
var player_damage = 25

func _physics_process(delta):
	offset += speed * delta
	if offset >= 10000:
		emit_signal("player_damage", player_damage)
		queue_free()
##this means the enemy has reached the end of the path


func _on_Area2D_area_entered(area):
	if area.is_in_group("Projectile"):
		area.queue_free()
		health -=1
		if health<= 0:
			get_parent().get_parent().money += 10
			queue_free()
