scoreboard players reset " Objective" skyblock_sidebar
# Objective         4
scoreboard players set "    " skyblock_sidebar 4
execute @a[scores={quest_id=1..}] ~ ~ ~ scoreboard players reset "    " skyblock_sidebar
execute @a[scores={quest_id=1..}] ~ ~ ~ scoreboard players set " Objective" skyblock_sidebar 4
