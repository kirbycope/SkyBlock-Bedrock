# Reset
scoreboard players set "   " skyblock_sidebar 3
scoreboard players reset "§e Break a log" skyblock_sidebar
scoreboard players reset "§e Craft a workbench" skyblock_sidebar
scoreboard players reset "§e Craft a wood pickaxe" skyblock_sidebar
scoreboard players reset "§e Talk to Jerry" skyblock_sidebar
# 3-1 "Break a log"
execute @a[scores={quest_id=1}] ~ ~ ~ function sidebar/3-1
# 3-2 "[Craft] a workbench"
execute @a[scores={quest_id=2}] ~ ~ ~ function sidebar/3-2
# 3-3 "[Craft] a wood pickaxe"
execute @a[scores={quest_id=3}] ~ ~ ~ function sidebar/3-3
# 3-3 "[Talk] to Jerry"
execute @a[scores={quest_id=4}] ~ ~ ~ function sidebar/3-4
