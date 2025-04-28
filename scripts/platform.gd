extends RigidBody2D

#under [Deactivation] the freeze setting is on
#when body enters area the freeze option turns off
func _on_trigger_area_body_entered(_body) -> void:
	set_deferred("freeze", false)
