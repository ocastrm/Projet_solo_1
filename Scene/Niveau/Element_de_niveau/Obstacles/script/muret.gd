extends Area2D
var taille = 100
var cible_x
@onready var vitesse = get_parent().bpm / 12


func _physics_process(delta: float) -> void:
	if !get_parent().find_child("Timer_mouvement_plateforme").is_stopped() and get_parent().demarrer == true :
		avancer(delta)
		if position.x < cible_x :
			position.x = cible_x
	else :
		cible_x = position.x - 100

func avancer(delta: float):
	position.x -= taille * delta * vitesse



func _on_body_entered(body: Node2D) -> void:
	if body.name == "Joueur" :
		get_parent().recommencer_niveau()
