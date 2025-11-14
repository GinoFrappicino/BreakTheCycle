extends Sprite2D


func _ready():
	Dialogic.signal_event.connect(DialogicSignal)

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if get_rect().has_point(to_local(event.position)):
			run_dialogue("CultLeaderTalking")

func run_dialogue(dialogue_string):
	Dialogic.start(dialogue_string)
	
func DialogicSignal(arg: String):
	if arg == "exit_cultLeader":
		pass
