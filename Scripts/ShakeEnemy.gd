extends Node2D

@export var startingAmp = 5
@export var startingSpeed : float = 5

var amp = 0

var velX = 0
var velY = 0

var killed = false

signal dead

var enemy = Enemy.new()

func _ready():
	Global.Enemies.append(enemy)
	enemy._lookUpStats(343939596967)

func _physics_process(delta):
	var m = material.get_shader_parameter("mixRate")
	position.x = 120 + sin(10 + Engine.get_frames_drawn() * startingSpeed) * amp
	amp = move_toward(amp,0,1)
	
	
	if killed == true:
		emit_signal("dead")
		m = move_toward(m,5,0.07)
		material.set_shader_parameter("mixRate",m)
		if m >= 3:
			material.set_shader_parameter("mixRate",-10)
		
		if m >= -9 and m < 0:
			hide()
			killed = false
	
	$Label4.text = str(enemy.health)
	if enemy.health < 0:
		killed = true





func _on_center_hit(number, damage):
	
	amp = startingAmp + (number * 1)
	enemy.health -= damage
