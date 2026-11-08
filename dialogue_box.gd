class_name DialogueBox
extends CanvasLayer

@onready var message_label:Label =$PanelContainer/Label
#hind the dialogue when the scene start
func _ready() -> void:
	hide()
#set the message and displays the dialogue
func show_message(message:String)-> void:
	message_label.text = message
	show()
# hide the dialogue
func close_message() -> void:
	hide()
	
