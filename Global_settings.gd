extends Node

func Set_MaV_vollume(value):
	AudioServer.set_bus_volume_db(0, value)

func Set_music_vollume(value):
	AudioServer.set_bus_volume_db(1, value)

func Set_SFX_vollume(value):
	AudioServer.set_bus_volume_db(2, value)

func Toggle_fullscreen(value):
	OS.window_fullscreen = value


