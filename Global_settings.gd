extends Node

func Set_MaV_vollume(value):
	AudioServer.set_bus_volume_db(0, value -100)

func Set_music_vollume(value):
	AudioServer.set_bus_volume_db(1, value -100)

func Set_SFX_vollume(value):
	AudioServer.set_bus_volume_db(2, value -100)

func Toggle_fullscreen(value):
	OS.window_fullscreen = value


