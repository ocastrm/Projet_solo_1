extends Node2D
@export var plateforme_scene :PackedScene
@export var porte_scene :PackedScene
@export var muret_scene :PackedScene
var demarrer = false
@export var vague = 10
@export var bpm = 60
var vague_passe = 0

func _ready() -> void:
	debut_jeux()

func _process(_delta: float) -> void:
	pass

func debut_jeux():
	$Joueur.position = $Position_joueur.position
	for i in range(8):
		generer_plateforme(Vector2($Position_plateforme.global_position.x - i * 100,$Position_plateforme.global_position.y))
		$Start_timer.start()
		generer_porte($Position_joueur.global_position)

func init_niveau():
	$Timer_apparition_plateforme.start()
	$Timer_attente_plateforme.start()
	demarrer = true

func fin_niveau():
	demarrer = false
	recommencer_niveau()

func generer_plateforme(Position):
	var plateforme :CharacterBody2D = plateforme_scene.instantiate()
	add_child(plateforme)
	plateforme.global_position = Position

func generer_muret(Position):
	var muret :Area2D = muret_scene.instantiate()
	add_child(muret)
	muret.global_position = Position

func generer_porte(Position):
	var porte = porte_scene.instantiate()
	add_child(porte)
	porte.global_position = Position

func verifier_action():
	for i in $Joueur.prochaines_actions :
		print(i)
		if i == "sauter" :
			$Joueur.temps = 0
			$Joueur.saut = true
			$Joueur.prochaines_actions = []

func verifier_apparition_muret():
	var muret_potentielle = randi_range(0,1)
	if muret_potentielle == 1 :
		generer_muret($Position_muret.global_position)

func faire_disparaitre_plateforme():
	pass

func recommencer_niveau():
	get_tree().reload_current_scene()
	
	
func _on_timer_apparition_plateforme_timeout() -> void:
	if vague_passe < vague :
		generer_plateforme($Position_plateforme.global_position)
		verifier_apparition_muret()
		faire_disparaitre_plateforme()
		$Timer_attente_plateforme.start()
		vague_passe += 1
		if vague_passe == vague - 5 :
			generer_porte(Vector2($Position_plateforme.global_position.x,$Position_joueur.global_position.y))
	else :
		generer_plateforme($Position_plateforme.global_position)
		fin_niveau()

func _on_start_timer_timeout() -> void:
	init_niveau()

func _on_area_2d_body_entered(body: Node2D) -> void:
	body.queue_free()

func _on_timer_attente_plateforme_timeout() -> void:
	verifier_action()
