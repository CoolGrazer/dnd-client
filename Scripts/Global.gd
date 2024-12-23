extends Node

var Players = []
var Enemies = []

# use the players and enemies array in the turnOrder array to find an order to put these boys in
var turnOrder = []
# the enemy AI and players choices will decide this. this may or may not be shuffled after the turn order is decided

var turnIndx = 0

func _physics_process(delta):
	_getTurnOrder()
	
	if Input.is_action_just_pressed("ui_accept"):
		_commenceTurns()
	
# do the weird 50 percent bs later
func _getTurnOrder():
	var allEntites = []
	
	for x in Enemies:
		allEntites.append([x,x.mStats[3]])
	
	for x in Players:
		allEntites.append([x,x.mStats[3]])
	

	
	allEntites.sort()
	#allEntites.reverse()
	turnOrder = allEntites
	
	
# clean up search method later
func _commenceTurns():
	for x in turnOrder:
		var action = x[0].turnAction
		var player
		

# implement dodging later

func _calculateDamageToEnemy(playerIndex,enemyIndex,attackLevel):
	
	var playerOffense = Global.Players[playerIndex].mStats[0]
	var enemyDefense = Global.Enemies[enemyIndex].mStats[1]
	var damage = (playerOffense * attackLevel) - enemyDefense
	damage *= randf_range(0.75,1.25)
	if randi_range(1,20) == 1:
		damage = (4 * playerOffense) - enemyDefense
		print(damage)
	damage = round(damage)
	
	return damage

func _calculateDamageToPlayer(playerIndex,enemyIndex,attackLevel):
	var enemyOffense = Global.Enemies[enemyIndex].mStats[0]
	var playerDefense = Global.Players[playerIndex].mStats[1]
	var damage = (enemyOffense * attackLevel) - playerDefense
	damage *= randf_range(0.75,1.25)
	if randi_range(1,20) == 1:
		damage = (4 * enemyOffense) - playerDefense
		print(damage)
	damage = round(damage)
	return damage
