scoreboard players reset Objective skyblock-sidebar
# Objective         4
scoreboard players set "    " skyblock-sidebar 4
execute @a[scores={quest-id=1..}] ~ ~ ~ scoreboard players reset "    " skyblock-sidebar
execute @a[scores={quest-id=1..}] ~ ~ ~ scoreboard players set Objective skyblock-sidebar 4
