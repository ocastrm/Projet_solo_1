extends CharacterBody2D
var taille = 100
@export var vitesse = 1


func _physics_process(delta: float) -> void:
	avancer(delta)

func avancer(delta: float):
	position.x -= taille * delta * vitesse
