extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func show_box(text: String, callback: Callable) -> void:
	$MainBox/DialogueText.text = text
	while not Input.is_action_just_pressed("Interact"):
		visible = true
		#get_tree().paused = true
	#get_tree().paused = false
	visible = false 
	callback.call()
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
