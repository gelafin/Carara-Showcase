extends RichTextLabel

func _ready():
	var dynamic_font = DynamicFont.new()
	dynamic_font.font_data = load("res://Assets/Fonts/Raleway/Raleway-Black.ttf")
	dynamic_font.size = 64
	$"Title".set("custom_fonts/font", dynamic_font)
