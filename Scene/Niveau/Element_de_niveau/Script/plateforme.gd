extends CharacterBody2D
var taille = 100
@export var vitesse = 5


func _physics_process(delta: float) -> void:
	if get_parent().find_child("Timer_attente_plateforme").is_stopped() :
		avancer(delta)

func avancer(delta: float):
	position.x -= taille * delta * vitesse
