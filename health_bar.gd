extends Control

func _ready():
	pass
	
func update_health(amount: int):
	$ProgressBar.value -= amount

func update_ammo(amount: int):
	$AmmoLabel.text = str(amount)

func update_health_p1(amount: int):
	$Control/ProgressBar.value -= amount

func update_health_p2(amount: int):
	$Control2/ProgressBar.value -= amount

func update_health_p3(amount: int):
	$Control3/ProgressBar.value -= amount
	
func update_health_p4(amount: int):
	$Control4/ProgressBar.value -= amount
