# Reset
scoreboard players set "   " skyblock-sidebar
scoreboard players reset "§eBreak a log" skyblock-sidebar
scoreboard players reset "§eCraft a workbench" skyblock-sidebar
scoreboard players reset "§eCraft a wood pickaxe" skyblock-sidebar
scoreboard players reset "§eTalk to Jerry" skyblock-sidebar
# 3-1 "Break a log"
execute @a[scores={quest-id=1}] ~ ~ ~ function sidebar/3-1
# 3-2 "[Craft] a workbench"
execute @a[scores={quest-id=2}] ~ ~ ~ function sidebar/3-2
# 3-3 "[Craft] a wood pickaxe"
execute @a[scores={quest-id=3}] ~ ~ ~ function sidebar/3-3
# 3-3 "[Talk] to Jerry"
execute @a[scores={quest-id=4}] ~ ~ ~ function sidebar/3-4
