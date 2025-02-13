extends Button

var key_data

signal released
signal down

var icon_tex_rect
var is_pressing: bool = false

func _unhandled_input(event: InputEvent) -> void:
	if not is_visible_in_tree():
		return

	if not key_data.has("action"):
		return

	if (event.is_action_released(key_data.action)):
		is_pressing = false;
		return

	if is_pressing:
		return

	if not event.is_action_pressed(key_data.action):
		return;

	is_pressing = true;
	_on_button_down()
	_on_button_up()
	accept_event()

func _init(_key_data):
	key_data = _key_data
	button_down.connect(_on_button_down)
	button_up.connect(_on_button_up)
	item_rect_changed.connect(_on_item_rect_changed)

	size_flags_horizontal = SIZE_EXPAND_FILL
	size_flags_vertical = SIZE_EXPAND_FILL

	focus_mode = Control.FOCUS_ALL

	if key_data.has("display"):
		text = key_data.get("display")

	if key_data.has("stretch-ratio"):
		size_flags_stretch_ratio = key_data.get("stretch-ratio")

	if key_data.has("button-icon"):
		var button_icon = load(key_data.get("button-icon")).duplicate()
		button_icon.path = key_data.get("action")
		icon_tex_rect = TextureRect.new()
		icon_tex_rect.ignore_texture_size = true
		icon_tex_rect.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
		icon_tex_rect.expand_mode = TextureRect.EXPAND_FIT_WIDTH
		icon_tex_rect.texture = button_icon
		var texture_container = HBoxContainer.new()
		texture_container.name = "texture_container"
		texture_container.set_anchors_preset(Control.PRESET_FULL_RECT)
		if key_data.has("hbox-alignment"):
			texture_container.alignment = key_data.get("hbox-alignment")
		if key_data.has("text-alignment"):
			alignment = key_data.get("text-alignment")
		add_child(texture_container)
		texture_container.add_child(icon_tex_rect)
		# self.icon_alignment = key_data.get("horizontal-alignment")
		# self.expand_icon = true


func set_icon_color(color):
	if icon_tex_rect != null:
		icon_tex_rect.modulate = color


func set_icon(texture):
	icon_tex_rect = TextureRect.new()
	icon_tex_rect.ignore_texture_size = true
	icon_tex_rect.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	icon_tex_rect.expand_mode = TextureRect.EXPAND_FIT_WIDTH
	icon_tex_rect.texture = texture
	var texture_container: HBoxContainer = get_node_or_null("texture_container")
	if texture_container == null:
		add_child(icon_tex_rect)
	else:
		texture_container.add_child(icon_tex_rect)
		if key_data.has("alignment") and key_data.alignment == "right":
			texture_container.move_child(icon_tex_rect, 0)


func change_uppercase(value):
	if value:
		if key_data.has("display-uppercase"):
			text = key_data.get("display-uppercase")
	else:
		if key_data.has("display"):
			text = key_data.get("display")


func _on_item_rect_changed():
	if icon_tex_rect != null:
		icon_tex_rect.size = size


func _on_button_up():
	released.emit(key_data)


func _on_button_down():
	down.emit(key_data)
