scoreboard players reset " Objective" skyblock_sidebar
# Objective         4
scoreboard players set "    " skyblock_sidebar 4
execute as @a[scores={quest_id=1..}] at @s run scoreboard players reset "    " skyblock_sidebar
execute as @a[scores={quest_id=1..}] at @s run scoreboard players set " Objective" skyblock_sidebar 4
