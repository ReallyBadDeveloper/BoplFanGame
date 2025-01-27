extends Sprite2D

var player_in_range = false
@onready var dialogue_box = $CanvasLayer/DialogueBox
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func text_callback() -> void:
	print("hi")
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Interact") and player_in_range:
		dialogue_box.show_box("sigma",Callable(self,"text_callback"))
	pass


func _on_interact_zone_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		player_in_range = true
	pass # Replace with function body.


func _on_interact_zone_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		player_in_range = false
	pass # Replace with function body.
