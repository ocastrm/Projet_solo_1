extends CharacterBody2D
var taille = 100
@onready var vitesse = 10


func _physics_process(delta: float) -> void:
	if get_parent().find_child("Timer_attente_plateforme").is_stopped() and get_parent().demarrer == true :
		avancer(delta)

func avancer(delta: float):
	position.x -= taille * delta * vitesse
