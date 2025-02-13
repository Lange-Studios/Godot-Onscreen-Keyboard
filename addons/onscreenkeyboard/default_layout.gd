extends "keyboard_layout.gd"

func _init():
	data = {
		"debug": false,
		"layouts": [
		{
			"name": "standart-characters",
			"rows": [
			make_row(
				[],
				"qwertyuiop",
				[
					{
						"type": "special",
						"output": "Backspace",
						"display-icon": "PREDEFINED:DELETE",
						"stretch-ratio": 1.5,
						"button-icon": "res://scenes/controller_icons/gamepad_icon.tres",
						"action": "gamepad_virtual_keyboard_back",
						"alignment": "right",
						"hbox-alignment": 2
					}
				]
			),
			make_row(
				[],
				"asdfghjkl",
				[{
					"output": "Return",
					"display": "Enter",
					"stretch-ratio": 1.5,
					"button-icon": "res://scenes/controller_icons/gamepad_icon.tres",
					"action": "gamepad_virtual_keyboard_enter",
					"alignment": "right",
					"hbox-alignment": 2,
					"text-alignment": 0,
				}]
			),
			make_row(
				[{
					"type": "special-shift",
					"display-icon": "PREDEFINED:SHIFT",
					"stretch-ratio": 1.5,
				}],
				"zxcvbnm",
				[{
					"type": "special-shift",
					"display-icon": "PREDEFINED:SHIFT",
					"stretch-ratio": 2,
					"button-icon": "res://scenes/controller_icons/gamepad_icon.tres",
					"action": "gamepad_virtual_keyboard_shift",
					"alignment": "right",
					"hbox-alignment": 2
				}]
			),
			{
				"keys": [
				{
					"type": "switch-layout",
					"layout-name": "special-characters",
					"display": "&123",
					"stretch-ratio": 1.5
				},
				{
					"type": "char",
					"output": ",",
					"display": ","
				},
				{
					"type": "char",
					"output": "Space",
					"stretch-ratio": 5,
					"button-icon": "res://scenes/controller_icons/gamepad_icon.tres",
					"action": "gamepad_virtual_keyboard_space",
					"alignment": "left"
				},
				{
					"type": "char",
					"output": ".",
					"display": "."
				},
				{
					"type": "special-hide-keyboard",
					"display-icon": "PREDEFINED:HIDE",
					"stretch-ratio": 2,
					"button-icon": "res://scenes/controller_icons/gamepad_icon.tres",
					"action": "ui_cancel",
					"alignment": "right",
					"hbox-alignment": 2
				}
				]
			}
			]
		},
		{
			"name": "special-characters",
			"rows": [
			make_row(
				[],
				"1234567890",
				[
					{
						"type": "special",
						"output": "Backspace",
						"display-icon": "PREDEFINED:DELETE",
						"stretch-ratio": 1.5,
						"button-icon": "res://scenes/controller_icons/gamepad_icon.tres",
						"action": "gamepad_virtual_keyboard_back",
						"alignment": "right",
						"hbox-alignment": 2
					}
				]
			),
			make_row(
				[],
				"@#$%&-+=~()",
				[{
					"type": "special",
					"output": "Return",
					"display": "Enter",
					"stretch-ratio": 2,
					"button-icon": "res://scenes/controller_icons/gamepad_icon.tres",
					"action": "gamepad_virtual_keyboard_enter",
					"alignment": "right",
					"hbox-alignment": 2,
					"text-alignment": 0,
				}]
			),
			make_row(
				[],
				"*\"':;!?<>{}[]",
				[]
			),
			make_row(
				[{
					"type": "switch-layout",
					"layout-name": "standart-characters",
					"display": "ABC",
					"stretch-ratio": 1.5
				}],
				"",
				[
					{
						"type": "char",
						"output": "_",
						"display": "_"
					},
					{
						"type": "char",
						"output": "/",
						"display": "/"
					},
					{
						"type": "char",
						"output": "Space",
						"stretch-ratio": 5,
						"button-icon": "res://scenes/controller_icons/gamepad_icon.tres",
						"action": "gamepad_virtual_keyboard_space",
						"alignment": "left"
					},
					{
						"type": "special-hide-keyboard",
						"display-icon": "PREDEFINED:HIDE",
						"stretch-ratio": 2,
						"button-icon": "res://scenes/controller_icons/gamepad_icon.tres",
						"action": "ui_cancel",
						"alignment": "right",
						"hbox-alignment": 2
					}
				]
			)
			]
		}
		]
	}
