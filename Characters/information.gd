extends Node2D

@onready var texture = $texture
@onready var area_information = $area_information

const lines : Array[String] = [
	"Rapido,",
	"A professora ODEIA...",
	"quem se atrasa!",
]

func _unhandled_key_input(event):
	if area_information.get_overlapping_bodies().size() > 0:
		texture.show()
		if event.is_action_pressed("interact") && !DialogManager.is_message_active:
			texture.hide()
			DialogManager.start_message(global_position, lines)
	else:
		texture.hide()
		if DialogManager.dialog_box != null:
			DialogManager.dialog_box.queue_free()
			DialogManager.is_message_active = false
	
