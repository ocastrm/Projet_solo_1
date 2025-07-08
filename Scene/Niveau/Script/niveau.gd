extends Node2D
@export var plateforme_scene :PackedScene

func _ready() -> void:
	init_niveau()

func _process(_delta: float) -> void:
	pass

func init_niveau():
	$Joueur.position = $Position_joueur.position
	$Timer_apparition_plateforme.start()
	$Timer_attente_plateforme.start()
	for i in range(8):
		generer_plateforme(Vector2($Position_plateforme.global_position.x - i * 100,$Position_plateforme.global_position.y))

func generer_plateforme(Position):
	var plateforme :CharacterBody2D = plateforme_scene.instantiate()
	add_child(plateforme)
	plateforme.global_position = Position

func verifier_action():
	for i in $Joueur.prochaines_actions :
		print(i)
		if i == "sauter" :
			$Joueur.temps = 0
			$Joueur.saut = true
			$Joueur.prochaines_actions = []

func _on_timer_apparition_plateforme_timeout() -> void:
	generer_plateforme($Position_plateforme.global_position)
	verifier_action()
	$Timer_attente_plateforme.start()

func _on_area_2d_body_entered(body: Node2D) -> void:
	body.queue_free()
