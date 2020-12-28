extends AnimationPlayer
tool

"""
To use, slap this on an animation player, and it'll make all your bezier curves sinusoidal.
WARNING: NO UNDO, and I haven't tested this with non bezier curve animations
"""
func _ready():
	if Engine.editor_hint:
		for anim_name in get_animation_list():
			var anim : Animation = get_animation(anim_name)
			for track_i in anim.get_track_count():
	#			var track_name : String = anim.track_get_path(track_i)
	#			print(track_name)
				var key_count : int = anim.track_get_key_count(track_i)
				for key_idx in key_count:
					var key_before : int = key_idx - 1
					var key_after : int = key_idx + 1
	#				print(key_idx)
					var key_time : float = anim.track_get_key_time(track_i, key_idx)
					var time: float
					if key_before >= 0:
						time = anim.track_get_key_time(track_i, key_before) - key_time
						anim.bezier_track_set_key_in_handle(track_i, key_idx, Vector2(time / 2, 0))
#						print(Vector2(time / 2, 0), "  ", key_after)
					if key_after < key_count:
						time = anim.track_get_key_time(track_i, key_after) - key_time
						anim.bezier_track_set_key_out_handle(track_i, key_idx, Vector2(time / 2, 0))
#						print(Vector2(time / 2, 0), "  ", key_after)
#				print()


