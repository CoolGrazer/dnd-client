class_name Entity


var id = 0

var sprite

# 0 would be the action, and 1 and 2 would be the paramaters
# like
# [attack,0,0]
# we are attacking enemy 0, with a unessary last argument
# and also
# [heal,4,1]
# we are healing player 4 with item 1

var turnAction = ["attack",0,0]



var health = 999
var PP
# dungeons and dragons stats
var dStats = [10,10,10,10,10,10]
# str, dex, con, int, cha, rhy

# mother 3 stats
var mStats = [51,41,15,27]
# offense, defense, iq, speed


