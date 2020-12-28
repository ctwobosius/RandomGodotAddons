tool
extends Spatial

"""
To use, slap this on spatial with mesh instance children, and all the children should get a static body collision shape
WARNING: NO UNDO, and I haven't tested this extensively (not sure if it'll crash anything if for example you have a bad mesh)
"""

func _ready() -> void:
	if Engine.editor_hint:
		for child in get_children():
			if child is MeshInstance:
				var mesh: MeshInstance = child
				mesh.create_trimesh_collision()
				
