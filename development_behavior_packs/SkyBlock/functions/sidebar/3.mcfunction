# Reset
scoreboard players set "   " skyblock_sidebar 3
scoreboard players reset "§e Break a log" skyblock_sidebar
scoreboard players reset "§e Craft a workbench" skyblock_sidebar
scoreboard players reset "§e Craft a wood pickaxe" skyblock_sidebar
scoreboard players reset "§e Talk to Jerry" skyblock_sidebar
# 3-1 "Break a log"
execute as @a[scores={quest_id=1}] at @s run function sidebar/3-1
# 3-2 "[Craft] a workbench"
execute as @a[scores={quest_id=2}] at @s run function sidebar/3-2
# 3-3 "[Craft] a wood pickaxe"
execute as @a[scores={quest_id=3}] at @s run function sidebar/3-3
# 3-3 "[Talk] to Jerry"
execute as @a[scores={quest_id=4}] at @s run function sidebar/3-4
