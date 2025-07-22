extends Area2D
var taille = 100
@export var vitesse = 5


func _physics_process(delta: float) -> void:
	if get_parent().find_child("Timer_attente_plateforme").is_stopped() and get_parent().demarrer == true :
		avancer(delta)

func avancer(delta: float):
	position.x -= taille * delta * vitesse



func _on_body_entered(body: Node2D) -> void:
	if body.name == "Joueur" :
		get_parent().recommencer_niveau()
