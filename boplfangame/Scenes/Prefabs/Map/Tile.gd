extends Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if get_meta("CollisionEnabled") == false:
		$StaticBody2D/CollisionShape2D.disabled = true
	if get_meta("CollisionEnabled") == true:
		$StaticBody2D/CollisionShape2D.disabled = false
	if get_meta("Harmful") == false:
		$Area2D/HarmfulShape2D.disabled = true
	if get_meta("Harmful") == true:
		$Area2D/HarmfulShape2D.disabled = false
		$StaticBody2D/CollisionShape2D.disabled = true
	pass
	


func _on_collide_with_oofy_boi(body: Node2D) -> void:
	if get_meta("Harmful"):
		if body.name == "Player":
			body.position = body.get_meta("SpawnPosition")
	pass # Replace with function body.
