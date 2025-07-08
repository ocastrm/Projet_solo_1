extends CharacterBody2D
var prochaines_actions = []
var temps = 0
var position_au_sol = Vector2(330, 1005)
var saut = false

func _physics_process(delta: float) -> void:
	if saut == true :
		if temps < 1 :
			temps += delta
		sauter_frame(temps)

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("Saut"):
		if not "sauter" in prochaines_actions :
			prochaines_actions.append("sauter")

func sauter_frame(temps_saut):
	global_position = position_au_sol.bezier_interpolate(Vector2(position_au_sol.x , position_au_sol.y - 133.33),Vector2(position_au_sol.x , position_au_sol.y - 133.33),position_au_sol,temps_saut)
