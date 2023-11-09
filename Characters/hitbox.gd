extends Area2D

@onready var died_sfx = $died_sfx as AudioStreamPlayer

func _on_body_entered(body: Node2D) -> void:
	
	died_sfx.play()
	
	if body.name == "Player":
		body.velocity.y = body.JUMP_VELOCITY
		owner.anim.play("hurt")
