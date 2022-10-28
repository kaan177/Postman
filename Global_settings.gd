extends Node

func Set_MaV_vollume(value):
	if value == 0:
		AudioServer.set_bus_mute(0, true)
	AudioServer.set_bus_volume_db(0, value -30)

func Set_music_vollume(value):
	if value == 0:
		AudioServer.set_bus_mute(1, true)
	AudioServer.set_bus_volume_db(1, value -30)

func Set_SFX_vollume(value):
	if value == 0:
		AudioServer.set_bus_mute(2, true)
	AudioServer.set_bus_volume_db(2, value -30)




func Toggle_fullscreen(value):
	OS.window_fullscreen = value


