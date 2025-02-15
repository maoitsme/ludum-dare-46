extends Node2D

func _ready():
	$options.visible = false

func _process(delta):
	if global.lastRoom == "":
		$buttons/Continue.disabled = true
	else:
		$buttons/Continue.disabled = false

func _on_Continue_pressed():
	get_tree().change_scene(global.lastRoom)
	get_tree().paused = false
	sounds.get_node("pop").play()


func _on_NewGame_pressed():
	get_tree().change_scene("res://rooms/okarinRoom/okarinRoom.tscn")
	get_tree().paused = false
	sounds.get_node("gos").stop()
	sounds.get_node("pop").play()
	sounds.get_node("op").play()
	global.timer = 0
	global.startTimer = true

func _on_Exit_pressed():
	get_tree().quit()
	sounds.get_node("pop").play()


func _on_Options_pressed():
	$options.visible = !$options.visible
	sounds.get_node("pop").play()
