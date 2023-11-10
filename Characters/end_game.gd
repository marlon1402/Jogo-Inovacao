extends Area2D

@onready var secrets_timer = $secrets_timer as Timer

var Secret_tela = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.name == "Player" && Secret_tela == false:
		get_tree().change_scene_to_file("res://scenes/Screens/end_game_screen.tscn")
	elif body.name == "Player" && Secret_tela == true:
		get_tree().change_scene_to_file("res://scenes/Screens/end_game_happy_screen.tscn")
	
	
func _on_secrets_timer_timeout():
	Secret_tela == false
	

