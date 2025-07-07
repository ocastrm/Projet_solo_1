extends Node2D
@export var plateforme_scene :PackedScene

func _ready() -> void:
	init_niveau()

func _process(_delta: float) -> void:
	pass

func init_niveau():
	$Joueur.position = $Position_joueur.position
	$Timer_apparition_plateforme.start()

func generer_plateforme():
	var plateforme :CharacterBody2D = plateforme_scene.instantiate()
	add_child(plateforme)
	plateforme.global_position = $Position_plateforme.global_position

func _on_timer_apparition_plateforme_timeout() -> void:
	generer_plateforme()

func _on_area_2d_body_entered(body: Node2D) -> void:
	body.queue_free()
